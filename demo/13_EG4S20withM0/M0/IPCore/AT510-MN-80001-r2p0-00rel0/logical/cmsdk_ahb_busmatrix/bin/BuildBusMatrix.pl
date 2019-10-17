eval "exec perl -w -S $0 $@" # -*- Perl -*-
  if ($running_under_some_sh);
  undef ($running_under_some_sh);

################################################################################
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited.
#
#   (C) COPYRIGHT 2001-2017 ARM Limited.
#       ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited.
#
################################################################################
# Version and Release Control Information:
#
#      File Name           : $RCSfile: BuildBusMatrix.pl,v $
#
#      SVN Information
#
#      Checked In          : $Date: 2013-04-22 12:29:46 +0100 (Mon, 22 Apr 2013) $
#
#      Revision            : $Revision: 244816 $
#
#      Release Information : CM3DesignStart-r0p0-02rel0
#
################################################################################

################################################################################
# Purpose             : Builds particular configurations of the AHB BusMatrix
#
# Cortex-M System Design Kit-r1p0-01rel0
#         * updated for Perl version compatibility
#         * fixed for Single OutputStage errors
################################################################################
# Usage:
#    Builds an AHB Bus Matrix component with a given number of input ports,
#    a given number of output ports, a particular arbitration scheme and ARM
#    processor interface.
#
# Notes: This version of the script uses an interface information hash with
#         the following structure:
#
#         my %InterfaceInfo = (
#                               SLAVES  => {
#                                 SI<n> => {
#                                   NAME => '@name',
#                                   CONNECTIONS => [ @MI<n> ... ],
#                                   ADDRESS_MAP => {
#                                     NORMAL => [ <address_info> ... ],
#                                     REMAP => [ <remap_info> ... ]
#                                   }
#                                 }
#                               },
#
#                               MASTERS => {
#                                 MI<n> => {
#                                   NAME        => '@name',
#                                   CONNECTIONS => [ @SI<n> ... ]
#                                 }
#                               }
#                             );
#
# Options: See the ShowHelp() function.
#
################################################################################

# ------------------------------------------------------------------------------
#   Load PERL libraries
# ------------------------------------------------------------------------------

use strict;
use warnings;
use Getopt::Long;

use lib 'bin/lib';                     # Collapse namespace 'lib::'
use xmlparser;                         # Load the XML parser module


# ------------------------------------------------------------------------------
#   Declare global variables
# ------------------------------------------------------------------------------

# General script variables
my $Debug         = 0;
my $Errors        = 0;
my $HdlType       = 'verilog';
my $HdlExt        = '.v';
my $Connections   = '';
my $Sparse        = 0;
my $DefaultSlave  = 'cmsdk_ahb_bm_default_slave';

# Parameter legal ranges
my $MinSlaveIF    = 1;
my $MaxSlaveIF    = 16;
my $MinMasterIF   = 1;
my $MaxMasterIF   = 16;
my $DataWidths    = '32|64';
my $MinNameLength = 1;
my $MaxNameLength = 24;
my $MinUserWidth  = 0;
my $MaxUserWidth  = 32;
my $MinAddrWidth  = 32;
my $MaxAddrWidth  = 64;

# Interface ID tags (updated later)
my $IdWidthMI = 4;
my $IdWidthSI = 4;

# Interface information hash
my %InterfaceInfo = ();

# Get the run date and correct offset
my ( $Sec, $Min, $Hour, $Mday, $Mon, $Year ) = localtime(time); $Year+=1900; $Mon++;

# Filename variables
my %FileList = ();
my ($Scriptname) = $0 =~ /([\w\.]+)$/;

# Hash for search and replacement of macros
my %Macro = ();

# Hash for processing text sections
my %Section = ();

# Arrays of instance names
my @MatrixDecodeNames = ();
my @OutputArbNames    = ();
my @OutputStageNames  = ();

# Hash for remapping information
my %RemapInfo = ();

# Hash array of name aliases
my %NameAliases = ();

# IP-XACT component name - default value is set later
my $ComponentName = '';


# ------------------------------------------------------------------------------
#   Check for pre-requisites
# ------------------------------------------------------------------------------

# Check for the supported OS platform(s)
unless ( $^O =~ /(solaris|linux)\b/ ) {
  die "Error: This script does not support the '$^0' OS!\n\n";
}

# Check for the required version of PERL
unless ( $] >= 5.005 ) {
  die "Error: This script requires PERL version >= 5.005!\n\n";
}

# Check system clock for inappropriate roll-back - the date is used
#  in the copyright field of file headers
unless ( $Year >= 2013 ) {
  warn "Warning: The system clock is incorrectly set to '$Year'!\n";
  $Year = 2013;
}


# ------------------------------------------------------------------------------
#   Parse the command line
# ------------------------------------------------------------------------------

# Default values for command-line options
my $SlaveInterfaces      = 1;
my $MasterInterfaces     = 1;
my $Connectivity         = 'full';
my $ArbiterType          = 'fixed';
my $ArchitectureType     = 'ahb2';
my $XmlConfigFile        = '';
my $RoutingDataWidth     = 32;
my $RoutingAddressWidth  = 32;
my $UserSignalWidth      = 0;
my $OutputArbName        = 'cmsdk_ahb_bm_output_arb';
my $OutputStageName      = 'cmsdk_ahb_bm_output_stage';
my $MatrixDecodeName     = 'cmsdk_ahb_bm_decode';
my $InputStageName       = 'cmsdk_ahb_bm_input_stage';
my $BusMatrixName        = '';                  # Default value is set later
my $Help                 = 0;
my $Verbose              = 0;
my $SourceDir            = "./$HdlType/src";
my $TargetDir            = "./$HdlType/built";
my $XmlDir               = './xml';
my $Overwrite            = 0;
my $NoTimescales         = 0;
my $CheckMode            = 0;
my $Spirit               = 0;

# Get command line arguments
GetOptions( 'inports=i'      => \$SlaveInterfaces,
            'outports=i'     => \$MasterInterfaces,
            'connectivity=s' => \$Connectivity,
            'arb=s'          => \$ArbiterType,
            'arch=s'         => \$ArchitectureType,
            'cfg=s'          => \$XmlConfigFile,
            'datawidth=i'    => \$RoutingDataWidth,
            'addrwidth=i'    => \$RoutingAddressWidth,
            'userwidth=i'    => \$UserSignalWidth,
            'outputarb=s'    => \$OutputArbName,
            'outputstage=s'  => \$OutputStageName,
            'matrixdecode=s' => \$MatrixDecodeName,
            'inputstage=s'   => \$InputStageName,
            'busmatrix=s'    => \$BusMatrixName,
            'help'           => \$Help,
            'verbose'        => \$Verbose,
            'srcdir=s'       => \$SourceDir,
            'tgtdir=s'       => \$TargetDir,
            'xmldir=s'       => \$XmlDir,
            'overwrite'      => \$Overwrite,
            'notimescales'   => \$NoTimescales,
            'check'          => \$CheckMode,
            'spirit'         => \$Spirit
          );

# Display script header when in verbose mode
if ( $Verbose ) {
  printf "\n==============================================================\n" .
         "= This confidential and proprietary software may be used only\n" .
         "= as authorised by a licensing agreement from ARM Limited\n" .
         "=    (C) COPYRIGHT 2001-2013 ARM Limited\n" .
         "=          ALL RIGHTS RESERVED\n" .
         "= The entire notice above must be reproduced on all authorised\n" .
         "= copies and copies may only be made to the extent permitted\n" .
         "= by a licensing agreement from ARM Limited\n" .
         "=\n" .
         "= $Scriptname\n" .
         "=\n" .
         "= Run Date : %02d/%02d/%04d %02d:%02d:%02d" .
         "\n==============================================================\n\n",
         $Mday, $Mon, $Year, $Hour, $Min, $Sec;
}

# Display usage message if requested
if ( $Help ) { ShowHelp(); }


# ------------------------------------------------------------------------------
#   Parse the configuration file if specified, or initialise by elaborating
#    the '-connectivity' command-line argument and calculating an address map
# ------------------------------------------------------------------------------

if ( $XmlConfigFile ne '' ) {
  # Conditionally prepend the XML directory path to the filename
  if ( $XmlConfigFile !~ /^$XmlDir/ ) { $XmlConfigFile = "$XmlDir/$XmlConfigFile"; }
  $XmlConfigFile = TidyPath($XmlConfigFile);

  # Configure and run the XML parser
  ProcessXmlConfigFile();
} else {
  # Translate into internal form, the design specified on the command line
  InitialiseInterfaceInfo();
}

# Set the default top-level name if required
if ( $BusMatrixName eq '' ) {
  $BusMatrixName = sprintf( "cmsdk_ahb_busmatrix%dx%d%s%dd%da%du", $SlaveInterfaces,
                     $MasterInterfaces, substr($ArbiterType, 0, 1),
                     $RoutingDataWidth, $RoutingAddressWidth, $UserSignalWidth );
}

# Set the default IP-XACT component name if required
if ( $ComponentName eq '' ) { $ComponentName = $BusMatrixName . "_lite"; }


# ------------------------------------------------------------------------------
#   Validate the parameters and abort if necessary
# ------------------------------------------------------------------------------

ValidateParameters();
if ( $Errors ) { die "\nBuild not started because of parameter errors!\n\n"; }


# ------------------------------------------------------------------------------
#   Determine calculated parameters
# ------------------------------------------------------------------------------

SelectParameters();


# ------------------------------------------------------------------------------
#   Display settings when in verbose mode
# ------------------------------------------------------------------------------

if ( $Verbose ) {
  printf "Script accepted the following parameters:\n\n" .
         "%s - Top-level name          : '$BusMatrixName'\n" .
         " - Slave interfaces        : $SlaveInterfaces\n" .
         " - Master interfaces       : $MasterInterfaces\n" .
         " - Architecture type       : '$ArchitectureType'\n" .
         " - Arbitration scheme      : '$ArbiterType'\n" .
         " - Address map             : %s\n" .
         " - Connectivity mapping    : %s\n" .
         " - Connectivity type       : %s\n" .
         " - Routing data width      : $RoutingDataWidth\n" .
         " - Routing address width   : $RoutingAddressWidth\n" .
         " - User signal width       : $UserSignalWidth\n" .
         " - Configuration directory : '$TargetDir'\n" .
         " - Source directory        : '$SourceDir'\n" .
         " - Overwrite mode          : %s\n\n",
         ( $XmlConfigFile ne '' ) ? " - Configuration file      : '$XmlConfigFile'\n" : '',
         ( $XmlConfigFile ne '' ) ? 'user defined' : 'calculated',
         ( $Connectivity ne 'full' ) ? $Connections : 'automatic',
         ( $Sparse ) ? 'sparse' : 'full',
         ( $Overwrite ) ? 'enabled' : 'disabled';
}


# ------------------------------------------------------------------------------
#   Expand template macros if not in check mode
# ------------------------------------------------------------------------------

unless ( $CheckMode ) { CreateBusMatrix(); }


################################################################################
### Subroutines and Functions ##################################################
################################################################################

# ------------------------------------------------------------------------------
#   SelectParameters - Selects the corresponding parameter set according to
#                       the fundamental specification
# ------------------------------------------------------------------------------
sub SelectParameters {

  # Local variable(s)
  my $Instance     = '';
  my $Index        = 0;
  my $Interface    = '';
  my %Arbiter      = ( fixed => 'cmsdk_ahb_bm_fixed_arb', round => 'cmsdk_ahb_bm_round_arb', burst => 'cmsdk_ahb_bm_burst_arb' );
  my $ArbType      = '';
  my $OutType      = '';
  my $BstrbWidth   = $RoutingDataWidth / 8;
  my $MakefileName = 'makefile';
  my $MkfileName   = 'cmsdk_ahb_busmatrix.mk';
  my $SpiritFile   = 'cmsdk_ahb_busmatrix_spirit.xml';
  my $Mappings     = $Connections;
  my $Packing      = ' ' x 14;
  my $RemapBit     = 0;
  my $OpenBr       = '';
  my $CloseBr      = '';
  my @RemapBits    = ();

  # Determine the connectivity type
  $Sparse = IsSparse();

  # Determine the slave interface ID width
  $IdWidthSI = NumberOfDigits($SlaveInterfaces - 1, 2);

  # Determine the master interface ID width, including an MSbit for
  #  selecting the default slave
  $IdWidthMI = NumberOfDigits($MasterInterfaces - 1, 2) + 1;

  # Format the mappings
  $Mappings =~ s/\n/\n\/\//g;

  # Determine single entity filenames
  #$FileList{$MkfileName} = $MkfileName;     # Note:Generation of ADK makefile is not required in BP210
  #$FileList{$MakefileName} = $MakefileName; # Note:Generation of ADK makefile is not required in BP210
  if ( $Spirit ) { $FileList{$ComponentName . '.xml'} = $SpiritFile; }
  $DefaultSlave = $BusMatrixName . '_default_slave';
  $FileList{$BusMatrixName . $HdlExt} = 'cmsdk_ahb_busmatrix' . $HdlExt;
  $FileList{$ComponentName . $HdlExt} = 'cmsdk_ahb_busmatrix_lite' . $HdlExt;
  $FileList{$InputStageName . $HdlExt} = 'cmsdk_ahb_bm_input_stage' . $HdlExt;
  $FileList{$DefaultSlave . $HdlExt} = 'cmsdk_ahb_bm_default_slave' . $HdlExt;

  # Generate filenames and macro names for each instance of bm_decode
  #  and process any REMAP declarations accordingly
  for ( $Index = 0; $Index < $SlaveInterfaces; $Index++ ) {
    $Interface = 'SI' . $Index;

    $Instance = $MatrixDecodeName . $InterfaceInfo{SLAVES}{$Interface}{NAME};
    $FileList{$Instance . $HdlExt} = 'cmsdk_ahb_bm_decode' . $HdlExt;
    push @MatrixDecodeNames, $Instance;

    $RemapInfo{$Interface}{REMAP_BITS} = [];
    $RemapInfo{$Interface}{REMAP_WIDTH} = 0;
    @RemapBits = ();
    for ( $RemapBit = 0; $RemapBit < 4; $RemapBit++ ) {
      if ( grep /:remap$RemapBit:/,
             @{ $InterfaceInfo{SLAVES}{$Interface}{ADDRESS_MAP}{REMAP} } ) {
        push @RemapBits, "REMAP[$RemapBit]";
        push @{ $RemapInfo{$Interface}{REMAP_BITS} }, $RemapBit;
        $RemapInfo{$Interface}{REMAP_WIDTH}++;
      }
    }
    $OpenBr = ( $RemapInfo{$Interface}{REMAP_WIDTH} > 1 ) ? '{ ' : '';
    $CloseBr = ( $RemapInfo{$Interface}{REMAP_WIDTH} > 1 ) ? ' }' : '';
    $RemapInfo{$Interface}{REMAP_PORT} = $OpenBr . join( ', ', reverse @RemapBits ) . $CloseBr;
  }

  # Determine names for the output_arb and output_stage instances
  if ( $Sparse ) {

    # Generate filenames and macro names for each instance of output_stage and
    #  output_arb modules
    for ( $Index = 0; $Index < $MasterInterfaces; $Index++ ) {
      $Interface = 'MI' . $Index;

      # If the current output stage has only one connection, then override
      #  the template selection for the arbiter type and output stage
      $ArbType = $Arbiter{$ArbiterType}; $OutType = 'cmsdk_ahb_bm_output_stage';
      unless ( @{ $InterfaceInfo{MASTERS}{$Interface}{CONNECTIONS} } > 1 ) {
        $ArbType = 'cmsdk_ahb_bm_single_arb'; $OutType = 'cmsdk_ahb_bm_single_output_stage';
      }

      $Instance = $OutputArbName . $InterfaceInfo{MASTERS}{$Interface}{NAME};
      $FileList{$Instance . $HdlExt} = $ArbType . $HdlExt;
      push @OutputArbNames, $Instance;
      $Instance = $OutputStageName . $InterfaceInfo{MASTERS}{$Interface}{NAME};
      $FileList{$Instance . $HdlExt} = $OutType . $HdlExt;
      push @OutputStageNames, $Instance;

    }

  } else {

    # The same output_stage and output_arb modules are used in a fully connected
    #  bus matrix
    $FileList{$OutputArbName . $HdlExt} = $Arbiter{$ArbiterType} . ${HdlExt};
    push @OutputArbNames, $OutputArbName;
    $FileList{$OutputStageName . $HdlExt} = 'cmsdk_ahb_bm_output_stage' . ${HdlExt};
    push @OutputStageNames, $OutputStageName;

    # Initialise particular static instance names
    $Macro{'output_arb_name'} = $OutputArbName;
    $Macro{'output_stage_name'} = $OutputStageName;
    $Macro{'output_stage_name_lc'} = lc($Macro{'output_stage_name'});

  }

  # Conditionally initialise the macro and section control hashes

  # Determine architecture options
  if ( $ArchitectureType =~ /^(v6|excl)$/ ){
    $Section{'excl'}         = 1;
    $Macro{'prot'}           = 5;
    $Macro{'prot_v'}         = 6;
    $Macro{'resp'}           = 2;
    $Macro{'resp_v'}         = 3;
    $Macro{'bin_resp_xfail'} = '100';
  } else {
    $Section{'excl'}         = 0;
    $Macro{'prot'}           = 3;
    $Macro{'prot_v'}         = 4;
    $Macro{'resp'}           = 1;
    $Macro{'resp_v'}         = 2;
    $Macro{'bin_resp_xfail'} = 'xx';
  }

  # Determine response encoding
  $Macro{'bin_resp_okay'}  = substr( '000', -$Macro{'resp_v'}, $Macro{'resp_v'} );
  $Macro{'bin_resp_error'} = substr( '001', -$Macro{'resp_v'}, $Macro{'resp_v'} );
  $Macro{'bin_resp_retry'} = substr( '010', -$Macro{'resp_v'}, $Macro{'resp_v'} );
  $Macro{'bin_resp_split'} = substr( '011', -$Macro{'resp_v'}, $Macro{'resp_v'} );

  # Determine HUNALIGN support and xUSER width
  $Section{'unalign'} = ( $ArchitectureType =~ /^(v6|unalign)$/ ) ? 1 : 0;
  $Section{'user'}    = ( $UserSignalWidth > 0 ) ? 1 : 0;

  # Bus width fields
  $Macro{'data'}    = $RoutingDataWidth - 1;
  $Macro{'data_v'}  = $RoutingDataWidth;
  $Macro{'addr'}    = $RoutingAddressWidth - 1;
  $Macro{'addr_v'}  = $RoutingAddressWidth;
  $Macro{'user'}    = $UserSignalWidth - 1;
  $Macro{'user_v'}  = $UserSignalWidth;
  $Macro{'bstrb'}   = $BstrbWidth - 1;
  $Macro{'bstrb_v'} = $BstrbWidth;

  # Interface ID-width fields
  $Macro{'idw_si'}   = $IdWidthSI - 1;
  $Macro{'idw_si_v'} = $IdWidthSI;
  $Macro{'idw_mi'}   = $IdWidthMI - 1;
  $Macro{'idw_mi_v'} = $IdWidthMI;

  # Determine default slave selection encoding (can be up to 5 bits)
  $Macro{'dsid_bin'} = substr('10000', 0, $IdWidthMI);

  # Determine a list of sub-module names
  $Macro{'other_module_names'} = $DefaultSlave . " \\\n$Packing" .
                                 $InputStageName . " \\\n$Packing" .
                                 join( " \\\n$Packing", @MatrixDecodeNames ) .
                                 " \\\n$Packing" .
                                 join( " \\\n$Packing", @OutputArbNames ) .
                                 " \\\n$Packing" .
                                 join( " \\\n$Packing", @OutputStageNames );

  # Initialise the static instance names
  $Macro{'bus_matrix_name'} = $BusMatrixName;
  $Macro{'input_stage_name'} = $InputStageName;
  $Macro{'output_arb_stemname'} = $OutputArbName;
  $Macro{'output_stage_stemname'} = $OutputStageName;
  $Macro{'matrix_decode_stemname'} = $MatrixDecodeName;
  $Macro{'component_name'} = $ComponentName;

  # Miscellaneous fields
  $Macro{'copyright_year'} = $Year;
  $Macro{'timescale_directive'} = ( $NoTimescales ) ? '' : '`timescale 1ns/1ps';
  $Macro{'arbiter_type'} = $ArbiterType;
  $Macro{'architecture_type'} = $ArchitectureType;
  $Macro{'total_si'} = $SlaveInterfaces;
  $Macro{'total_mi'} = $MasterInterfaces;
  $Macro{'connectivity'} = ( $Sparse ) ? 'sparse' : 'full';
  $Macro{'mappings'} = ( $Sparse ) ? $Mappings :
    sprintf("S<0..%d> -> M<0..%d>", $SlaveInterfaces - 1, $MasterInterfaces - 1);

}


# ------------------------------------------------------------------------------
#   CreateBusMatrix - Creates a version of the Bus Matrix using the currently
#                      selected parameter set
# ------------------------------------------------------------------------------
sub CreateBusMatrix {

  # Local variable(s)
  my $VariantDir    = "$TargetDir/$BusMatrixName";
  my @ExistingFiles = glob( "$VariantDir/*" );
  my @NewFiles      = keys( %FileList );
  my $File          = '';

  # Determine target preparation
  if ( -e $VariantDir ) {
    # Delete files when in overwrite mode, otherwise display an error
    if ( $Overwrite ) {
      foreach $File ( @ExistingFiles ) {
        print "Deleting the '$File' file...\n" if ( $Verbose );
        unlink $File or die "Error: Could not delete the file!\n\n";
      }
      print "\n" if ( @ExistingFiles and $Verbose );
    } else {
      die "Error: This variant of the bus matrix already exists!\n\n";
    }
  } else {
    # Create the output directory for this Bus Matrix variant
    mkdir $VariantDir or
     die "Error: Could not create the output directory '$VariantDir'!\n\n";
  }

  # Process all required files
  print "Creating the bus matrix variant...\n\n" if ( $Verbose );
  foreach $File ( @NewFiles ) {
    print " - Rendering '$File'\n" if ( $Verbose );
    RenderFile( "$SourceDir/$FileList{$File}", "$VariantDir/$File" );
  }

  print "\nDone!\n\n" if ( $Verbose );

}


# ------------------------------------------------------------------------------
#   RenderFile - Processes nested sections embedded hierarchically within the
#                 specified template file, and expands macros accordingly. The
#                 variables '$SlaveIF' and '$MasterIF' have a reserved use
#                 depending upon the template being rendered. The variables may
#                 be assigned values from 'in' or 'out' sections, or assigned
#                 to a value extracted from a port-specific target filename. In
#                 all other cases, these variables just retain their values
# ------------------------------------------------------------------------------
sub RenderFile {

  # Passed parameter 1 is the template filename
  my $TemplateFile = shift;
  # Passed parameter 2 is the rendered output filename
  my $RenderedFile = shift;

  # Local variable(s)
  my $TextLine     = '';
  my $Field        = '';
  my $Type         = '';
  my $Level        = 0;
  my $LineNum      = 0;
  my $StartName    = '';
  my $EndName      = '';
  my @Section      = ( { LINE => 0, PTR => 0, NAME => '', COPIES => 0, COUNT => 0, EN => 1 } );
  my ($SourceFile) = $TemplateFile =~ /([\w\.]+)$/;
  my $RefId        = 0;
  my $Interface    = '';
  my $SlaveIF      = '';
  my $MasterIF     = '';
  my @MIRegions    = ();
  my @FoundRegions = ();
  my $Decodings    = 0;
  my $Region       = 0;
  my $AddrLo       = '';
  my $AddrHi       = '';
  my $Remapping    = '';
  my $RemapBit     = 0;
  my $Bit          = 0;
  my $RemapState   = 0;
  my @ActiveRemap  = ();
  my $GotFirst     = 0;
  my $Arbiters     = 'cmsdk_ahb_bm_burst_arb|cmsdk_ahb_bm_fixed_arb|cmsdk_ahb_bm_round_arb|cmsdk_ahb_bm_single_arb';
  my @PortIds      = ();
  my $TotalIds     = 0;
  my $DoneSpiritIn = -1;
  my @SpiritFiles  = ( $ComponentName, $BusMatrixName, $DefaultSlave, $InputStageName,
                       @MatrixDecodeNames, @OutputArbNames, @OutputStageNames );
  my %RemapTypes   = ( none => 'Static', alias => 'Alias', move => 'Unmoved' );
  my $Debug        = 0;

  # Open the template file for reading
  open( IN, "<$TemplateFile")
    or die "Cannot open input file '$TemplateFile'!\n\n";

  # Open the output file for writing the rendered text
  open( OUT, ">$RenderedFile" )
    or die "Cannot open output file '$RenderedFile'!\n\n";

  # For the bm_decode template only, initialise specific macros and variables
  if ( $TemplateFile =~ /cmsdk_ahb_bm_decode$HdlExt$/ ) {

    # Set the current instance name for search and replacement, and also extract
    #  the slave interface number for reference use
    if ( ($SlaveIF) = $RenderedFile =~ /$MatrixDecodeName(\w+)$HdlExt$/ ) {
      $Macro{'matrix_decode_name'} = $MatrixDecodeName . $SlaveIF;
      $Macro{'matrix_decode_name_lc'} = lc($Macro{'matrix_decode_name'});
      $SlaveIF = $NameAliases{$SlaveIF} if ( $XmlConfigFile ne '' );
    }

    # Initialise macros for search and replace, then determine if the map or
    #  remap section is to be processed
    $Section{'remap'} = 0;
    $Macro{'idw_remap'} = '';
    $Macro{'idw_remap_v'} = '';
    $Macro{'bin_remapstate'} = '';
    $Macro{'remapping_vector'} = '';
    $Macro{'region_type'} = '';
    if ( $RemapInfo{$SlaveIF}{REMAP_WIDTH} > 0 ) {
      $Section{'remap'} = 1;
      $Macro{'idw_remap'} = $RemapInfo{$SlaveIF}{REMAP_WIDTH} - 1;
      $Macro{'address_map'} = '';
      $Macro{'mdelse'} = '';
      $Macro{'mem_lo'} = '';
      $Macro{'mem_hi'} = '';
      $Macro{'remapping_vector'} = $RemapInfo{$SlaveIF}{REMAP_PORT};
    }
    $Section{'map'} = ( $Section{'remap'} ) ? 0 : 1;

  }

  # For a sparse bus matrix only, and concerning the output_arb or output_stage
  #  only, set the current instance names for search and replacement. Also
  #  extract the master interface number for reference use
  if ( $Sparse ) {
    if ( $TemplateFile =~ /($Arbiters)$HdlExt$/ ) {
      if ( ($MasterIF) = $RenderedFile =~ /$OutputArbName(\w+)$HdlExt$/ ) {
        $Macro{'output_arb_name'} = $OutputArbName . $MasterIF;
        $MasterIF = $NameAliases{$MasterIF} if ( $XmlConfigFile ne '' );
      }
    } elsif ( $TemplateFile =~ /output_stage$HdlExt$/ ) {
      if ( ($MasterIF) = $RenderedFile =~ /$OutputStageName(\w+)$HdlExt$/ ) {
        $Macro{'output_stage_name'} = $OutputStageName . $MasterIF;
        $Macro{'output_stage_name_lc'} = lc($Macro{'output_stage_name'});
        $MasterIF = $NameAliases{$MasterIF} if ( $XmlConfigFile ne '' );
        $MasterIF =~ /([0-9]+)$/;
        $Macro{'output_arb_name'} = $OutputArbNames[$1];
      }
    }
  }

  # Convert default slave name
  $Macro{'default_slave_name'} = $DefaultSlave;

  # Process each line of the template file
  while ( $TextLine = <IN> ) {

    # Increment the source file line number
    $LineNum++;

    # Display each line of the template when in debug mode
    print "$LineNum:" . $TextLine if ( $Debug );

    # Expand any macro found in the line
    unless ( $TextLine !~ /<<[^<>]+>>/ ) {

      # Search for all replaceable macros within the line
      while ( ($Field, $Type) = $TextLine =~ /(<<(\w+)>>)/gc ) {
        if ( exists $Macro{$Type} ) {
          $TextLine =~ s/$Field/$Macro{$Type}/;
          # Display replacement token name when in debug mode
          print "Replaced '$Field' on line $LineNum of '$SourceFile' with '$Macro{$Type}'...\n" if ( $Debug );
        } else {
          warn "Warning: Unidentified field '$Field' on line $LineNum of '$SourceFile'...\n";
        }
      }

      # Extract sections and store the current file pointer position
      if ( ($StartName) = $TextLine =~ /<<\s+start\s+(.+)\s+>>/ ) {

        # Store the information onto the section stack
        $Section[++$Level] = {
                               LINE   => $LineNum,
                               PTR    => tell(IN),
                               NAME   => $StartName,
                               COPIES => 0,
                               COUNT  => 0,
                               EN     => 1
                             };

        # Display section start name when in debug mode
        print "Found start section $Level '$StartName'\n" if ( $Debug );

        # Exclude child sections if the parent section was excluded, otherwise
        #  conditionally process specificaly named sections of the template
        if ( $Section[$Level - 1]{EN} == 0 ) {

          $Section[$Level]{EN} = 0;

        } elsif ( $StartName eq 'unalign' ) {  # Optional section

          $Section[$Level]{EN} = ( $Section{'unalign'} ) ? -1 : 0;

        } elsif ( $StartName eq 'excl' ) {  # Optional section

          $Section[$Level]{EN} = ( $Section{'excl'} ) ? -1 : 0;

        } elsif ( $StartName eq 'user' ) {  # Optional section

          $Section[$Level]{EN} = ( $Section{'user'} ) ? -1 : 0;

        } elsif ( $StartName eq 'map' ) {  # Optional section

          $Section[$Level]{EN} = ( $Section{'map'} ) ? -1 : 0;

        } elsif ( $StartName eq 'remap' ) {  # Optional section

          $Section[$Level]{EN} = ( $Section{'remap'} ) ? -1 : 0;

        } elsif ( $StartName eq 'vendor_extension' ) {  # Optional section

          # This is a dummy section to reset NoMoreSpiritInSections
          $Section[$Level]{EN} = 0;
          $DoneSpiritIn = -1;

        } elsif ( $StartName eq 'connection' ) {  # Optional section

          # Determine template specific settings
          if ( ($TemplateFile =~ /(cmsdk_ahb_busmatrix|$Arbiters|output_stage)$HdlExt$/) or
               ($TemplateFile =~ /cmsdk_ahb_busmatrix_spirit\.xml$/) ){
            $SlaveIF = 'SI' . $Macro{'in'};
          }
          $Interface = ( $TemplateFile =~ /($Arbiters|output_stage)$HdlExt$/ ) ?
            $MasterIF : 'MI' . $Macro{'out'};

          # For sparse bus matrix only, check for at least one connection
          $Section[$Level]{EN} = ( grep /^$Interface$/,
            @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} } or !$Sparse ) ? -1 : 0;

          # Indicate the first connection for the round_arb template
          if ( $TemplateFile =~ /cmsdk_ahb_bm_round_arb$HdlExt$/ and $Section[$Level]{EN} ) {
            $GotFirst = 1;
          }

        } elsif ( $StartName eq 'in' ) {  # Common macro

          # Set the number of times this section will be repeated
          $Section[$Level]{COPIES} = $SlaveInterfaces - 1;
          $Section[$Level]{EN} = -1;

          # Set the current slave interface number and macros
          $Macro{'in'} = $Section[$Level]{COUNT};
          $Interface = 'SI' . $Section[$Level]{COUNT};
          $Macro{'si_name'} = $InterfaceInfo{SLAVES}{$Interface}{NAME};

          # Determine template specific settings
          if ( $TemplateFile =~ /($Arbiters|output_stage)$HdlExt$/ ) {
            $Macro{'bin_in'} = ToBinary($Section[$Level]{COUNT}, $IdWidthSI);
            $Macro{'rrelse'} = '';  # Used in round_arb only
            $GotFirst = 0;
          } elsif ( $TemplateFile =~ /cmsdk_ahb_busmatrix$HdlExt$/ ) {
            # Determine if the remap section should be processed
            $Section{'remap'} = 0;
            $Macro{'remapping_vector'} = '';
            if ( $RemapInfo{$Interface}{REMAP_WIDTH} > 0 ) {
              $Section{'remap'} = 1;
              $Macro{'remapping_vector'} = $RemapInfo{$Interface}{REMAP_PORT};
            }
            $Macro{'matrix_decode_name'} = $MatrixDecodeNames[$Section[$Level]{COUNT}];
            $Macro{'matrix_decode_name_lc'} = lc($Macro{'matrix_decode_name'});
          } elsif ( ($TemplateFile =~ /cmsdk_ahb_busmatrix_spirit\.xml$/) and ($DoneSpiritIn != -1) ) {
            # If no sections were included before and this master interface is
            #  connected to current slave interface
            $MasterIF = 'MI' . $Macro{'out'};
            if ( ($DoneSpiritIn == 0) and
                 (grep /^$MasterIF$/,
                    @{ $InterfaceInfo{SLAVES}{$Interface}{CONNECTIONS} } or !$Sparse) ) {
              $DoneSpiritIn = 1;
            } else {
              $Section[$Level]{EN} = 0;
            }
          }

        } elsif ( $StartName eq 'out' ) {  # Common macro

          # Set the number of times this section will be repeated
          $Section[$Level]{COPIES} = $MasterInterfaces - 1;
          $Section[$Level]{EN} = -1;

          # Set the current master interface number and macros
          $Macro{'out'} = $Section[$Level]{COUNT};
          $Interface = 'MI' . $Section[$Level]{COUNT};
          $Macro{'mi_name'} = $InterfaceInfo{MASTERS}{$Interface}{NAME};
          $Macro{'mi_name_lc'} = lc($Macro{'mi_name'});

          # Determine template specific settings
          if ( $TemplateFile =~ /cmsdk_ahb_bm_decode$HdlExt$/ ) {
            $Macro{'bin_out'} = ToBinary($Section[$Level]{COUNT}, $IdWidthMI - 1);
          } elsif ( $TemplateFile =~ /cmsdk_ahb_busmatrix$HdlExt$/ and $Sparse ) {
            $Macro{'output_stage_name'} = $OutputStageNames[$Section[$Level]{COUNT}];
            $Macro{'output_stage_name_lc'} = lc($Macro{'output_stage_name'});
          }
          $DoneSpiritIn = 0;

        } elsif ( $StartName eq 'rrin' ) {  # Used in round_arb only

          # Determine the port ID enumeration and the total number
          if ( $Sparse ) {
            @PortIds = @{ $InterfaceInfo{MASTERS}{$MasterIF}{CONNECTIONS} };
            @PortIds = grep s/^SI//, @PortIds; # Remove all 'SI' prefixes
          } else {
            @PortIds = ( 0..$SlaveInterfaces-1 );
          }
          $TotalIds = scalar @PortIds;

          # Set the number of times this section will be repeated, and determine
          #  the slave interface ID macros for the round_arb template
          $Section[$Level]{COPIES} = $TotalIds - 1;
          $Section[$Level]{EN} = -1;
          $Macro{'rrin'} = $PortIds[$Section[$Level]{COUNT}];
          $Macro{'bin_rrin'} = ToBinary($PortIds[$Section[$Level]{COUNT}], $IdWidthSI);

        } elsif ( $StartName eq 'rridx' ) {  # Used in round_arb only

          # Set the number of times this section will be repeated, and determine
          #  the slave interface ID macros for the round_arb template
          $Section[$Level]{COPIES} = $TotalIds - 2;
          $Section[$Level]{EN} = -1;
          $Macro{'rrelse'} = '';
          $RefId = ($Section[$Level - 1]{COUNT} + 1) % $TotalIds;
          $Macro{'rridx'} = $PortIds[$RefId];
          $Macro{'bin_rridx'} = ToBinary($PortIds[$RefId], $IdWidthSI);

        } elsif ( $StartName eq 'addr_map' ) {  # Used in bm_decode only

          # For the current remapping state and master interface, determine which
          #  address regions are visible
          @MIRegions = grep /^$Interface:/,
            @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{NORMAL} };

          if ( $RemapState > 0 ) {  # Only when remapping is asserted non-zero

            # Translate the active remapping bits into a regexp filter
            @ActiveRemap = ();
            for ($Bit = 0; $Bit < $RemapInfo{$SlaveIF}{REMAP_WIDTH}; $Bit++) {
              if ( ($RemapState >> $Bit) & 0x01 ) {
                push @ActiveRemap, @{ $RemapInfo{$SlaveIF}{REMAP_BITS} }[$Bit];
              }
            }
            $RemapBit = join( '|', @ActiveRemap );

            # Determine if there are activated remap regions, and if so, delete
            #  normal but movable address map regions
            if ( grep /^$Interface:remap($RemapBit):/,
                   @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} } ) {
              for ($Region = 0; $Region < @MIRegions; $Region++) {
                if ( $MIRegions[$Region] =~ /:move:/ ) { delete $MIRegions[$Region]; }
              }
            }

          }
          $Region = 0;

          # Initialise macros in preparation for search and replace
          $Macro{'mdelse'} = '';
          $Macro{'address_map'} = '';
          $Macro{'mem_lo'} = '';
          $Macro{'mem_hi'} = '';

          # Include this section if a mapping exists
          $Section[$Level]{EN} = ( @MIRegions > 0 ) ? -1 : 0;

        } elsif ( $StartName =~ /^(addr|remap)_region$/ ) {  # Used bm_decode and Spirit file only
          #  Do not add an else if it is the first address/remap region
          $Macro{'mdelse'} = ( $Decodings > 0 ) ? 'else ' : '';

          # Conditionally reference the first address/remap region and extract its info
          if ( @MIRegions > 0 ) {
            # Set the number of copies
            $Section[$Level]{COPIES} = scalar @MIRegions - 1;

            ($MasterIF, $Remapping, $AddrLo, $AddrHi) = split(/:/, $MIRegions[$Region]);
            $Macro{'address_block_name'} = 'Default';
            $Macro{'address_block_remap'} = ($Remapping eq "move") ? 'TRUE' : 'FALSE';
            $Macro{'base_address'} = "0x$AddrLo";
            $Macro{'address_range'} = '0x' . HexSubstract($AddrHi, $AddrLo);
            $Macro{'address_map'} = "0x$AddrLo-0x$AddrHi";
            $Macro{'mem_lo'} = ToDecodeAddr($AddrLo);
            $Macro{'mem_hi'} = ToDecodeAddr($AddrHi);

            # Determine template specific settings
            if ( $TemplateFile =~ /cmsdk_ahb_bm_decode$HdlExt$/ ) {
              $Macro{'remapping_bit'} = '';
              if ( $StartName eq 'remap_region' ) {
                $Macro{'remapping_bit'} = substr($Remapping, 5, 1);
                $Macro{'out'} = substr($MasterIF, 2);
                $Macro{'bin_out'} = ToBinary( substr($MasterIF, 2), $IdWidthMI - 1);
              } else {
                $Macro{'region_type'} = $RemapTypes{$Remapping};
              }
            }
            $Decodings++;
          }
          $Section[$Level]{EN} = -1;

        } elsif ( $StartName eq 'spirit_remap_region' ) {  # Used in Spirit file only

          # Get the remap regions for the current master interface
          @MIRegions = grep /^$MasterIF:/,
            @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} };

          if ( @MIRegions > 0 ) {
            $Section[$Level]{COPIES} = scalar @MIRegions - 1;
            ($MasterIF, $Remapping, $AddrLo, $AddrHi) = split(/:/, $MIRegions[$Region]);
            $Remapping =~ /([0-9])$/; $Remapping = $1;
            $Macro{'address_block_name'} = 'Remap-Pin' . $Remapping;
            $Macro{'base_address'} = "0x$AddrLo";
            $Macro{'address_range'} = '0x' . HexSubstract($AddrHi, $AddrLo);
            $Macro{'mem_lo'} = ToDecodeAddr($AddrLo);
            $Macro{'mem_hi'} = ToDecodeAddr($AddrHi);
          }
          $Section[$Level]{EN} = ( $Macro{'base_address'} eq '' ) ? 0 : -1;

        } elsif ( $StartName eq 'remap_state' ) {  # Used in bm_decode only

          # Initialise macros in preparation for search and replace
          $Macro{'address_map'} = '';
          $Macro{'mem_lo'} = '';
          $Macro{'mem_hi'} = '';
          $Macro{'remapping_bit'} = '';
          $Macro{'idw_remap_v'} = $RemapInfo{$SlaveIF}{REMAP_WIDTH};
          $Macro{'bin_remapstate'} = ToBinary(0, $RemapInfo{$SlaveIF}{REMAP_WIDTH});

          # Initialise variables used in remap processing and calculate the required
          #  number of section copies
          $RemapState = 0;
          $Decodings = 0;
          $Section[$Level]{COPIES} = (2 ** $RemapInfo{$SlaveIF}{REMAP_WIDTH}) - 1;
          $Section[$Level]{EN} = -1;

        } elsif ( $StartName eq 'remap_bit' ) {  # Used in bm_decode only

          # Set the number of copies
          $Section[$Level]{COPIES} = $RemapInfo{$SlaveIF}{REMAP_WIDTH} - 1;
          $Section[$Level]{EN} = -1;
          $Bit = 0;

        } elsif ( $StartName eq 'addr_remap' ) {  # Used in bm_decode only

          # For the current remapping state, determine which remap regions are
          #  active per master interface
          @MIRegions = ();
          $Region = 0;
          if ( ($RemapState >> $Bit) & 0x01 ) {
            $RemapBit = @{ $RemapInfo{$SlaveIF}{REMAP_BITS} }[$Bit];
            @MIRegions = grep /:remap$RemapBit:/,
              @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} };
          }

          # Initialise macros in preparation for search and replace
          $Macro{'mdelse'} = '';
          $Macro{'address_map'} = '';
          $Macro{'mem_lo'} = '';
          $Macro{'mem_hi'} = '';

          # Include this section if a mapping exists
          $Section[$Level]{EN} = ( @MIRegions > 0 ) ? -1 : 0;

        } elsif ( $StartName eq 'file' ) {  # Used in spirit file only

          $Macro{'filename'} = $SpiritFiles[0];
          $Section[$Level]{COPIES} = scalar @SpiritFiles - 1;
          $Section[$Level]{EN} = -1;
        }

        # Display the number of section copies when in debug mode
        print "Section copies: $Section[$Level]{COPIES}\n" if ( $Debug );

      } elsif ( ($EndName) = $TextLine =~ /<<\s+end\s+(.+)\s+>>/ ) {

        # Display section end name when in debug mode
        print "Found end section $Level '$EndName'\n" if ( $Debug );

        # Check for matching section markers
        unless ( $EndName eq $Section[$Level]{NAME} ) {
          die "Error: Unexpected section end on line $LineNum of '$SourceFile'...\n\n";
        }

        # Determine if the section is to be repeated
        if ( $Section[$Level]{COUNT} < $Section[$Level]{COPIES} ) {

          # Adjust input file pointer and line number
          seek( IN, $Section[$Level]{PTR}, 0 );
          $LineNum = $Section[$Level]{LINE};

          # Update macro settings as necessary
          if ( $EndName eq 'in' ) {

            $Macro{'in'} = ++$Section[$Level]{COUNT};
            $Interface = 'SI' . $Section[$Level]{COUNT};
            $Macro{'si_name'} = $InterfaceInfo{SLAVES}{$Interface}{NAME};

            # Determine template specific settings
            if ( $TemplateFile =~ /($Arbiters|output_stage)$HdlExt$/ ) {
              $Macro{'bin_in'} = ToBinary($Section[$Level]{COUNT}, $IdWidthSI);
              if ( $GotFirst ) { $Macro{'rrelse'} = 'else '; }
            } elsif ( $TemplateFile =~ /cmsdk_ahb_busmatrix$HdlExt$/ ) {
              # Determine if the remap section should be processed
              $Section{'remap'} = 0;
              $Macro{'remapping_vector'} = '';
              if ( $RemapInfo{$Interface}{REMAP_WIDTH} > 0 ) {
                $Section{'remap'} = 1;
                $Macro{'remapping_vector'} = $RemapInfo{$Interface}{REMAP_PORT};
              }
              $Macro{'matrix_decode_name'} = $MatrixDecodeNames[$Section[$Level]{COUNT}];
              $Macro{'matrix_decode_name_lc'} = lc($Macro{'matrix_decode_name'});
            }

          } elsif ( $EndName eq 'out' ) {

            $Macro{'out'} = ++$Section[$Level]{COUNT};
            $Interface = 'MI' . $Section[$Level]{COUNT};
            $Macro{'mi_name'} = $InterfaceInfo{MASTERS}{$Interface}{NAME};
            $Macro{'mi_name_lc'} = lc($Macro{'mi_name'});

            # Determine template specific settings
            if ( $TemplateFile =~ /cmsdk_ahb_bm_decode$HdlExt$/ ) {
              $Macro{'bin_out'} = ToBinary($Section[$Level]{COUNT}, $IdWidthMI - 1);
            } elsif ( $TemplateFile =~ /cmsdk_ahb_busmatrix$HdlExt$/ and $Sparse ) {
              $Macro{'output_stage_name'} = $OutputStageNames[$Section[$Level]{COUNT}];
              $Macro{'output_stage_name_lc'} = lc($Macro{'output_stage_name'});
            }
            $DoneSpiritIn = 0;

          } elsif ( $EndName eq 'rrin' ) {

            $Macro{'rrin'} = $PortIds[ ++$Section[$Level]{COUNT} ];
            $Macro{'bin_rrin'} = ToBinary($PortIds[$Section[$Level]{COUNT}], $IdWidthSI);

          } elsif ( $EndName eq 'rridx' ) {

            $Section[$Level]{COUNT}++;
            $Macro{'rrelse'} = 'else ';

            # Determine next round robin port
            $RefId = ++$RefId % $TotalIds;
            $Macro{'rridx'} = $PortIds[$RefId];
            $Macro{'bin_rridx'} = ToBinary($PortIds[$RefId], $IdWidthSI);

          } elsif ( $EndName eq 'remap_state' ) {

            $Macro{'bin_remapstate'} = ToBinary(++$Section[$Level]{COUNT},
                                                 $RemapInfo{$SlaveIF}{REMAP_WIDTH});
            $Decodings = 0;
            $RemapState++;

          } elsif ( $EndName eq 'remap_bit' ) {

            $Section[$Level]{COUNT}++;
            $Bit++;

          } elsif ( $EndName =~ /^(addr|remap)_region$/ ) {

            $Section[$Level]{COUNT}++;

            # Conditionally reference the subsequent address/remap region
            if ( @MIRegions > 0 ) {
              $Macro{'mdelse'} = ( $Decodings > 0 ) ? 'else ' : '';

              ($MasterIF, $Remapping, $AddrLo, $AddrHi) = split(/:/, $MIRegions[++$Region]);
              $Macro{'address_block_name'} = 'Default';
              $Macro{'address_block_remap'} = ($Remapping eq "move") ? 'TRUE' : 'FALSE';
              $Macro{'base_address'} = "0x$AddrLo";
              $Macro{'address_range'} = '0x' . HexSubstract($AddrHi, $AddrLo);
              $Macro{'address_map'} = "0x$AddrLo-0x$AddrHi";
              $Macro{'mem_lo'} = ToDecodeAddr($AddrLo);
              $Macro{'mem_hi'} = ToDecodeAddr($AddrHi);

              # Determine template specific settings
              if ( $TemplateFile =~ /cmsdk_ahb_bm_decode$HdlExt$/ ) {
                $Macro{'remapping_bit'} = '';
                if ( $EndName eq 'remap_region' ) {
                  $Macro{'remapping_bit'} = substr($Remapping, 5, 1);
                  $Macro{'out'} = substr($MasterIF, 2);
                  $Macro{'bin_out'} = ToBinary( substr($MasterIF, 2), $IdWidthMI - 1);
                } else {
                  $Macro{'region_type'} = $RemapTypes{$Remapping};
                }
              }
              $Decodings++;
            }

          } elsif ( $EndName eq 'spirit_remap_region' ) {

             $Section[$Level]{COUNT}++;

             if ( @MIRegions > 0 ) {
               ($MasterIF, $Remapping, $AddrLo, $AddrHi) = split(/:/, $MIRegions[++$Region]);
               $Remapping =~ /([0-9])$/; $Remapping = $1;
               $Macro{'address_block_name'} = 'Remap-Pin' . $Remapping;
               $Macro{'base_address'} = "0x$AddrLo";
               $Macro{'address_range'} = '0x' . HexSubstract($AddrHi, $AddrLo);
               $Macro{'mem_lo'} = ToDecodeAddr($AddrLo);
               $Macro{'mem_hi'} = ToDecodeAddr($AddrHi);
             }

          } elsif ( $EndName eq 'file' ) {  # Used in spirit file only

            $Macro{'filename'} = $SpiritFiles[++$Section[$Level]{COUNT}];

          }

          # Display pointer adjustment when in debug mode
          printf ("Reversing back to line %d...\n", $LineNum + 1) if ( $Debug );

        } elsif ( $Level > 0 )  {
          $Level--;
        }

        # Do not include this line in the output
        unless ($Section[$Level]{EN} == 0) { $Section[$Level]{EN} = -1; }

      }

    }

    # Write the line(s) to the rendered output file when (delay) enabled
    if ( $Section[$Level]{EN} ) {
      print OUT $TextLine if ( $Section[$Level]{EN} > 0 );
      $Section[$Level]{EN} = 1;
    }

  }

  # Close the template file and rendered output file
  close(IN);
  close(OUT);

  # If still inside a nested section, there were too few end macros
  unless ( $Level == 0 ) {
    die "Error: Section '$Section[$Level]{NAME}' expected in '$SourceFile'!\n\n";
  }

}


# ------------------------------------------------------------------------------
#   IsSparse - Determines the connectivity completeness
# ------------------------------------------------------------------------------
sub IsSparse {

  # Local variable(s)
  my $SlaveIF   = '';
  my @SlaveIFs  = keys( %{ $InterfaceInfo{SLAVES} } );
  my @MasterIFs = keys( %{ $InterfaceInfo{MASTERS} } );
  my $Mappings  = '';
  my $Result    = 0;

  # Check each mapping
  foreach $SlaveIF ( @SlaveIFs ) {
    $Mappings = join( '|', @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} } );
    if ( grep $_ !~ /^($Mappings)$/, @MasterIFs ) { $Result = 1; last; }
  }

  return ($Result);
}


# ------------------------------------------------------------------------------
#   HexSubstract - Does argument1 - argument2 substraction in hex.
#                  Assumes argument1 >= argument2
# ------------------------------------------------------------------------------
sub HexSubstract {

  # Passed parameter 1 is the LHS hexadecimal operand value
  my $Value1 = shift;
  # Passed parameter 2 is the RHS hexadecimal operand value
  my $Value2 = shift;

  # Local variable(s)
  my $Len1   = length($Value1);
  my $Len2   = length($Value2);
  my $Index  = 0;
  my $Char1  = '';
  my $Char2  = '';
  my $Borrow = 0;
  my $Result = '';

  # Append zeros to the 2nd operand
  if ( $Len1 > $Len2 ) { $Value2 = '0' x ($Len1 - $Len2) . $Value2; }

   # Substract using strings instead of conversion to decimal to support 64 bit numbers
   for ( $Index = 1; $Index <= $Len1; $Index++ ) {
     $Char1 = hex substr($Value1, $Len1 - $Index, 1);
     $Char2 = hex substr($Value2, $Len1 - $Index, 1);
     if ( $Char1 < ($Char2 + $Borrow) ) {
       $Char1 = $Char1 + 16;
       $Result = sprintf("%1x", $Char1 - $Char2 - $Borrow) . $Result;
       $Borrow = 1;
     } else {
       $Result = sprintf("%1x", $Char1 - $Char2 - $Borrow) . $Result;
       $Borrow = 0;
     }
   }

   return ($Result);
}


# ------------------------------------------------------------------------------
#   RoundPowerOfTwo - Finds the minimum binary quantum for the specified
#                      integer value
# ------------------------------------------------------------------------------
sub RoundPowerOfTwo {

  # Passed parameter 1 is the integer value
  my $Value = shift;

  # Local variable(s)
  my $Result     = 0;
  my $ShiftCount = 0;

  # Determine the number of available regions
  while ( $Value > $Result ) { $Result = 1 << $ShiftCount++; }

  return ($Result);
}


# ------------------------------------------------------------------------------
#   NumberOfDigits - Calculates the number of digits required to describe
#                     the specified integer value in the specified base
# ------------------------------------------------------------------------------
sub NumberOfDigits {

  # Passed parameter 1 is the integer value
  my $Value = shift;
  # Passed parameter 2 is the base
  my $Base = shift;

  # Local variable(s)
  my $Result  = 1;
  my $XToTheY = 0;

  # Determine the number of digits for values greater than the radix
  unless ( $Base < 2 or $Value < $Base ) {
    while ( $Value > $XToTheY ) { $XToTheY = $Base ** $Result++; }
    if ( $Value != $XToTheY ) { $Result--; }
  }

  return ( $Result );
}


# ------------------------------------------------------------------------------
#   NumberOfHexChars - Calculates the number of hexadecimal characters
#                       required to describe the specified number of bits
# ------------------------------------------------------------------------------
sub NumberOfHexChars {

  # Passed parameter 1 is the integer value
  my $Value = shift;

  # Local variable(s)
  my $Result   = $Value / 4.0;
  my $Integer  = int($Result);
  my $Fraction = $Result - $Integer;

  # Determine the number of digits
  $Result = ($Fraction > 0) ? $Integer + 1 : $Integer;

  return ( $Result );
}


# ------------------------------------------------------------------------------
#   ToBinary - Converts the specified integer into an n-bit binary string
# ------------------------------------------------------------------------------
sub ToBinary {

  # Passed parameter 1 is the integer value
  my $Value = shift;
  # Passed parameter 2 is the binary string length
  my $Length = shift;

  # Local variable(s)
  my $Format = "%0${Length}b";
  my $Result = ( $Value =~ /^\d+$/ ) ? sprintf($Format, $Value) : '';

  return ( substr($Result, -$Length, $Length) );
}


# ------------------------------------------------------------------------------
#   ToDecodeAddr - Shifts the specified n-bit address to the correct alignment
#                   for the Matrix Decoder because HADDR[9:0] is not decoded
# ------------------------------------------------------------------------------
sub ToDecodeAddr {

  # Passed parameter 1 is the address value
  my $FullAddr = shift;

  # Local variable(s)
  my $AddrBits = $RoutingAddressWidth - 10;
  my $HexChars = NumberOfHexChars($AddrBits);
  my $Length   = length($FullAddr);
  my $BinAddr  = sprintf( "%032b%032b", hex substr($FullAddr, 0, $Length - 8),
                                        hex substr($FullAddr, $Length - 8) );
  my $Result    = '';

  # Right-shift the binary string to remove the non-decoded bits, and repack
  #  it into 32-bit chunks for reformatting into a hexadecimal representation
  $BinAddr = '0' x 10 . substr($BinAddr, 0, -10);
  $Result  = sprintf( "%08lx%08lx",
               unpack( 'N', pack('B32', substr($BinAddr, 0, 32)) ),
               unpack( 'N', pack('B32', substr($BinAddr, 32)) ) );

  return ( sprintf("%d'h%s", $AddrBits, substr($Result, 16 - $HexChars)) );
}


# ------------------------------------------------------------------------------
#   UnsignedFloatToHex - Converts the specified float value into a hex string
# ------------------------------------------------------------------------------
sub UnsignedFloatToHex {

  # Passed parameter 1 is the float value
  my $Value = shift;

  # Local variable(s)
  my $HexDigits = NumberOfDigits($Value, 16);
  my $Divisor   = 16 ** ($HexDigits - 1);
  my $Dividend  = 0;
  my $Result    = '';

  # Determine number sequence
  while ( length($Result) < $HexDigits ) {
    $Dividend = int( $Value / $Divisor );
    if ( $Dividend > 0 ) {
      $Result = $Result . substr('0123456789abcdef', $Dividend, 1);
      $Value -= ($Divisor * $Dividend);
    } else {
      $Result = $Result . '0';
    }
    $Divisor /= 16;
  }

  return ($Result);
}


# ------------------------------------------------------------------------------
#   IsGtOrEq - Operator '>=' test for up to 64-bit hexadecimal numbers
# ------------------------------------------------------------------------------
sub IsGtOrEq {

  # Passed parameter 1 is the LHS value
  my $OperandLHS = shift;
  # Passed parameter 2 is the RHS value
  my $OperandRHS = shift;

  # Local variable(s)
  my $LengthLHS = length($OperandLHS);
  my @LHS       = ( hex substr($OperandLHS, 0, $LengthLHS - 8),
                    hex substr($OperandLHS, $LengthLHS - 8) );
  my $LengthRHS = length($OperandRHS);
  my @RHS       = ( hex substr($OperandRHS, 0, $LengthRHS - 8),
                    hex substr($OperandRHS, $LengthRHS - 8) );
  my $Result = ( $LHS[0] > $RHS[0] or
                 ($LHS[0] == $RHS[0] and $LHS[1] >= $RHS[1]) ) ? 1 : 0;

  return ($Result);
}


# ------------------------------------------------------------------------------
#   IsLtOrEq - Operator '<=' test for up to 64-bit hexadecimal numbers
# ------------------------------------------------------------------------------
sub IsLtOrEq {

  # Passed parameter 1 is the LHS value
  my $OperandLHS = shift;
  # Passed parameter 2 is the RHS value
  my $OperandRHS = shift;

  # Local variable(s)
  my $LengthLHS = length($OperandLHS);
  my @LHS       = ( hex substr($OperandLHS, 0, $LengthLHS - 8),
                    hex substr($OperandLHS, $LengthLHS - 8) );
  my $LengthRHS = length($OperandRHS);
  my @RHS       = ( hex substr($OperandRHS, 0, $LengthRHS - 8),
                    hex substr($OperandRHS, $LengthRHS - 8) );
  my $Result = ( $LHS[0] < $RHS[0] or
                 ($LHS[0] == $RHS[0] and $LHS[1] <= $RHS[1]) ) ? 1 : 0;

  return ($Result);
}


# ------------------------------------------------------------------------------
#   TidyPath - Removes double and trailing slash characters from filename paths
# ------------------------------------------------------------------------------
sub TidyPath {

  # Passed parameter 1 is the filepath string
  my $Filepath = shift;

  $Filepath =~ s/(\/\/|\\)/\//g; $Filepath =~ s/\/$//;

  return ($Filepath);
}


# ------------------------------------------------------------------------------
#   ValidateParameters - Checks the value of user configurable script parameters
# ------------------------------------------------------------------------------
sub ValidateParameters {

  # Local variable(s)
  my %Names         = (
                        bus_matrix_name     => \$BusMatrixName,
                        input_stage_name    => \$InputStageName,
                        matrix_decode_name  => \$MatrixDecodeName,
                        output_arbiter_name => \$OutputArbName,
                        output_stage_name   => \$OutputStageName
                      );
  my @NameKeys      = keys( %Names );
  my $Name          = '';
  my $NameLength    = 0;
  my $ShowName      = '';
  my @OtherNameKeys = ();
  my $OtherName     = '';
  my $Type          = '';
  my @Interfaces    = ();
  my $Interface     = '';

  # Validate permitted values for the total slave interfaces
  unless ( $SlaveInterfaces >= $MinSlaveIF and $SlaveInterfaces <= $MaxSlaveIF ) {
    warn "Error: The number of slave ports must be in the range from $MinSlaveIF to $MaxSlaveIF \n";
    $Errors++;
  }

  # Validate permitted values for the total master interfaces
  unless ( $MasterInterfaces >= $MinMasterIF and $MasterInterfaces <= $MaxMasterIF ) {
    warn "Error: The number of master ports must be in the range from $MinMasterIF to $MaxMasterIF \n";
    $Errors++;
  }

  # Raise a warning about the '1 x n' bus matrix configuration
  if ( $SlaveInterfaces == 1 ) {
    warn "Warning: This configuration has one slave port and will use 'single' output\n" .
         " and arbiter stage(s) only.\n";
  }

  # Validate permitted values of arbitration scheme
  unless ( $ArbiterType =~ /^(fixed|round|burst)$/ ) {
    warn "Error: Invalid type of arbitration-scheme '$ArbiterType'!\n";
    $Errors++;
  }

  # Validate permitted values of architecture version
  unless ( $ArchitectureType =~ /^(ahb2|v6|excl|unalign)$/ ) {
    warn "Error: Invalid type of architecture '$ArchitectureType'!\n";
    $Errors++;
  }

  # Validate permitted values of routing-data width
  unless ( $RoutingDataWidth =~ /^($DataWidths)$/ ) {
    warn "Error: Invalid routing-data width '$RoutingDataWidth'!\n";
    $Errors++;
  }

  # Validate permitted values of user-signal width
  if ( $RoutingAddressWidth =~ /[^0-9]/ ) {
    warn "Error: Invalid routing-address width '$RoutingAddressWidth'!\n";
    $Errors++;
  } elsif ( $RoutingAddressWidth < $MinAddrWidth or $RoutingAddressWidth > $MaxAddrWidth ) {
    warn "Error: Routing-address width must be in the range $MinAddrWidth..$MaxAddrWidth!\n";
    $Errors++;
  }

  # Validate permitted values of user-signal width
  if ( $UserSignalWidth =~ /[^0-9]/ ) {
    warn "Error: Invalid user-signal width '$UserSignalWidth'!\n";
    $Errors++;
  } elsif ( $UserSignalWidth < $MinUserWidth or $UserSignalWidth > $MaxUserWidth ) {
    warn "Error: User-signal width must be in the range $MinUserWidth..$MaxUserWidth!\n";
    $Errors++;
  }

  # Validate permitted values of module names
  foreach $Name ( @NameKeys ) {
    $ShowName = $Name; $ShowName =~ s/_/ /g;
    $NameLength = length( ${ $Names{$Name} } );

    # Check for illegal characters and then check the string length
    if ( ${ $Names{$Name} } =~ /[^\w]/ ) {
      warn "Error: The $ShowName contains illegal characters!\n";
      $Errors++;
    } elsif ( $NameLength < $MinNameLength or $NameLength > $MaxNameLength ) {
      warn "Error: The $ShowName is incorrect length ($MinNameLength..$MaxNameLength characters)!\n";
      $Errors++;
    }

    # Check for unique name
    @OtherNameKeys = grep $_ ne $Name , @NameKeys;
    foreach $OtherName ( @OtherNameKeys ) {
      if ( ${ $Names{$OtherName} } eq ${ $Names{$Name} } ) {
        warn "Error: The $ShowName is not assigned a unique value!\n";
        $Errors++;
      }
    }
  }

  # Check interface information
  foreach $Type (qw( SLAVES MASTERS )) {

    @Interfaces = keys( %{ $InterfaceInfo{$Type} } );
    foreach $Interface ( @Interfaces ) {
      # Inspect interface names
      $Name = $InterfaceInfo{$Type}{$Interface}{NAME};
      if ( $Name =~ /[^\w]/ ) {
        warn "Error: Interface $Interface name '$Name' contains illegal characters!\n";
        $Errors++;
      }
      if ( length($Name) > $MaxNameLength ) {
        warn "Error: Interface $Interface name '$Name' is too long ($MaxNameLength" .
             " characters max)!\n";
        $Errors++;
      }

      # Inspect connectivity for isolated nodes resulting from an
      #  incomplete sparse mapping
      if ( @{ $InterfaceInfo{$Type}{$Interface}{CONNECTIONS} } == 0 ) {
        warn "Error: Interface $Interface has no connectivity mapping and is isolated!\n";
        $Errors++;
      }

      # If this is a slave, then check its address map
      if ( $Type eq 'SLAVES' ) { CheckAddressMap($Interface); }
    }

  }

}


# ------------------------------------------------------------------------------
#   CheckAddressMap - Checks the address map of the specified slave interface
#                      for tags and overlapping regions
# ------------------------------------------------------------------------------
sub CheckAddressMap {

  # Passed parameter 1 is the integer value
  my $SlaveIF = shift;

  # Local variable(s)
  my $Class       = '';
  my $Index       = 0;
  my $MasterIF    = '';
  my @MIRegions   = ();
  my $Region      = '';
  my $MI          = '';
  my $Tag         = '';
  my $RegionHi    = '';
  my $RegionLo    = '';
  my $RegionHiLSW = 0;
  my $RegionLoLSW = 0;
  my $CheckBound  = '';
  my $OtherRegion = '';
  my $OtherMI     = '';
  my $OtherHi     = '';
  my $OtherLo     = '';
  my $OtherTag    = 0;
  my $Exclusions  = '';
  my $HexChars    = NumberOfHexChars($RoutingAddressWidth);
  my %Tags        = ( NORMAL => 'none|move|alias',  REMAP => 'remap[0-3]' );
  my %TagMessages = ( NORMAL => 'remapping action', REMAP => 'REMAP bit' );
  my %WarnType    = ( NORMAL => 'address', REMAP => 'remap' );

  # Process each mapping type
  foreach $Class (qw( REMAP NORMAL )) {

    # Check the address map for each master interface
    for ( $Index = 0; $Index < $MasterInterfaces; $Index++ ) {
      $MasterIF = 'MI' . $Index;

      # Find regions matching the master interface under inspection
      @MIRegions = grep /^$MasterIF:/, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{$Class} };

      # Determine if this slave interface has connectivity with the master interface
      if ( grep $_ eq $MasterIF, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} } ) {

        # Check for expected address regions
        unless ( $Class eq 'REMAP' or @MIRegions > 0 ) {
          warn "Error: Interface $SlaveIF has no address regions defined for the $MasterIF interface!\n";
          $Errors++;
        }

        # Inspect each region mapped to the master interface
        foreach $Region ( @MIRegions ) {

          # Split the region into its constituent parts
          ($MI, $Tag, $RegionLo, $RegionHi) = split(/:/, $Region);

          # Extract and remove the expected prefix, then check its type
          unless ( $Tag =~ /^($Tags{$Class})$/ ) {
            warn "Error: Interface $SlaveIF address region '$MI: $RegionLo-$RegionHi'" .
                 " declares\n unsupported $TagMessages{$Class}!\n";
            $Errors++;
          }

          # Check that each bound only consists of hexadecimal characters
          #  and is the expected number of hexadecimal digits
          foreach $CheckBound ( $RegionLo, $RegionHi ) {
            if ( length($CheckBound) != $HexChars ) {
              warn "Error: Interface $SlaveIF address bound '$MI: $CheckBound' is incorrect length should be $HexChars characters!\n";
              $Errors++;
            }
            if ( $CheckBound =~ /[^a-f0-9]+/i ) {
              warn "Error: Interface $SlaveIF address bound '$MI: $CheckBound' contains illegal characters!\n";
              $Errors++;
            }
          }

          # Check the region syntax
          if ( IsGtOrEq($RegionLo, $RegionHi) ) {
            warn "Error: Interface $SlaveIF address region '$MI: $RegionLo-$RegionHi' is invalid!\n";
            $Errors++;
          }

          # Check the region size - minimum is 1kBytes
          $RegionHiLSW = hex substr($RegionHi, length($RegionHi) - 8);
          $RegionLoLSW = hex substr($RegionLo, length($RegionLo) - 8);
          if ( abs( $RegionHiLSW - $RegionLoLSW ) < 1023 ) {
            warn "Error: Interface $SlaveIF address region '$MI: $RegionLo-$RegionHi' is < 1kBytes!\n";
            $Errors++;
          }

          # Check alignment of lower address bound
          if ( ( hex(substr($RegionLo, -3, 3)) & 0x3ff ) != 0x000 ) {
            warn "Warning: Interface $SlaveIF address bound '$MI: $RegionLo' is misaligned!\n";
          }

          # Check alignment of upper address bound
          if ( ( hex(substr($RegionHi, -3, 3)) & 0x3ff ) != 0x3ff ) {
            warn "Warning: Interface $SlaveIF address bound '$MI: $RegionHi' is misaligned!\n";
          }

          # Check the current region against all others for illegal overlap
          foreach $OtherRegion ( @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{$Class} } ) {

            # Split the other region into its constituent parts
            ($OtherMI, $OtherTag, $OtherLo, $OtherHi) = split(/:/, $OtherRegion);

            # Exclude remap regions with different remap bits
            if ( $Class eq 'REMAP' and $Tag ne $OtherTag ) { next; }

            # Filter out the current region and any previously reported ones
            unless ( $OtherRegion =~ /^($Region$Exclusions)$/ ) {

              # Check bounds for overlap
              if ( (IsGtOrEq($OtherLo, $RegionLo) and IsLtOrEq($OtherLo, $RegionHi)) or
                   (IsGtOrEq($OtherHi, $RegionLo) and IsLtOrEq($OtherHi, $RegionHi)) ) {

                warn "Error: Interface $SlaveIF $WarnType{$Class} region '$OtherMI: $OtherLo-$OtherHi'" .
                  " overlaps\n with another $WarnType{$Class} region '$MI: $RegionLo-$RegionHi'!\n";
                $Errors++;

                # Suppress multiple messages that show the same error
                $Exclusions = $Exclusions . "|$MI:[^:]+:$RegionLo:$RegionHi";
              }

            }
          }

        }

      } elsif ( @MIRegions > 0 ) {
        # This slave interface is not connected to the master interface and
        #  therefore should not have any address map information
        warn "Error: Interface $SlaveIF has an address map for $MasterIF interface,\n" .
             " while not connected!\n";
        $Errors++;
      }
    }

    # Clear the exclusions for checking the next class
    $Exclusions = '';

  }

}


# ------------------------------------------------------------------------------
#   InitialiseInterfaceInfo - Determines the connectivity mapping and address
#                              map, assigning values to the global interface
#                              information hash
# ------------------------------------------------------------------------------
sub InitialiseInterfaceInfo {

  # Local variable(s)
  my $SlaveIF   = '';
  my $MasterIF  = '';
  my $Index1      = 0;
  my $Index2      = 0;
  my $Regions     = RoundPowerOfTwo($MasterInterfaces);
  my $RegionSize  = (2 ** $RoutingAddressWidth) / $Regions;
  my $BaseAddress = 0;
  my $TopAddress  = 0;
  my @Mappings    = split(/:\s*/, $Connectivity);
  my $Mapping     = '';
  my @Interfaces  = ();
  my $HexChars    = NumberOfHexChars($RoutingAddressWidth);
  my $Format      = "%0${HexChars}s";

  # Initialise master interface parameter(s) first to simplify the sequence
  for ( $Index1 = 0; $Index1 < $MasterInterfaces; $Index1++ ) {
    $MasterIF = 'MI' . $Index1;
    $InterfaceInfo{MASTERS}{$MasterIF}{NAME} = $MasterIF;
    $InterfaceInfo{MASTERS}{$MasterIF}{CONNECTIONS} = [];
  }

  # Initialise slave interface parameter(s)
  for ( $Index1 = 0; $Index1 < $SlaveInterfaces; $Index1++ ) {
    # Initialise slave information container
    $SlaveIF = 'SI' . $Index1;
    $InterfaceInfo{SLAVES}{$SlaveIF}{NAME} = $SlaveIF;
    $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} = [];
    $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{NORMAL} = [];
    $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} = [];

    # Establish the connectivity
    if ( $Connectivity ne 'full' ) {

      # Initialise or concatenate the connection description string
      $Connectivity = 'sparse';
      $Connections = $Connections . sprintf("%s%s -> ", ($Connections eq '') ?
        '' : "\n" . ' ' x 29, $InterfaceInfo{SLAVES}{$SlaveIF}{NAME});

      # Search the connectivity string for a mapping from this slave interface
      foreach $Mapping ( @Mappings ) {
        if ( $Mapping =~ /^$SlaveIF=MI\{([0-9,]+)\}/) {
          # Process each master interface in turn, checking for its existence
          @Interfaces = split(/,\s*/, $1);
          foreach $MasterIF ( @Interfaces ) {
            $MasterIF = 'MI' . $MasterIF;
            if ( exists( $InterfaceInfo{MASTERS}{$MasterIF} ) ) {
              # Append the details of this sparse connection
              push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} }, $MasterIF;
              $Connections = $Connections . "$MasterIF, ";
            } else {
              warn "Error: Interface $SlaveIF has an unresolved sparse connection '$MasterIF'!\n";
              $Errors++;
            }
          }
        }
      }

    } else {
      # Full connectivity is default
      for ( $Index2 = 0; $Index2 < $MasterInterfaces; $Index2++ ) {
        push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} }, 'MI' . $Index2;
      }
    }

    # Determine address map (assume no remap regions)
    for ( $Index2 = 0; $Index2 < $MasterInterfaces; $Index2++ ) {
      $MasterIF = 'MI' . $Index2;
      $BaseAddress = $RegionSize * $Index2;
      $TopAddress = $BaseAddress + $RegionSize - 1;
      if ( grep $_ eq $MasterIF, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} } ) {
        push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{NORMAL} },
          sprintf("%s:none:$Format:$Format", $MasterIF, UnsignedFloatToHex($BaseAddress),
            UnsignedFloatToHex($TopAddress));
      }
    }
  }

  # Remove leading whitespace from the connections detail
  $Connections =~ s/,\s+$//;

  # Determine connectivity information from master interface perspective
  for ( $Index1 = 0; $Index1 < $MasterInterfaces; $Index1++ ) {
    $MasterIF = 'MI' . $Index1;
    for ( $Index2 = 0; $Index2 < $SlaveInterfaces; $Index2++ ) {
      $SlaveIF = 'SI' . $Index2;
      if ( grep $_ eq $MasterIF, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} } ) {
        push @{ $InterfaceInfo{MASTERS}{$MasterIF}{CONNECTIONS} }, $SlaveIF;
      }
    }
  }

}


# ------------------------------------------------------------------------------
#   ProcessXmlConfigFile - Reads the specified XML configuration file and
#                           assigns values to the global variables including
#                           the interface information hash
# ------------------------------------------------------------------------------
sub ProcessXmlConfigFile {

  # Local variable(s)
  my @Elements    = ();
  my $XmlItem     = '';
  my $XmlElement  = '';
  my @SlavePorts  = ();
  my @MasterPorts = ();
  my $Index1      = 1;
  my $Index2      = 0;
  my $SlaveIF     = '';
  my $MasterIF    = '';
  my $Name        = '';
  my $Region      = '';

  # Configure the XML parser
  ConfigureXmlParser( show_ids => 0, verbose => 0, show_warnings => 0 );

  # Read the specified configuration file
  RunXmlParser($XmlConfigFile);

  # Display the XML structure when in debug mode
  if ( $Debug ) { ListXmlHash('ROOT'); }

  # Access mandatory items of information (bus matrix dimensions)
  @SlavePorts = GetXmlNodeList('//cfgfile/slave_interface');
  $SlaveInterfaces = scalar @SlavePorts;
  @MasterPorts = GetXmlNodeList('//cfgfile/master_interface');
  $MasterInterfaces = scalar @MasterPorts;

  # Access optional items of information
  @Elements = GetXmlNodeList('/cfgfile');
  foreach $XmlElement ( @Elements ) {
    # Assign the extracted value to the appropriate parameter name
    $XmlItem = GetXmlValue("/cfgfile/$XmlElement");
    if ( $XmlElement =~ /arbitration_scheme\[1\]$/ ) {
      $ArbiterType = $XmlItem;
    } elsif ( $XmlElement =~ /architecture_version\[1\]$/ ) {
      $ArchitectureType = $XmlItem;
    } elsif ( $XmlElement =~ /routing_data_width\[1\]$/ ) {
      $RoutingDataWidth = $XmlItem;
    } elsif ( $XmlElement =~ /routing_address_width\[1\]$/ ) {
      $RoutingAddressWidth = $XmlItem;
    } elsif ( $XmlElement =~ /user_signal_width\[1\]$/ ) {
      $UserSignalWidth = $XmlItem;
    } elsif ( $XmlElement =~ /bus_matrix_name\[1\]$/ ) {
      $BusMatrixName = $XmlItem;
    } elsif ( $XmlElement =~ /input_stage_name\[1\]$/ ) {
      $InputStageName = $XmlItem;
    } elsif ( $XmlElement =~ /matrix_decode_name\[1\]$/ ) {
      $MatrixDecodeName = $XmlItem;
    } elsif ( $XmlElement =~ /output_arbiter_name\[1\]$/ ) {
      $OutputArbName = $XmlItem;
    } elsif ( $XmlElement =~ /output_stage_name\[1\]$/ ) {
      $OutputStageName = $XmlItem;
    } elsif ( $XmlElement =~ /product_version_info\[1\]$/ ) {
      $ComponentName = GetXmlValue("/cfgfile/$XmlElement" . '@component_name');
    } elsif ( $XmlElement !~ /(slave|master)_interface\[\d+\]/ ) {
      warn "Error: Unknown XML option '$XmlElement'!\n";
      $Errors++;
    }
  }

  # Extract master interface parameter(s) first to simplify the sequence
  foreach $XmlElement ( @MasterPorts ) {

    # Initialise information container and increment the count
    $MasterIF = sprintf("MI%d", $Index2++);
    $Name = GetXmlValue($XmlElement . '@name');
    $InterfaceInfo{MASTERS}{$MasterIF}{NAME} = $Name;
    $InterfaceInfo{MASTERS}{$MasterIF}{CONNECTIONS} = [];

    # Add the name to the master alias lookup hash
    if ( ! exists( $NameAliases{$Name} ) ) {
      $NameAliases{$Name} = $MasterIF;
    } else {
      warn "Error: Interface $MasterIF name '$Name' is not unique!\n";
      $Errors++;
    }

  }

  # Extract slave interface parameter(s)
  foreach $XmlElement ( @SlavePorts ) {

    # Initialise information container
    $SlaveIF = sprintf("SI%d", $Index1 - 1);
    $Name = GetXmlValue($XmlElement . '@name');
    $InterfaceInfo{SLAVES}{$SlaveIF}{NAME} = $Name;
    $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} = [];
    $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{NORMAL} = [];
    $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} = [];

    # Add the name to the slave alias lookup hash
    if ( ! exists( $NameAliases{$Name} ) ) {
      $NameAliases{$Name} = $SlaveIF;
    } else {
      warn "Error: Interface $SlaveIF name '$Name' is not unique!\n";
      $Errors++;
    }

    # Extract connectivity information or assign full connectivity as default
    @Elements = GetXmlNodeList("//cfgfile/slave_interface[$Index1]/sparse_connect");
    if ( @Elements > 0 ) {
      # Initialise or concatenate the connection description string
      $Connectivity = 'sparse';
      $Connections = $Connections . sprintf("%s%s -> ", ($Connections eq '') ?
        '' : "\n" . ' ' x 29, $InterfaceInfo{SLAVES}{$SlaveIF}{NAME});

      # Convert the symbolic interface names to the MI<n> notation
      foreach $XmlItem ( @Elements ) {
        # Extract sparse connection attribute and check for existence of the
        #  named interface
        $MasterIF = GetXmlValue($XmlItem . '@interface');
        if ( exists( $NameAliases{$MasterIF} ) ) {
          push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} }, $NameAliases{$MasterIF};
        } else {
          warn "Error: Interface '$Name' has an unresolved sparse connection '$MasterIF'!\n";
          $Errors++;
        }
        # Append this sparse connection detail
        $Connections = $Connections . "$MasterIF, ";
      }

    } else {
      # Full connectivity is default
      for ( $Index2 = 0; $Index2 < $MasterInterfaces; $Index2++ ) {
        push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} }, 'MI' . $Index2;
      }
    }

    # Extract address mapping information
    @Elements = GetXmlNodeList("//cfgfile/slave_interface[$Index1]/address_region");
    if ( @Elements > 0 ) {
      foreach $XmlItem ( @Elements ) {
        # Determine which master interface this address region is for, and
        #  check that it exists
        $MasterIF = GetXmlValue($XmlItem . '@interface');
        if ( exists( $NameAliases{$MasterIF} ) ) {
          $Region = sprintf("%s:%s:%s:%s", $NameAliases{$MasterIF},
                                           GetXmlValue($XmlItem . '@remapping'),
                                           GetXmlValue($XmlItem . '@mem_lo'),
                                           GetXmlValue($XmlItem . '@mem_hi'));
          # Check for duplicated definitions
          if ( grep $_ eq $Region, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{NORMAL} } ) {
            warn "Error: Interface '$Name' has duplicated address region for master interface '$MasterIF'\n";
            $Errors++;
          } else {
            push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{NORMAL} }, $Region;
          }

        } else {
          warn "Error: Address region maps to unknown master interface '$MasterIF'\n";
          $Errors++;
        }
      }
    } else {
      warn "Error: Expecting an address region for interface '$SlaveIF'\n";
      $Errors++;
    }

    # Extract the optional remapped address information
    @Elements = GetXmlNodeList("//cfgfile/slave_interface[$Index1]/remap_region");
    foreach $XmlItem ( @Elements ) {
      # Determine which master interface this remap region is for, and
      #  check that it exists
      $MasterIF = GetXmlValue($XmlItem . '@interface');
      if ( exists( $NameAliases{$MasterIF} ) ) {
        $Region = sprintf("%s:remap%s:%s:%s", $NameAliases{$MasterIF},
                                              GetXmlValue($XmlItem . '@bit'),
                                              GetXmlValue($XmlItem . '@mem_lo'),
                                              GetXmlValue($XmlItem . '@mem_hi'));
        # Check for duplicated definitions
        if ( grep $_ eq $Region, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} } ) {
          warn "Error: Interface '$Name' has duplicated remap region for master interface '$MasterIF'\n";
          $Errors++;
        } else {
          push @{ $InterfaceInfo{SLAVES}{$SlaveIF}{ADDRESS_MAP}{REMAP} }, $Region;
        }

      } else {
        warn "Error: Remap region maps to unknown master interface '$MasterIF'\n";
        $Errors++;
      }
    }

    # Increment index
    $Index1++;
  }

  # Remove leading whitespace from the connections detail
  $Connections =~ s/,\s+$//;

  # Determine connectivity information from master interface perspective
  for ( $Index1 = 0; $Index1 < $MasterInterfaces; $Index1++ ) {
    $MasterIF = 'MI' . $Index1;
    for ( $Index2 = 0; $Index2 < $SlaveInterfaces; $Index2++ ) {
      $SlaveIF = 'SI' . $Index2;
      if ( grep $_ eq $MasterIF, @{ $InterfaceInfo{SLAVES}{$SlaveIF}{CONNECTIONS} } ) {
        push @{ $InterfaceInfo{MASTERS}{$MasterIF}{CONNECTIONS} }, $SlaveIF;
      }
    }
  }

}


# ------------------------------------------------------------------------------
#   ShowHelp - Displays help dialogue (developer's options are not advertised)
# ------------------------------------------------------------------------------
sub ShowHelp {

  # Local variable(s)
  my $ShowArchitectureOptions = 0;

  printf "%sPurpose:\n" .
         "   Builds particular configurations of the AHB BusMatrix component.\n\n" .
         "Usage:\n" .
         "   Builds an AHB BusMatrix component with a given  number of input\n" .
         "   ports, a given number of output ports, a particular arbitration\n" .
         "   scheme and ARM processor interface.\n\n" .
         "Options:\n" .
         "   --cfg=FILENAME          Name of an XML configuration file that\n" .
         "                            defines the bus matrix specification\n" .
         "                            in place of most command line arguments.\n" .
         "                            Note that this is the only method to\n" .
         "                            specify customised address maps.\n\n" .

         "   --inports=NUM           Number of input (slave) ports ($MinSlaveIF..$MaxSlaveIF).\n" .
         "   --outports=NUM          Number of output (master) ports ($MinMasterIF..$MaxMasterIF).\n\n" .
         "   --connectivity='SI0=MI\\{0,1,2}:SI1=MI{3,4,5}'\n\n" .

         "                           Sparse interconnect declarations. The\n" .
         "                            example above means inport 0 connects\n" .
         "                            to outports 0, 1 and 2, and inport 1\n" .
         "                            connects to outports 3, 4 and 5.\n\n" .

         "   --arb=SCHEME            Arbitration scheme:\n" .
         "                            burst - Fixed priority; Master 0 has\n" .
         "                                     highest priority, does not\n" .
         "                                     break defined length bursts.\n" .
         "                            fixed - Fixed priority; Master 0 has\n" .
         "                                     highest priority.\n" .
         "                            round - Round robin priority; priority\n" .
         "                                     goes to next available master.\n\n",
         ( $Verbose ) ? '' : "\n--- $Scriptname ---\n\n";

  # Display option
  if ( $ShowArchitectureOptions ) {
    print "   --arch=VER              ARM Processor interface:\n" .
          "                            ahb2    - AMBA2.0 interface.\n" .
          "                            v6      - All ARM V6 extensions.\n" .
          "                            excl    - ARM V6 exclusive access\n" .
          "                                       extensions only.\n" .
          "                            unalign - ARM V6 unaligned and byte-\n" .
          "                                       strobed access extensions\n" .
          "                                       only.\n";
  }

  print "   --datawidth=WIDTH       Width of data bus ($DataWidths).\n" .
        "   --addrwidth=WIDTH       Width of address bus ($MinAddrWidth..$MaxAddrWidth).\n" .
        "   --userwidth=WIDTH       Width of user signals ($MinUserWidth..$MaxUserWidth).\n\n" .

        "   --OutputArb=NAME        Name of arbitration component\n" .
        "                           (max $MaxNameLength characters).\n" .
        "   --OutputStage=NAME      Name of output stage component\n" .
        "                           (max $MaxNameLength characters).\n" .
        "   --MatrixDecode=NAME     Name of address decoder component(s)\n" .
        "                           (max $MaxNameLength characters).\n" .
        "   --InputStage=NAME       Name of input stage component\n" .
        "                           (max $MaxNameLength characters).\n" .
        "   --BusMatrix=NAME        Name of top level entity\n" .
        "                           (max $MaxNameLength characters).\n\n" .

        "   --verbose               Prints run information.\n" .
        "   --help                  Prints this help.\n" .
        "   --srcdir=DIRNAME        Directory name where source files are\n" .
        "                            located (defaults to ./$HdlType/src).\n" .
        "   --tgtdir=DIRNAME        Directory name where source files are\n" .
        "                            located (defaults to ./$HdlType/built).\n" .
        "   --xmldir=DIRNAME        Directory name where XML configuration\n" .
        "                            files are located (defaults to ./xml).\n" .
        "   --overwrite             Overwrites existing bus matrix of the\n" .
        "                            same name.\n" .
        "   --notimescales          Suppresses the '`timescale' directive in\n" .
        "                            the rendered Verilog files.\n" .
        "   --check                 Disables file generation and just checks the\n" .
        "                            XML configuration file.\n\n";

  # Abort session with exit code = 0
  exit (0);
}
