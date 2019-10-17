eval "exec perl -w -S $0 $@" # -*- Perl -*-
  if ($running_under_some_sh);
  undef ($running_under_some_sh);

# ------------------------------------------------------------------------------
# This confidential and proprietary software may be used only as
# authorised by a licensing agreement from ARM Limited
#   (C) COPYRIGHT 2001-2013 ARM Limited
#       ALL RIGHTS RESERVED
# The entire notice above must be reproduced on all authorised
# copies and copies may only be made to the extent permitted
# by a licensing agreement from ARM Limited.
#
# ------------------------------------------------------------------------------
# Version and Release Control Information:
#
#  File Name           : fm2conv.pl,v
#  File Revision       : $Revision: 243498 $
#
#  Release Information : Cortex-M System Design Kit-r1p0-00rel0
#
# ------------------------------------------------------------------------------
# Purpose             : Converts an ASCII command file into a hex format,
#                       suitable for import by the FileReader bus master.
#                       Checks that the specified commands are compatible
#                       with the FileReader.
#
#                       Options:
#                            -help
#                            -quiet
#                            -adk1
#                            -busWidth=<databus width>   32 or 64(default)
#                            -endian=<endianness>        big or little(default)
#                              Note: big-endian is BE-32 (a.k.a. ARM big-endian)
#                            -stimarraysize=<size>       default = 5000 (words)
#                            -infile=<input text file>   default = filestim.m2i
#                            -outfile=<output hex file>  default = filestim.m2d
# ------------------------------------------------------------------------------

package main;

use strict;
use Getopt::Long;


# Global variables

# default values for command-line options
my $help          = 0;
my $verbose       = 1;
my $adk1          = 0;
my $endian        = 'little';
my $busWidth      = 64;
$main::infile     = 'filestim.m2i';
$main::outfile    = '';
my $arch          = 'ahb2';
my $stimarraysize = 5000;


my %command;              # hash to store stimulus fields
my %sequence;             # hash to store start of burst info
my $fileErrors      = 0;  # number of errors in input file
my $fileWarnings    = 0;  # number of warnings in input file
my $numCmds         = 0;  # number of commands in input file

my $currCmd         = 0;  # current command
my $prevCmd         = 0;  # previous command, used in case of loop commands
my $error           = 0;  # command causing current error
my $memorySize      = 0;  # counts memory size required by FRBM

my $transCount      = 0;  # no. of transfers remaining in defined-length burst
my $incrCount       = 0;  # number of transfers for incr burst
my $loopCount       = 0;  # number of looped S vectors to be expanded
my $errorsBefore    = 0;  # number of errors before looped S vector


my $lineNum         = 0;  # line number
my $prevLineNum     = 0;  # line number of previous command

my $mismatch        = 0;  # addr/size mismatch warning is pending

my $numLanesBus     = 0;  # Number of lanes determined from the specified
                          # bus width

my $maxBytesBus     = 8;  # Number of byte-lanes in the internal bus:
                          # this is a global and is constant for a particular
                          # version of FileReadCore

my $commentString = '';   # Stores any quoted string in a line of stimulus

# default values for stimulus fields
$command{'LINE'}      = 0;
$command{'DIFF'}      = '000000';
$command{'CMD'}       = '00000000'; # idle
$command{'ADDR'}      = '00000000';
$command{'DATA'}      = '0000000000000000';
$command{'MASK'}      = '';
$command{'SIZE'}      = '000';
$command{'BUR'}       = '000';
$command{'PROT'}      = '000000';
$command{'LOCK'}      = '0';
$command{'DIR'}       = '0';
$command{'RESP'}      = '00';
$command{'WAIT'}      = '0';
$command{'NUM'}       = 0;
$command{'UNALIGN'}   = '0';
$command{'BSTRB'}     = '';
$command{'FRAMEERR'}  = 0;
$command{'WRITEBS'}   = '0';

%sequence = %command;

# Get run date
my ($sec, $min, $hour, $mday, $mon, $year) = localtime(time);
$year += 1900;
$mon  += 01;


# check Perl version not older than 5.005 as switches not supported
if ($] < 5.005) {
  warn "******************* WARNING 128 *******************\n".
       "No command line switches supported!\n".
       "Default values will be used.\n".
       "Recommend upgrading to Perl version 5.005 or higher\n\n";

# Get command line options
} else {
  GetOptions( "help"            => \$help,
              "quiet"           => sub {$verbose = 0},
              "adk1"            => \$adk1,
              "infile=s"        => \$main::infile,
              "outfile=s"       => \$main::outfile,
              "buswidth=s"      => \$busWidth,
              "arch=s"          => \$arch,
              "stimarraysize=s" => \$stimarraysize,
              "endian=s"        => \$endian
          );
}


if ($verbose == 1)   {
  print "\n================================================================\n".
        "= This confidential and proprietary software may be used only\n".
        "= as authorised by a licensing agreement from ARM Limited\n".
        "=    (C) COPYRIGHT 2002-2013 ARM Limited\n".
        "=          ALL RIGHTS RESERVED\n".
        "= The entire notice above must be reproduced on all authorised\n".
        "= copies and copies may only be made to the extent permitted\n".
        "= by a licensing agreement from ARM Limited\n".
        "=\n".
        "= Script version : ADK2\n";
  printf "= Run Date : %02d/%02d/%04d %02d:%02d:%02d",
  $mday, $mon, $year, $hour, $min, $sec;
  print "\n================================================================\n\n";
}

# Help message
if ($help == 1) {
  print "Purpose:\n".
        "  Converts an ASCII command file into a hex format,\n".
        "  suitable for import by the File Reader Bus Master.\n".
        "  Checks that the specified commands are compatible\n".
        "  with the File Reader Bus Master.\n".
        "\nUsage:\n".
        "   Reads stimulus from a text file.\n".
        "   Writes hex data to a text file.\n".
        "\nOptions:\n".
        "   -help                   display this help message\n".
        "   -quiet                  display only ERROR messages\n".
        "   -adk1                   read an ADK1v1 input stimulus\n".
        "   -busWidth=<32|64>       default = 64\n".
        "   -endian=<little|big>    default = little\n".
        "                           (big-endian is BE-32 'ARM big-endian')\n".
        "   -stimarraysize=<size>   default = 5000\n".
        "   -infile=<input file>    default = filestim.m2i\n".
        "   -outfile=<output file>  default = filestim.m2d\n".
        "\n================================================================\n";
  exit(1);
}


# Check that an invalid architecture has not been entered
$arch = lc($arch);
if ($arch ne 'ahb2' and $arch ne 'v6') {
  $arch = 'ahb2';
  warn "******************* WARNING 133 *******************\n".
       "The architecture selected is invalid\n".
       "Architecture must be ahb2 or V6.\n".
       "ahb2 will be used by default.\n\n";
}

# Check for options incompatible with ADK1 stimulus
if ($adk1 == 1) {
  # Check bus width is 32 bits
  if ($busWidth != 32) {
    $busWidth = 32;
    warn "******************* WARNING 134 *******************\n".
         "ADK1v1 stimulus format has been selected.\n".
         "Data bus width of 32 bits will be used by default.\n\n";
  }

  # Check architecture is AHB2
  if ($arch eq 'v6') {
    $arch = 'ahb2';
    warn "******************* WARNING 135 *******************\n".
         "ADK1v1 stimulus format has been selected.\n".
         "ahb2 architecture will be used by default.\n\n";
  }
}

# check an invalid busWidth has not been entered
if ($busWidth != 32 && $busWidth != 64) {
  $busWidth = 64;
  warn "******************* WARNING 132 *******************\n".
       "Data bus width has been selected to be $busWidth bits.\n".
       "Data bus width must be either 32 or 64 bits.\n".
       "64 bits will be used by default.\n\n"
}

$numLanesBus = $busWidth >> 3;

# calculate default output file name
if ($main::outfile eq '') {

  if($main::infile =~ /([\w\\\/]+)\.\w+/) {
    $main::outfile = $1.'.m2d';
  } else {
    $main::outfile = $main::infile.'.f2d';
  }
}



# Report options selected
if ($verbose == 1) {
  print "Input file $main::infile\n";
  print "Output file $main::outfile\n";
  print "ADK1v1 stimulus format selected\n"
    if ($adk1 == 1);
  print "ADK2 stimulus format selected\n"
    if ($adk1 == 0);
  print "$busWidth-bit data bus selected\n";
  print "ARMv6 AMBA extensions are supported\n"
    if ($arch eq 'v6');
  print "${endian}-endian data organisation selected\n";
  print "\n";
}

# Check that input and output filenames are not the same
if ($main::infile eq $main::outfile) {
  printf "ERROR 20: Input and output file names are identical\n\n";
  $fileErrors++;

} else {
  # Open input file
  unless (open(INPUTFILE, "$main::infile") ) {

    # failed to open input file
    printf "ERROR 17: Input file does not exist".
           " or cannot be accessed\n";
    $fileErrors++;
  }

  # Open output file
  unless (open (FILEOUT, ">$main::outfile") ) {

    # failed to open output file
    printf "ERROR 21: Cannot create output file $main::outfile\n";
    $fileErrors++;
  }
}

# Only continue if no errors
if ($fileErrors) {
  die "\nExit with $fileErrors error(s) and $fileWarnings warning(s).\n\n";

} elsif ($verbose == 1) {
  printf "Reading from text file: %s\n\n", $main::infile;

}

# ------------------------------------------------------------------------------
#
#                       Stimulus file parsing
#
# Commands are detected by searching for the first non-whitespace character on
# a line.
#
# For each command, first the required fields are retrieved and checked, then
# any optional fields which are present. If a required field is invalid or
# missing then an error is raised. If an optional field is invalid or not
# recognised then a warning is raised.
# ------------------------------------------------------------------------------

# Process each line of stimulus
# while there are lines remaining to be read from the file
while (<INPUTFILE>) {

  # Keep track of stimulus file line numbers
  $lineNum++;

  # If a character exists on this line and it is not whitespace...
  if (/\S/) {
    $commentString = '';

    # Strip comment command text first, if any
    s/"([\w+|\W+|s+]+)"// and
      $commentString = $1;

    # Strip comments from end of line
    s/\s*(\#|\/\/|;|--).*//;

    # Check for adk1 option switch in the stimulus file
    if (s/^\s*-adk1\b//i) {

      $adk1 = 1;

      if ($verbose == 1) {
        printf "ADK1v1 stimulus format selected ".
               "in stimulus file\n", $lineNum;
      }


      # Check bus width is 32 bits
      if ($busWidth != 32) {
        $busWidth = 32;
        $numLanesBus = $busWidth >> 3;
        warn "******************* WARNING 134 *******************\n".
             "ADK1v1 stimulus format has been selected.\n".
             "Data bus width of 32 bits will be used by default.\n\n";
      }

      # Check architecture is AHB2
      if ($arch eq 'v6') {
        $arch = 'ahb2';
        warn "******************* WARNING 135 *******************\n".
             "ADK1v1 stimulus format has been selected.\n".
             "ahb2 architecture will be used by default.\n\n";
      }

      # Check for anything left on the line
      CheckInvalidFields();
      CheckInvalidComment($commentString);

    # If the AltMaster field is present, the entire command is ignored
    }  elsif (/\baltmaster\b/i and $verbose == 1) {

      printf "Line %4d: WARNING 241: AltMaster field is not supported:".
             " entire line will be ignored\n", $lineNum;
      $fileWarnings++;


    # Comment commands are handled separately, because they occur in zero
    # simulation time and cannot be looped
    } elsif(s/^\s*(C|comm|comment)\b//i) {

      $numCmds++;                         # increment command counter

      $command{'LINE'} = $lineNum;        # get line number
      $command{'DIFF'} = GetLineDiff();   # calculate line number increment

      # Parse the line
      ParseC($commentString);

      # Check for anything left on the line
      CheckInvalidFields();

      # add size on memory required for command to stimulus total
      CalcMemory('C');

      # write the line to the output file
      OutputHex();


    # If line starts with any other valid command then decode command
    } elsif(s/^\s*(W|R|S|B|I|P|L|Q|write|read|seq|sequential|busy|idle|poll|loop|quit)\b//i) {


      $prevCmd = $currCmd;  # save previous command in case of Loop commands
      $currCmd = uc(substr($1,0,1));      # get the current command

      $numCmds++;                         # increment command counter


      $command{'LINE'} = $lineNum;        # get line number
      $command{'DIFF'} = GetLineDiff();   # calculate line number increment


      # S or B command
      if ($currCmd eq 'S' or $currCmd eq 'B') {

        # if a burst is not in progress (defined- or undefined-length)
        if (GetTransCount() == 0 && (GetIncrCount() == 0)) {

            printf "Line %4d: ERROR 84: $currCmd command outside burst".
                   " (check burst size)\n", $lineNum;
            $fileErrors++;
        }

      }

      # Parse the line
      if    ($currCmd eq 'W') { ParseW() }
      elsif ($currCmd eq 'R') { ParseR() }
      elsif ($currCmd eq 'S') { ParseS() }
      elsif ($currCmd eq 'B') { ParseB() }
      elsif ($currCmd eq 'I') { ParseI() }
      elsif ($currCmd eq 'P') { ParseP() }
      elsif ($currCmd eq 'L') { ParseL() }
      elsif ($currCmd eq 'Q') { ParseQ() }

      # Check for anything left on the line
      CheckInvalidFields();
      CheckInvalidComment($commentString);

      # Unfold looped S vectors
      if ($loopCount > 0) {

        while($loopCount-- > 0) {

          # align data and mask and check Bstrb
          LoopedSeq();

          # add size on memory required for command to stimulus total
          CalcMemory('S');

          # write the line to the output file
          OutputHex();

          # looped S vectors are on same line of stimulus so increment is zero
          $command{'DIFF'} = '000000';
        }

      } else {
        # add size on memory required for command to stimulus total
        CalcMemory($currCmd);

        # write the line to the output file
        OutputHex();

      }

    # Commands not supported by File Read Master are ignored:
    #  M Memory command
    #  D Degrant options
    #  E XVC master event
    }  elsif (/^\s*([MED])\b/i and $verbose == 1) {

      printf "Line %4d: WARNING 240: $1 command is not supported".
             " and will be ignored\n", $lineNum;
      $fileWarnings++;

    # Syntax error if any other non-whitespace character is on the line
    } elsif (/^\s*(\S+.*)/)  {

      $error = $1;
      $currCmd = '$error';
      printf "Line %4d: ERROR 32: Unknown command :".
             " \"%s\"\n", $lineNum, $error;
      $fileErrors++;
    }

  }

  # exit loop if Q command has been detected
  if ($currCmd eq 'Q') { last }

}

# At End Of File, check for an unfinished defined-length burst (unless errcanc)
if (GetTransCount() > 0 and $sequence{'RESP'} ne '10' and ($verbose == 1)) {
  printf "Line %4d: WARNING 144: End of file: Expected further".
         " transfers in burst\n", $lineNum;
  $fileWarnings++;
}

close(INPUTFILE);
close (FILEOUT);

# End of stimulus error-checking
CheckArraySize($memorySize, $stimarraysize);

PrintSummary() if ($verbose == 1);

# error code is 1 if any errors
($fileErrors == 0) ? exit(0) : exit(1);


# ------------------------------------------------------------------------------
#
# Check size of stimulus does not exceed size of File Read Master array length
#
# ------------------------------------------------------------------------------

sub CheckArraySize {

  my $memorySize = shift;
  my $stimarraysize = shift;

  if (($verbose == 1) and ($memorySize > $stimarraysize)) {
    print  "\n";
    print  "================================================================\n";
    print  "WARNING 136: The compiled stimulus exceeds the specified size of\n";
    print  "             the FileReader array. Increase the FileReader\n";
    print  "             StimArraySize generic/parameter and use script\n";
    print  "             with the -stimarraysize switch.\n";
    print  "\n";
    printf "Compiled stimulus size  = %d x 32-bit\n",$memorySize;
    printf "FileReader array size   = %d x 32-bit\n",$stimarraysize;
    print  "================================================================\n";
    $fileWarnings++;
  }
}


# ------------------------------------------------------------------------------
#
# Print a summary of the file conversion process
#
# ------------------------------------------------------------------------------
sub PrintSummary {
  print  "\n";
  print  "================================================================\n";
  printf "Total Warnings                     = %d\n",$fileWarnings;
  printf "Total Errors                       = %d\n",$fileErrors;
  printf "Total commands                     = %d\n",$numCmds;
  printf "FileReader min array size required = %d x 32-bit\n",$memorySize;
  printf "Output file name                   = %s\n",$main::outfile;
  print  "================================================================\n";
}

# ------------------------------------------------------------------------------
#
# Write a command to the output (hex) file
#
# ------------------------------------------------------------------------------

sub OutputHex  {

  # save output format and handle so that they can be restored
  my $savedFormat = $~;
  my $savedFileHandle = select FILEOUT;

  # generate the Function word
  $command{'FUNCTION'} = BinToHex(
                                       $command{'CMD'}.
                                       $command{'SIZE'}.
                                       $command{'BUR'}.
                                       $command{'PROT'}.
                                       $command{'LOCK'}.
                                       $command{'DIR'}.
                                       $command{'RESP'}.
                                       $command{'UNALIGN'}.
                                       $command{'WRITEBS'}.
                                       $command{'DIFF'}
                                      );

  # select output stimulus format for current command type
  if    ($command{'CMD'} eq '00000000') {$~ = 'WRITECMD'}
  elsif ($command{'CMD'} eq '00010000') {$~ = 'READCMD'}
  elsif ($command{'CMD'} eq '00100000') {$~ = 'SEQCMD'}
  elsif ($command{'CMD'} eq '00110000') {$~ = 'BUSYCMD'}
  elsif ($command{'CMD'} eq '01000000') {$~ = 'IDLECMD'}
  elsif ($command{'CMD'} eq '01010000') {$~ = 'POLLCMD'}
  elsif ($command{'CMD'} eq '01100000') {$~ = 'LOOPCMD'}
  elsif ($command{'CMD'} eq '01110000') {$~ = 'COMMCMD'}
  elsif ($command{'CMD'} eq '10000000') {$~ = 'QUITCMD'}
  else {
    # default - should never happen
    printf "WARNING 255: Command undefined, defaulting to IDLE";
    $~ = 'IDLECMD';
  }

  write (FILEOUT);

  # reset format and output stream
  $~ = $savedFormat;
  select $savedFileHandle;

}


# ------------------------------------------------------------------------------
#
# W command decoding
#
# ------------------------------------------------------------------------------
sub ParseW {

  $command{'CMD'}  = '00000000';

  # Get mandatory fields
  $command{'ADDR'} = GetAddrField();
  $command{'DATA'} = GetDataField();


  # get optional fields
  $command{'MASK'}    = ''; # clear mask, otherwise could get a mismatch from old value
  $command{'SIZE'}    = GetSizeField();
  $command{'BUR'}     = GetBurstField();
  $command{'PROT'}    = GetProtField();
  $command{'LOCK'}    = GetLockField();
  $command{'RESP'}    = GetWriteRespField();
  $command{'UNALIGN'} = GetUnalignField();
  $command{'BSTRB'}   = GetBstrbField();

  # Check that response and prot agree for Write command
  CheckWriteProtResp (
                      $command{'PROT'},
                      $command{'RESP'}
                     );

  # Check that size/mask/data agree
  ($command{'SIZE'}, $command{'DATA'}, $command{'MASK'})
    = CheckSizeDataMask (
                          $numLanesBus,
                          $command{'SIZE'},
                          $command{'DATA'},
                          $command{'MASK'},
                          $command{'BSTRB'},
                        );

  # Shift data/mask into correct byte lanes
  ($command{'DATAH'}, $command{'DATAL'}, $command{'MASKH'}, $command{'MASKL'})
    = AlignDataMask (
                      $command{'SIZE'},
                      $command{'DATA'},
                      $command{'MASK'},
                      $command{'ADDR'}
                    );

  # New burst, so check for early burst termination and reset burst counters
  ResetBurstCount();

  # Check ARMv6 extensions to AMBA2.0
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($command{'ADDR'}),
                          $command{'SIZE'},
                          0, # not end of unaligned burst
                          0, # sequence address is not relevant
                          0  # not an idle transfer
                        );

  # Check address/size alignment
  $command{'FRAMEERR'}
    = CheckAddrAlign(
                      $command{'SIZE'},
                      $command{'ADDR'},
                      $command{'UNALIGN'}
                     );


  # Check any exclusive access is aligned
  CheckProtUnalign($command{'PROT'}, $command{'UNALIGN'});

  # Initialise burst counters for the remaining transfers in the burst
  SetBurstCount($command{'BUR'}, $command{'FRAMEERR'});

  # check for burst exceeding 1kB boundary
  Check1kBdy($command{'SIZE'}, $command{'BUR'}, $command{'ADDR'}, GetTransCount());

  # Save address and control information for start of burst
  %sequence = %command;

  # Reset unused fields
  $command{'WAIT'}    = '0';
  $command{'DIR'}     = '0';
  $command{'NUM'}     = 0;
}


# ------------------------------------------------------------------------------
#
# R command decoding
#
# ------------------------------------------------------------------------------
sub ParseR {

  $command{'CMD'}  = '00010000';

  # get mandatory fields
  $command{'ADDR'} = GetAddrField();
  $command{'DATA'} = GetDataField();

  # get optional fields
  $command{'SIZE'}   = GetSizeField();
  $command{'MASK'}   = GetMaskField();
  $command{'BUR'}    = GetBurstField();
  $command{'LOCK'}   = GetLockField();
  $command{'PROT'}   = GetProtField();
  $command{'RESP'}   = GetRespField();
  $command{'UNALIGN'}= GetUnalignField();
  $command{'BSTRB'}  = GetBstrbField();


  # Check that size/mask/data agree
  ($command{'SIZE'}, $command{'DATA'}, $command{'MASK'})
    = CheckSizeDataMask (
                          $numLanesBus,
                          $command{'SIZE'},
                          $command{'DATA'},
                          $command{'MASK'},
                          $command{'BSTRB'},
                        );

  # Shift data/mask into correct byte lanes
  ($command{'DATAH'}, $command{'DATAL'}, $command{'MASKH'}, $command{'MASKL'})
    = AlignDataMask (
                      $command{'SIZE'},
                      $command{'DATA'},
                      $command{'MASK'},
                      $command{'ADDR'}
                    );

  # New burst, so check for early burst termination and reset burst counters
  ResetBurstCount();

  # Check ARMv6 extensions to AMBA2.0
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($command{'ADDR'}),
                          $command{'SIZE'},
                          0, # not end of unaligned burst
                          0, # sequence address is not relevant
                          0  # not an idle transfer
                        );

  # Check address/size alignment
  $command{'FRAMEERR'}
    = CheckAddrAlign(
                      $command{'SIZE'},
                      $command{'ADDR'},
                      $command{'UNALIGN'}
                     );

  # Check any exclusive access is aligned
  CheckProtUnalign($command{'PROT'}, $command{'UNALIGN'});

  # Initialise burst counters for the remaining transfers in the burst
  SetBurstCount($command{'BUR'}, $command{'FRAMEERR'});

  # check for burst exceeding 1kB boundary
  Check1kBdy($command{'SIZE'}, $command{'BUR'}, $command{'ADDR'}, GetTransCount());

  # Save address and control information for start of burst
  %sequence = %command;

  # Reset unused fields
  $command{'WAIT'}   = '0';
  $command{'DIR'}    = '0';
  $command{'NUM'}    = 0;
}


# ------------------------------------------------------------------------------
#
# S command decoding
#
# ------------------------------------------------------------------------------
sub ParseS {

  my $endUnalignedBurst;

  $command{'CMD'} = '00100000';

  # get mandatory data field
  $command{'DATA'} = GetDataField();

  # retrieve control information from previous W or R command
  $command{'SIZE'} = $sequence{'SIZE'};
  $command{'BUR'}  = $sequence{'BUR'};
  $command{'PROT'} = $sequence{'PROT'};
  $command{'UNALIGN'} = $sequence{'UNALIGN'};

  # Calculate and save next address in sequence
  # for purpose of data alignment
  $command{'ADDR'} = IncAddr( $command{'ADDR'},
                              $command{'SIZE'},
                              $command{'BUR'}
                            );

  # Get optional fields
  $command{'MASK'}  = GetMaskField();
  $command{'RESP'}  = GetRespField();
  $command{'BSTRB'} = GetBstrbField();

  # If an error cancel response, mark the burst to suppress warning of
  # early burst termination
  if ($command{'RESP'} eq '10' ) {
    $sequence{'RESP'} = $command{'RESP'};
  }

  # Check that size/mask/data agree
  ($command{'SIZE'}, $command{'DATA'}, $command{'MASK'})
    = CheckSizeDataMask (
                          $numLanesBus,
                          $command{'SIZE'},
                          $command{'DATA'},
                          $command{'MASK'},
                          $command{'BSTRB'}
                        );

  # Shift data/mask into correct byte lanes
  ($command{'DATAH'}, $command{'DATAL'}, $command{'MASKH'}, $command{'MASKL'})
    = AlignDataMask (
                      $command{'SIZE'},
                      $command{'DATA'},
                      $command{'MASK'},
                      $command{'ADDR'}
                    );


  # Resets warning for Addr/Size alignment
  ResetMismatch();

  # Test for the end of an unaligned burst
  $endUnalignedBurst =
    (GetTransCount() == 1 and $sequence{'FRAMEERR'} == 1) ? 1 : 0;

  # Check ARMv6 extensions to AMBA2.0
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($command{'ADDR'}),
                          $command{'SIZE'},
                          $endUnalignedBurst,
                          $sequence{'ADDR'},
                          0  # not an idle transfer
                        );

  # if undefined length (INCR) burst
  if ($sequence{'BUR'} eq '001') {

    # check for burst exceeding 1kB boundary
    Check1kBdy($sequence{'SIZE'}, $sequence{'BUR'}, $sequence{'ADDR'}, GetIncrCount());

    IncIncrCount();

  } else {

    DecTransCount();

  }

  # Reset unused fields
  $command{'WAIT'} = '0';
  $command{'DIR'}  = '0';
  $command{'LOCK'} = '0';
  $command{'NUM'}  = 0;

}


# ------------------------------------------------------------------------------
#
# B command decoding
#
# ------------------------------------------------------------------------------
sub ParseB {

  my $addrTemp;
  my $endUnalignedBurst;

  $command{'CMD'}  = '00110000';

  # retrieve control information from previous W or R command
  $command{'SIZE'} = $sequence{'SIZE'};
  $command{'BUR'}  = $sequence{'BUR'};
  $command{'PROT'} = $sequence{'PROT'};
  $command{'UNALIGN'} = $sequence{'UNALIGN'};

  # Get optional fields
  $command{'WAIT'} = GetWaitField();
  $command{'BSTRB'}= GetBstrbField();

  # Calculate - but do not save - next address in sequence
  # for purpose of data alignment
  $addrTemp =  IncAddr( $command{'ADDR'},
                        $command{'SIZE'},
                        $command{'BUR'}
                      );


  # Test for the end of an unaligned burst
  $endUnalignedBurst =
    (GetTransCount() == 1 and $sequence{'FRAMEERR'} == 1) ? 1 : 0;

  # Check ARMv6 extensions to AMBA2.0
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($addrTemp),
                          $command{'SIZE'},
                          $endUnalignedBurst,
                          $sequence{'ADDR'},
                          0  # not an idle transfer
                        );

  # Wait and Resp fields share bits, as they are never both used
  $command{'RESP'}    = '0'.$command{'WAIT'};

  # if undefined length (INCR) burst
  if ($sequence{'BUR'} eq '001') {
    # check for burst exceeding 1kB boundary
    Check1kBdy($sequence{'SIZE'}, $sequence{'BUR'}, $sequence{'ADDR'}, GetIncrCount());
  }

  # Reset unused fields
  $command{'DIR'}     = '0';
  $command{'LOCK'}    = '0';
  $command{'NUM'}     = 0;
  # Note: Address field must not be updated, in case of following S vectors
}


# ------------------------------------------------------------------------------
#
# I command decoding
#
# ------------------------------------------------------------------------------
sub ParseI {

  $command{'CMD'}    = '01000000';

  # Get optional fields
  $command{'ADDR'}   = GetIdleAddrField();
  $command{'DIR'}    = GetDirField();
  $command{'SIZE'}   = GetSizeField();
  $command{'BUR'}    = GetBurstField();
  $command{'LOCK'}   = GetLockField();
  $command{'PROT'}   = GetProtField();
  $command{'WAIT'}   = GetWaitField();
  $command{'UNALIGN'}= GetUnalignField();
  $command{'BSTRB'}  = GetBstrbField();

  # Default Size to bus width if not specified
  $command{'SIZE'} = BytesToHsize($numLanesBus) unless ($command{'SIZE'} ne '');

  # Do not check address/size alignment for idle transfer
  $command{'FRAMEERR'} = 0;

  # Idle command implies no sequential transfers following
  # (also checks for early burst termination)
  ResetBurstCount();

  # Check ARMv6 extensions to AMBA2.0
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($command{'ADDR'}),
                          $command{'SIZE'},
                          0, # not end of unaligned burst
                          0, # sequence address is not relevant
                          1  # is an idle transfer, so no errors reported
                        );

  # Save address and control information for start of burst
  %sequence = %command;

  # Wait and Resp fields share bits, as they are never both used
  $command{'RESP'}    = '0'.$command{'WAIT'};

  # Reset unused fields
  $command{'NUM'}    = 0;
}

# ------------------------------------------------------------------------------
#
# P command decoding
#
# ------------------------------------------------------------------------------
sub ParseP {

  $command{'CMD'} = '01010000';

  # get mandatory fields
  $command{'ADDR'} = GetAddrField();
  $command{'DATA'} = GetDataField();

  # get optional fields
  $command{'SIZE'}   = GetSizeField();
  $command{'MASK'}   = GetMaskField();
  $command{'BUR'}    = GetPollBurstField();
  $command{'PROT'}   = GetProtField();
  $command{'TOUT'}   = GetToutField();
  $command{'UNALIGN'}= GetUnalignField();
  $command{'BSTRB'}  = GetBstrbField();

  # Check that size/mask/data agree
  ($command{'SIZE'}, $command{'DATA'}, $command{'MASK'})
    = CheckSizeDataMask (
                          $numLanesBus,
                          $command{'SIZE'},
                          $command{'DATA'},
                          $command{'MASK'},
                          $command{'BSTRB'}
                        );

  # Shift data/mask into correct byte lanes
  ($command{'DATAH'}, $command{'DATAL'}, $command{'MASKH'}, $command{'MASKL'})
    = AlignDataMask (
                      $command{'SIZE'},
                      $command{'DATA'},
                      $command{'MASK'},
                      $command{'ADDR'}
                    );


  # Burst type can only be SIGN or INCR therefore no S vectors are implied
  # (also checks for early burst termination)
  ResetBurstCount();

  # Check ARMv6 extensions to AMBA2.0
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($command{'ADDR'}),
                          $command{'SIZE'},
                          0, # not end of unaligned burst
                          0, # sequence address is not relevant
                          0  # not an idle transfer
                        );

  # Check address/size alignment
  $command{'FRAMEERR'}
    = CheckAddrAlign(
                      $command{'SIZE'},
                      $command{'ADDR'},
                      $command{'UNALIGN'}
                     );

  # check address alignment
  if ($command{'FRAMEERR'} == 1)  {
    printf "Line %4d: ERROR 108: Cannot poll".
           " an unaligned address\n", $lineNum;
    $fileErrors++;
  }

  # Save address and control information for start of burst
  %sequence = %command;

  # Reset unused fields
  $command{'WAIT'}   = '0';
  $command{'LOCK'}   = '0';
  $command{'DIR'}    = '0';
  $command{'RESP'}   = '00';
}


# ------------------------------------------------------------------------------
#
# L command decoding
#
# ------------------------------------------------------------------------------
sub ParseL {

  $command{'CMD'} = '01100000';

  # get mandatory field
  $command{'NUM'} = GetNumberField();

  # Looped S vectors must be expanded, because of data alignment
  if ($prevCmd eq 'S') {

    # Set command to S because loop will be unfolded
    $command{'CMD'} = '00100000';

    # Set global counter for number of looped vectors remaining
    $loopCount = hex($command{'NUM'});

    if ($sequence{'BUR'} ne '001') {

      # defined burst length
      if (GetTransCount() - $loopCount < 0) {
        printf "Line %4d: ERROR 89: Loop number exceeds".
               " number of remaining transfers\n", $lineNum;
        $fileErrors++;
      }

    } else {

      # undefined length burst
      # check for burst exceeding 1kB boundary
      Check1kBdy($sequence{'SIZE'}, $sequence{'BUR'}, $sequence{'ADDR'}, GetIncrCount() + $loopCount - 1);
    }


  } else {
    # Reset unused fields
    $command{'SIZE'}    = '000';
    $command{'UNALIGN'} = '0';
    $command{'BSTRB'}   = '';
    $command{'WAIT'}    = '0';
    $command{'BUR'}     = '000';
    $command{'PROT'}    = '000000';
    $command{'LOCK'}    = '0';
    $command{'DIR'}     = '0';
    $command{'RESP'}    = '00';
    $command{'WRITEBS'} = '0';
  }

  # Record current number of errors to suppress multiple error reporting in loops
  $errorsBefore = $fileErrors;

}


# ------------------------------------------------------------------------------
#
# One iteration of looped Sequential command unfolding
#
# ------------------------------------------------------------------------------
sub LoopedSeq {

  my $endUnalignedBurst;


  $command{'ADDR'} = IncAddr( $command{'ADDR'},
                              $command{'SIZE'},
                              $command{'BUR'}
                            );

  # Test for the end of an unaligned burst
  $endUnalignedBurst =
    (GetTransCount() == 1 and $sequence{'FRAMEERR'} == 1) ? 1 : 0;


  # Data and mask will need realigning for new address unless full bus
  # width is specified. Shift data/mask into correct byte lanes
  ($command{'DATAH'}, $command{'DATAL'}, $command{'MASKH'}, $command{'MASKL'})
    = AlignDataMask (
                      $command{'SIZE'},
                      $command{'DATA'},
                      $command{'MASK'},
                      $command{'ADDR'}
                    );

  # If not already detected a Bstrb error, perform an additional check on
  # the extra transfer at the end of an unaligned burst
  ($command{'UNALIGN'}, $command{'BSTRBHEX'}, $command{'WRITEBS'})
    = CheckUnalignBstrb (
                          $command{'UNALIGN'},
                          $command{'BSTRB'},
                          hex($command{'ADDR'}),
                          $command{'SIZE'},
                          $endUnalignedBurst,
                          $sequence{'ADDR'},
                          $fileErrors<=>$errorsBefore # only report error once
                        );

  # if undefined length (INCR) burst
  if ($sequence{'BUR'} eq '001') {
    IncIncrCount();

  } else {
    DecTransCount();

  }
}


# ------------------------------------------------------------------------------
#
# C command decoding
#
# ------------------------------------------------------------------------------
sub ParseC {

  my $commentString = shift;
  my @commentPacked;
  my $word;
  my $i;

  $command{'CMD'} = '01110000';

  # Check comment for illegal characters
  $commentString = CheckComment($commentString);

  # Pack the comment string into words
  @commentPacked = PackComment($commentString);

  # Length of array is the number of words
  $command{'COUNT'} = @commentPacked;

  # Store value in Number field in hex format
  $command{'NUM'} = ToHex32($command{'COUNT'});

  # Store the packed comment into the appropriate elements of %command
  $i = 1;
  foreach $word ( @commentPacked ) {
    $command{"WORD$i"} = ToHex32($word);
    $i++;
  }

  # Note: Unused fields must not be reset, in case comment occurs
  # inside burst or loop
}


# ------------------------------------------------------------------------------
#
# Q command decoding
#
# ------------------------------------------------------------------------------
sub ParseQ {

  $command{'CMD'}  = '10000000';

  # Reset unused fields
  $command{'UNALIGN'} = '0';
  $command{'BSTRB'}   = '';
  $command{'WAIT'}    = '0';
  $command{'SIZE'}    = '000';
  $command{'BUR'}     = '000';
  $command{'PROT'}    = '000000';
  $command{'LOCK'}    = '0';
  $command{'DIR'}     = '0';
  $command{'RESP'}    = '00';
  $command{'NUM'}     = '0000';
  $command{'ADDR'}    = '00000000';
  $command{'WRITEBS'} = '0';
}


# ------------------------------------------------------------------------------
# Get mandatory address field value
#
# I/O: searches from start of line for the address field
#      returns the value of the address field, or reports an error
# ------------------------------------------------------------------------------
sub GetAddrField {

  my $addr;


  if (s/\b(?:0x)?([0-9A-F]{8})\b//i) {
    $addr = $1;

  } else {
    # mandatory field missing
    $addr = 0;
    printf "Line %4d: ERROR 36: Required field is missing or".
           " in wrong format\n", $lineNum;
    $fileErrors++;

  }

  return $addr;
}


# ------------------------------------------------------------------------------
# Get optional address field value
#
# I/O: searches along line for the address field
#      returns the value of the address field
# ------------------------------------------------------------------------------
sub GetIdleAddrField {

  my $addr;

  if (s/\b(?:0x)?([0-9A-F]{8})\b//i ) {
    $addr = $1;

  } else {
    # default
    $addr = '00000000';

  }

  return $addr;
}


# ------------------------------------------------------------------------------
# Get mandatory data field value
#
# I/O: searches from start of line for the data field
#      returns the value of the data field, or reports an error
# ------------------------------------------------------------------------------
sub GetDataField {

  my $data;             # (hex string) value of data field in stimulus
  my $dataFieldWidth;   # width of data field, i.e. number of hex digits

  # Note 'X' is allowed, but may cause an error in the FileReadCore
  if ($adk1 == 0 and s/\b(?:0x)?([0-9A-FX]{2,32})\b//i) {
    $data = $1;

  } elsif ($adk1 == 1 and s/\b([0-9A-FX]{8})\b//i) {
    $data = $1;

  } else {
    # mandatory field missing
    $data = 0;
    printf "Line %4d: ERROR 36: Required field is missing or".
           " in wrong format\n", $lineNum;
    $fileErrors++;
  }


  # if data field exists
  if ($data) {

    $dataFieldWidth = length($data);

    # check if data field width is greater than busWidth
    if (($dataFieldWidth << 2) > $busWidth) {
      printf "\nLine %4d: ERROR 48: Data field length exceeds".
             " data bus width\n", $lineNum;
      $fileErrors++;

    # check data field width is either 2,4,8 or 16 hex digits
    } elsif (($dataFieldWidth != 2) && ($dataFieldWidth != 4) &&
        ($dataFieldWidth != 8) && ($dataFieldWidth != 16)) {
      printf "\nLine %4d: ERROR 49: Data field is an".
             " invalid length\n", $lineNum;
      $fileErrors++;

    }

  }

  return $data;
}


# ------------------------------------------------------------------------------
# Get mask field value
#
# I/O: searches along the current line for a valid mask field value
#      returns the value of the mask field
# ------------------------------------------------------------------------------
sub GetMaskField {

 my $mask;
 my $maskFieldWidth  = 0;        # width of mask field read from stimulus

  if ($adk1 == 0 and s/\b(?:0x)?([0-9A-F]{2,32})\b//i ) {
    $mask = $1;

  } elsif ($adk1 == 1 and s/\b([0-9A-F]{8})\b//i) {
    $mask = $1;

  } else {
    $mask = '';
  }

  $maskFieldWidth = length($mask);

  # if mask field exists
  unless ($mask eq '') {

    # check if mask field width is greater than busWidth
    if (($maskFieldWidth << 2) > $busWidth) {

      printf "\nLine %4d: ERROR 52: Mask field length exceeds".
             " data bus width\n", $lineNum;
      $fileErrors++;
      $mask = '';


    # check mask field width is either 2,4,8 or 16 hex digits
    } elsif (($maskFieldWidth != 2) && ($maskFieldWidth != 4) &&
        ($maskFieldWidth != 8) && ($maskFieldWidth != 16)) {

      printf "\nLine %4d: ERROR 53: Mask field is an".
             " invalid length\n", $lineNum;
      $fileErrors++;
      $mask = '';

    }
  }

  return $mask;
}


# ------------------------------------------------------------------------------
# Get size field value
#
# I/O: searches along the current line for a valid size field value
#      returns the value of the size field
# ------------------------------------------------------------------------------
sub GetSizeField {

  my $size;

  if (s/\bb\b|\bbyte\b|\bsize8\b//i) {
    $size = '000';

  } elsif (s/\bh\b|\bhword\b|\bsize16\b//i) {
    $size = '001';

  } elsif (s/\bw\b|\bword\b|\bsize32\b//i) {
    $size = '010';

  } elsif (s/\bd\b|\bdword\b|\bsize64\b//i) {
    # 64-bit transfer size not supported in ADK1
    if($adk1 == 1) {
    printf "Line %4d: ERROR 40: size64 not supported".
           " in FileReader ADK1 stimulus\n", $lineNum;
    $fileErrors++;
    $size = '010';

    # 64-bit transfer not supported when busWidth set to 32-bit
    } elsif (($busWidth == 32)) {
      printf "Line %4d: ERROR 40: size64 not valid".
             " when outputting to 32-bit busWidth\n", $lineNum;
      $fileErrors++;
      $size = ''; # size will be determined later

    } else {
      $size = '011';

    }

  } elsif (s/\bq\b|\bqword\b|\bsize128\b//i) {
    printf "Line %4d: ERROR 40: size128 not supported".
           " by AHB File Reader Master\n", $lineNum;
    $fileErrors++;
    $size = ''; # size will be determined later

  } else {
    $size = ''; # size will be determined later

  }

  return $size;
}


# ------------------------------------------------------------------------------
# Get burst type
#
# I/O: searches along the current line for a valid burst field value
#      returns the value of the burst field
# ------------------------------------------------------------------------------
sub GetBurstField {

  my $burst;

  if (s/\bsing\b|\bsingle\b//i) {
    $burst = '000';

  } elsif (s/\bincr\b//i) {
    $burst = '001';

  } elsif (s/\bwrap4\b//i) {
    $burst = '010';

  } elsif (s/\bincr4\b//i) {
    $burst = '011';

  } elsif (s/\bwrap8\b//i) {
    $burst = '100';

  } elsif (s/\bincr8\b//i) {
    $burst = '101';

  } elsif (s/\bwrap16\b//i) {
    $burst = '110';

  } elsif (s/\bincr16\b//i) {
    $burst = '111';

  } else {
    # default to INCR
    $burst = '001';
  }

  return $burst;
}


# ------------------------------------------------------------------------------
# Get burst type for Poll commands
#
# I/O: searches along the current line for a valid burst field value
#      returns the value of the burst field
# Only Incr and Single are allowed
# ------------------------------------------------------------------------------
sub GetPollBurstField {

  my $burst;

  if (s/\bsing\b|\bsingle\b//i) {
    $burst = '000';

  } elsif (s/\bincr\b//i) {
    $burst = '001';

  } elsif (s/\b((wrap|incr)(4|8|16))\b//i) {
    # invalid burst type for Poll command
    printf "Line %4d: ERROR 80: Burst type \"$1\" is".
           " incompatible with P command\n", $lineNum;
    $fileErrors++;

    # default to INCR
    $burst = '001';

  } else {
    # default to INCR
    $burst = '001';
  }

  return $burst;
}


# ------------------------------------------------------------------------------
# Get protection field value
#
# I/O: searches along the current line for a valid protection field value
#      returns the value of the protection field
# ------------------------------------------------------------------------------
sub GetProtField {

  my $prot;

  if ($adk1 == 0 ) {
    # reading adk2 stimulus
    if (s/\bp([0-1]{6})\b//i) {
      $prot = $1;

      if ($arch eq 'v6') {

        # Prot[4] should only be asserted if Prot[3] is asserted
        if  ( substr($prot, 1, 2) eq '10') {
          printf "Line %4d: ERROR 105: HPROT[4] can only be asserted".
                 " if HPROT[3] is asserted \n", $lineNum;
          $fileErrors++;
          # The value of $prot is not changed, to allow the testing
          # of invalid values
        }
      } else {

        printf "Line %4d: ERROR 96: ARMv6 AMBA extensions are not allowed".
               " unless V6 architecture is selected: Prot field\n", $lineNum;
        $fileErrors++;
        # The value of $prot is not changed, to allow the testing
        # of invalid values

      }

    } elsif ($arch ne 'v6' and s/\bp([0-1]{4})\b//i) {
      # add extra leading zeros to ahb2 prot value
      $prot = '00'.$1;

    } else {
      # default value
      $prot = '000000';

    }

  # reading adk1 stimulus
  } elsif (s/\b([0-1]{4})\b//i) {
    # add extra leading zeros to ahb2 prot value
    $prot = '00'.$1;

  } else {
      # default value
    $prot = '000000';

  }

  return $prot;
}


# ------------------------------------------------------------------------------
# Get lock field value
#
# I/O: searches along the current line for a valid lock field value
#      returns the value of the lock field
# ------------------------------------------------------------------------------
sub GetLockField {

  my $lock;

  if (s/\block\b//i){
    $lock = '1';

  } elsif (s/\bnolock\b//i) {
    $lock = '0';

  } else {
    $lock = '0';

  }

  return $lock;
}


# ------------------------------------------------------------------------------
# Get Direction field value
#
# I/O: searches along the current line for a valid direction field value
#      returns the value of the direction field
# ------------------------------------------------------------------------------
sub GetDirField {

  my $dir;

  if (s/\bread\b//i) {
    $dir = '0';

  } elsif (s/\bwrite\b//i) {
    $dir = '1';

  } else {
    $dir = '0';

  }

  return $dir;
}


# ------------------------------------------------------------------------------
# Get Resp field value
#
# I/O: searches along the current line for a valid error field value
#      returns the value of the error field
# ------------------------------------------------------------------------------
sub GetRespField {

  my $resp;


  if (s/\bok\b|\bokay\b//i) {
    $resp = '00';

  } elsif (s/\berrcont|errorcont\b//i) {
    $resp = '01';

  }  elsif (s/\berrcanc|errorcanc\b//i) {
    $resp = '10';

  } elsif (s/\bxfail\b//i and $adk1 == 0) {
    # Reading ADK2 stimulus

    $resp = '00';

    if ($arch eq 'v6') {
      printf "Line %4d: ERROR 104: XFAIL response can only be specified".
             " for a W command with Prot[5] asserted\n", $lineNum;
      $fileErrors++;

    } else {
      printf "Line %4d: ERROR 96: ARMv6 AMBA extensions are not allowed".
             " unless V6 architecture is selected: Resp field\n", $lineNum;
      $fileErrors++;

    }

  } else {
    $resp = '00';

  }

  return $resp;
}


# ------------------------------------------------------------------------------
# Get Resp field value for Write command
#
# I/O: searches along the current line for a valid error field value
#      returns the value of the error field
# ------------------------------------------------------------------------------
sub GetWriteRespField {

  my $resp;


  if (s/\bok\b|\bokay\b//i) {
    $resp = '00';

  } elsif (s/\berrcont|errorcont\b//i) {
    $resp = '01';

  }  elsif (s/\berrcanc|errorcanc\b//i) {
    $resp = '10';

  } elsif (s/\bxfail\b//i and $adk1 == 0) {
    # Reading ADK2 stimulus

    if ($arch eq 'v6') {
      $resp = '11';

    } else {
      $resp = '00';
      printf "Line %4d: ERROR 96: ARMv6 AMBA extensions are not allowed".
             " unless V6 architecture is selected: Resp field\n", $lineNum;
      $fileErrors++;

    }

  } else {
    $resp = '00';

  }

  return $resp;
}


# ------------------------------------------------------------------------------
# Get Wait field value
#
# I/O: searches along the current line for a valid Wait field value
#      returns the value of the wait field
# ------------------------------------------------------------------------------
sub GetWaitField {

  my($wait) = '0';

  if ($adk1 == 0) {
    # reading adk2 stimulus

    if (s/\bwait\b//i) {
      $wait = '1';

    } elsif (s/\bnowait\b//i) {
      $wait = '0';

    }

  } else {
    # reading adk1 stimulus
    $wait = '0';

  }

  return $wait;
}


# ------------------------------------------------------------------------------
# Get Loop mandatory number field value
#
# I/O: searches along the current line for a valid number field value
#      returns a string of the hex value of the number field,
#      or reports an error an defaults to zero
# ------------------------------------------------------------------------------
sub GetNumberField {

  my $num;
  my $hexNum = '00000000';

  if (s/\b([0-9]{1,10})\b//i) {

    $num = $1;

    if ($num > 2**32-1 or $num < 1) {
      # number is out of range
      printf "Line %4d: ERROR 43: Loop number out".
             " of range [1 to 2^32-1]\n", $lineNum;
      $fileErrors++;
      $hexNum = '00000000';

    } else {
      # convert to hex string
      $hexNum = ToHex32($num);

    }

  } else {
    printf "Line %4d: ERROR 37: Loop command must".
           " have number specified\n", $lineNum;;
    $fileErrors++;
    $hexNum = '00000000';

  }

  return $hexNum;
}


# ------------------------------------------------------------------------------
# Get TimeOut field value
#
# I/O: searches along the current line for a valid repeat field value
#      returns the value of the repeat field
# ------------------------------------------------------------------------------
sub GetToutField {

  my $num;
  my $hexNum = '00000000';

  # TimeOut field is not allowed for ADK1 stimulus
  if ($adk1 == 0 and s/\b[t|T]([0-9]{1,10})\b//i) {

    $num = $1;

    if ($num > 2**32-1) {
      # number is out of range
      printf "Line %4d: ERROR 44: Time out value out".
             " of range [0 to 2^32-1]\n", $lineNum;
      $fileErrors++;
      $hexNum = '00000000';

    } else {
      # convert to hex string
      $hexNum = ToHex32($num);

    }

  } else {
    $hexNum = '00000000';

  }

  return $hexNum;
}


# ------------------------------------------------------------------------------
# Get Unalign field value
#
# I/O: searches along the current line for a valid Unalign field value
#      returns the value of the Unalign field
# ------------------------------------------------------------------------------
sub GetUnalignField {

  my $unalign;

  if (s/\balign\b//i) {
    $unalign = '0';

  } elsif (s/\bunalign\b//i) {
    $unalign = '1';

  } else {
    $unalign = '';

  }

  if  ( $arch ne 'v6' and $unalign ne '' ) {
    printf "Line %4d: ERROR 96: ARMv6 AMBA extensions are not allowed".
           " unless V6 architecture is selected: Unalign field\n", $lineNum;
    $fileErrors++;
  }

  return $unalign;
}


# ------------------------------------------------------------------------------
# Get Bstrb field value
#
# I/O: Searches along the current line for a valid Bstrb field value
#      Returns the value of the Bstrb field as a numeric value
#      or empty string if not present or in error
# ------------------------------------------------------------------------------
sub GetBstrbField {

  my $bstrb;
  my $bstrbFieldWidth = 0;

  # If Bstrb field found
  if (s/\b[s|S]([0|1]{1,16})\b//i) {

    $bstrb = $1;
    $bstrbFieldWidth = length($bstrb);

    if  ( $arch ne 'v6' ) {
      printf "Line %4d: ERROR 96: ARMv6 AMBA extensions are not allowed".
             " unless V6 architecture is selected: Bstrb field\n", $lineNum;
      $fileErrors++;
      $bstrb = '';

      # check that Bstrb is a valid length for the selected databus width
    } elsif ($bstrbFieldWidth > $numLanesBus) {

      printf "Line %4d: ERROR 100: Byte Lane Strobe is not".
             " valid for selected busWidth.\n", $lineNum;
      $fileErrors++;
      $bstrb = '';

    # check Bstrb field width is either 1,2,4 or 8 binary digits
    } elsif (($bstrbFieldWidth != 1) && ($bstrbFieldWidth != 2) &&
          ($bstrbFieldWidth != 4) && ($bstrbFieldWidth != 8)) {

      printf "Line %4d: ERROR 100: Byte Lane Strobe is an".
             " invalid length\n", $lineNum;
      $fileErrors++;
      $bstrb = '';

    }

  } else {
    $bstrb = '';

  }

  return $bstrb;
}


# ------------------------------------------------------------------------------
# Calculate line difference
#
# I/O: reads current line number and finds the difference from the last command
#      returns the difference
# ------------------------------------------------------------------------------
sub GetLineDiff {

  my $lineDiffBin;
  my $lineDiff;

  $lineDiff = ($lineNum - $prevLineNum);
  $prevLineNum = $lineNum;

  # if there are more than 63 blank or comment lines between two commands
  #  issue a warning to decrease gap, or add a blank C command i.e. C ""
  if ($lineDiff > 63) {
    $lineDiff = 63;
    if ($verbose == 1) {
      printf "Line %4d: WARNING 169: Number of blank or comment lines".
             " before command exceeds 63\n", $lineNum;
      $fileWarnings++;
    }
  }

  # convert $lineDiff into 6-digits binary
  $lineDiffBin = substr ToBin8($lineDiff), 2, 6;

  return $lineDiffBin;
}


# ------------------------------------------------------------------------------
# Check invalid fields
#
# Reports any non-whitespace words as errors
# ------------------------------------------------------------------------------
sub CheckInvalidFields {

  my $item;

  # First check for unsupported fields that may be ignored
  if (s/\bdegrant\b//i and $verbose == 1) {

    printf "Line %4d: WARNING 242: DeGrant field is not supported".
           " and will be ignored\n", $lineNum;
    $fileWarnings++;
  }


   # If there is anything but whitespace left on the line, it is invalid.
   # Only report warnings if verbose is requested
   if (($verbose == 1) and /\S/) {

    foreach $item ( split ) {
       printf "Line %4d: WARNING 164: \"$item\" is an".
              " invalid or duplicate field\n", $lineNum;
       $fileWarnings++;
    }
  }
}


# ------------------------------------------------------------------------------
# Check invalid comment
#
# Reports error if comment string is found where not expected
# ------------------------------------------------------------------------------
sub CheckInvalidComment {

  my $item = shift;

  if ($item ne '') {
     printf "Line %4d: WARNING 164: \"$item\" is an".
            " invalid or duplicate field\n", $lineNum;
     $fileWarnings++;
  }
}


# ------------------------------------------------------------------------------
# Pack comment
#
# Converts a character string to a list of up to 20 32-bit words
# Pads with whitespace
# Reports error for zero-length string
# ------------------------------------------------------------------------------
sub PackComment {

  my $commentString = shift;
  my @words;

  my $length;

  $length = length($commentString);

  if ($length == 0) {

    # Error if zero-length string
    printf "Line %4d: ERROR 38: Comment command requires".
           " a string within double quotes\n", $lineNum;
    $fileErrors++;
    $commentString = "\x00"; # Use a NULL character instead of the empty string

  } elsif ($length > 80 and $verbose == 1) {

      # warn if string longer than 80 chars
      printf "Line %4d: WARNING 168: Comment exceeds limit".
             " of 80 characters. Message will be truncated\n", $lineNum;
      $fileWarnings++;

  }


  # Convert string to up to 20 32-bit words
  # String is first padded with 3 null characters
  @words = unpack ( 'L20', $commentString."\x00\x00\x00" );

  return @words
}

# ------------------------------------------------------------------------------
# Check comment
#
# Replaces invalid comment characters with a dash (-) and warns.
# ------------------------------------------------------------------------------
sub CheckComment {

  my $commentString = shift;
  my $item;

  # Report invalid characters in comment string.
  # Note: every match character has been escaped (using \) because most of
  # these characters have a special meaning inside a regular expression
  if ($verbose == 1) {
    for $item ($commentString =~
      /[^\w\!\$\%\^\&\*\(\)\-\+\=\{\}\[\]\:\;\@\'\~\#\<\>\,\.\?\/\|\ ]/cg) {

      printf "Line %4d: WARNING 165: $item is an".
             " invalid character\n", $lineNum;
      $fileWarnings++;
    }
  }

  # Replace invalid characters with a dash (-).
  # Note: every match character has been escaped (using \) because most of
  # these characters have a special meaning inside a regular expression
  $commentString =~
    s/[^\w\!\$\%\^\&\*\(\)\-\+\=\{\}\[\]\:\;\@\'\~\#\<\>\,\.\?\/\|\ ]/-/g;

  return $commentString;
}


# ------------------------------------------------------------------------------
# Check Prot and Resp fields for write command
#
# Can only expect XFAIL for a Write command with Prot[5] set
# ------------------------------------------------------------------------------
sub CheckWriteProtResp {

my $prot = shift;
my $resp = shift;

  if ($resp eq '11' and $prot !~ '1[0-1]{5}') {
    printf "Line %4d: ERROR 104: XFAIL response can only be specified".
           " for a W command with Prot[5] asserted\n", $lineNum;
    $fileErrors++;
  }
}


# ------------------------------------------------------------------------------
# Increment address
#
# Calculate next address in sequence
#
# ------------------------------------------------------------------------------
sub IncAddr {

  my $incrAddr = hex(shift);
  my $sizeBytes = HsizeToBytes(shift);
  my $burst = shift;

  my $burstLength = 0;
  my $wrapBytes = 0; # number of bytes in burst

  # calculate beats in wrapping bursts
  if ($command{'BUR'} eq '010') {

    $burstLength = 4;

  } elsif ($command{'BUR'} eq '100')  {

    $burstLength = 8;

  } elsif ($command{'BUR'} eq '110')  {

    $burstLength = 16;
  }

  # Address is always incremented from an aligned version
  $incrAddr &= (0xFFFFFFFF - $sizeBytes + 1);

  # Increment address by size of transfer
  $incrAddr += $sizeBytes;

  # Trap boundaries for wrapping bursts
  if ($burstLength > 0) {

    # number of bytes in burst (size * beats)
    $wrapBytes = $sizeBytes * $burstLength;

    if ($incrAddr % $wrapBytes == 0) {
      $incrAddr -= $wrapBytes;
    }
  }

  $incrAddr = ToHex32($incrAddr);

  return $incrAddr;
}


# ------------------------------------------------------------------------------
# Determine the transfer size
#
# Check transfer size integrity
#   Checks there are no discrepancies in transfer size by comparing values of
#    the Size, Data and Mask field.
# Assumes Data and Mask size not > bus width
# ------------------------------------------------------------------------------

sub CheckSizeDataMask {

  my $bytesBus  = shift;
  my $size      = shift;
  my $data      = shift;
  my $mask      = shift;
  my $bstrb     = shift;

  # Lengths of fields (in bytes)
  my $bytesSize = $size eq '' ? 0 : HsizeToBytes($size);
  my $bytesData = length($data) >> 1; # Number of bytes is number of hex digits /2
  my $bytesMask = length($mask) >> 1; # Number of bytes is number of hex digits /2
  my $bytesBstrb = length($bstrb);    # Number of bytes is number of binary digits
  my $bytesResult   = 0;

  my $mismatchError = 0;


  # Size field sets size whenever specified
  if ( ($bytesSize > 0) ) {
    $bytesResult = $bytesSize;
  }

  # Data only sets size if data field is specified and
  # size implied by data < busWidth
  if ( ($bytesData > 0)  and ($bytesData < $bytesBus) ) {
    if ($bytesResult == 0) { # resultant size not already set
    # size of data sets transfer size
    $bytesResult = $bytesData;
    } elsif ($bytesResult != $bytesData) {
      $mismatchError = 1; # set mismatch error flag
    }
  }


  # Mask only sets size if size implied by mask < busWidth
  if ( ($bytesMask > 0) and  ($bytesMask < $bytesBus) ) {
    if ($bytesResult == 0) { # resultant size not already set
    # size of mask sets transfer size
    $bytesResult = $bytesMask;
    } elsif ($bytesResult != $bytesMask)  {
      $mismatchError = 1; # set mismatch error flag
    }
  }

  # Bstrb only sets size if size implied by Bstrb < busWidth
  if ( ($bytesBstrb > 0) and  ($bytesBstrb < $bytesBus) ) {
    if ($bytesResult == 0) { # resultant size not already set
    # size of Bstrb sets transfer size
    $bytesResult = $bytesBstrb;
    } elsif ($bytesResult != $bytesBstrb)  {
      printf "Line %4d: ERROR 57: Transfer size mismatch:".
             " Check Bstrb\n", $lineNum;
      $fileErrors++;
    }
  }

  # Default resultant size is the bus width
  $bytesResult = $bytesBus unless $bytesResult > 0;

  # Default size is the resultant size
  $bytesSize = $bytesResult unless $bytesSize > 0;

  # If a transfer size mismatch occurred, display Error else
  #  check if Data/Mask needs aligning within busWidth
  if ($mismatchError == 1)  {
    printf "Line %4d: ERROR 56: Transfer size mismatch:".
           " Check Size/Data/Mask\n", $lineNum;
    $fileErrors++;
  }

  # Convert resultant size back to binary string
  $size = BytesToHsize($bytesSize);

  # Default data if data not specified
  if ($data eq '' ) {
    $bytesData = $bytesBus;  # default data is zero across entire bus
    $data = '0' x ($bytesData << 1); # Number of hex digits is number of bytes *2
  }

  # Default mask if mask not specified
  if ($mask eq '') {
    if ($adk1 == 0) {
      $bytesMask = $bytesResult;  # inactive byte lanes are masked out for ADK2
    } else {
      $bytesMask = $bytesBus;     # entire bus is compared with data for ADK1
    }
    $mask = 'F' x ($bytesMask << 1); # Number of hex digits is number of bytes *2
  }

  return ($size, $data, $mask);

}

# ------------------------------------------------------------------------------
# Shifts the data and mask to the correct byte lanes
# ------------------------------------------------------------------------------
sub AlignDataMask {

  my $size      = shift;
  my $data      = shift;
  my $mask      = shift;
  my $address   = shift;

  # Lengths of fields (in bytes)
  my $bytesSize = HsizeToBytes($size);
  my $bytesData = length($data) >> 1; # Number of bytes is number of hex digits /2
  my $bytesMask = length($mask) >> 1; # Number of bytes is number of hex digits /2

  # intermediate variables for data alignment
  my $dataH;
  my $dataL;

  # intermediate variables for mask alignment
  my $maskH;
  my $maskL;

  # low order address bits
  my $offset;

  # Calculate position within the hex string that the data/mask will start
  $offset = hex($address)
            & (($maxBytesBus-1) << FromBin8($size)) & ($maxBytesBus-1);

  # Modify the offset according to the endianness of the transfer
  $offset = MakeOffsetBigEndian( $offset ) if ($endian eq 'big');

  # Shift the data to the correct byte lanes
  ($dataH, $dataL) = ShiftData( $data, $bytesData, $offset );

  # Shift the mask to the correct byte lanes
  ($maskH, $maskL) = ShiftData( $mask, $bytesMask, $offset );

  return ($dataH, $dataL, $maskH, $maskL);
}


# ------------------------------------------------------------------------------
# Shift data or mask into correct byte lanes
# and split into High and Low words
#
#  Assumes 64 bit data representation
# ------------------------------------------------------------------------------
sub ShiftData {

  my $value     = shift;
  my $numLanes  = shift;
  my $offset    = shift;

  my $wordH;
  my $wordL;

  # mask and data are zero outside the specified transfer
  my $fullWidth = '0000000000000000';

  # align the address offset with the length of the data
  $offset &= (0x100 - $numLanes); # Note 0x100 will cope up to HSIZE =1024 bits

  # Shift the mask or data to the correct byte lanes
  substr $fullWidth, ($maxBytesBus-$offset-$numLanes) << 1, $numLanes << 1, $value;

  # Split the data into high and low words
  $wordH = substr $fullWidth, 0, $maxBytesBus;
  $wordL = substr $fullWidth, $maxBytesBus, $maxBytesBus;

  return ($wordH, $wordL);
}


# ------------------------------------------------------------------------------
# Check for burst exceeding 1kB boundary
#
# Arguments: HSIZE, HBURST, HADDR, number of transfer to check
# ------------------------------------------------------------------------------
sub Check1kBdy {

  my $transSize = TransSize(shift);
  my $currBurst = shift;
  my $startAddr = hex(shift);
  my $numTransfers = shift;


  # test only non-wrapping bursts
  if  (
        (
          $currBurst eq '000' ||
          $currBurst eq '001' ||
          $currBurst eq '011' ||
          $currBurst eq '101' ||
          $currBurst eq '111'
        )
    # Check that last transfer in burst is within the same 1k partition
    and (
          ( ($numTransfers * $transSize + $startAddr) & hex('FFFFFC00') )
           != ($startAddr & hex('FFFFFC00'))
        )
      ) {
        printf "Line %4d: ERROR 88: Burst would exceed".
               " 1kB boundary : R\n", $lineNum;
        $fileErrors++;
  }
}


# ------------------------------------------------------------------------------
# Convert size field to Number of transfers
#
# ------------------------------------------------------------------------------
sub TransSize {

  my $sizeField = shift;
  my $transSize = 1;

  # assign TransSize
  if    ($sizeField eq '000') {$transSize = 1;}
  elsif ($sizeField eq '001') {$transSize = 2;}
  elsif ($sizeField eq '010') {$transSize = 4;}
  elsif ($sizeField eq '011') {$transSize = 8;}

  return $transSize;
}


# ------------------------------------------------------------------------------
# Check Bstrb and Unalign field integrity
#   Checks there are no discrepancies in values specified by Bstrb and Unalign
#   fields. Also generates correct value of Bstrb where necessary.
#   Returns updated Unalign and Bstrb fields.
#   The parameter $seqAddress only need be passed if $endOfUnaligned == 1
#
# Note! this function must be called before $transCount is updated
# ------------------------------------------------------------------------------
sub CheckUnalignBstrb {

  my $unalign         = shift;
  my $bstrb           = shift;
  my $address         = shift;
  my $size            = shift;
  my $endOfUnaligned  = shift;
  my $seqAddress      = shift;
  my $idleTransfer    = shift;  # if true, suppresses error checks


  my $offset;
  my $offsetAligned;
  my $seqOffset;

  my $numLanesTrans;
  my $numLanesUnalign;

  my $bstrbAligned;
  my $bstrbDefault;
  my $bstrbCore;

  my $unalignImplied;
  my $writeBstrb;


  # Calculate the number of byte lanes in the transfer
  $numLanesTrans = HsizeToBytes($size);

  # Calculate the lower order address bits of an equivalent aligned transfer
  $offsetAligned =
    $address &
    (($maxBytesBus - 1) << (FromBin8($size))) &
    ($maxBytesBus - 1);

  # Calculate aligned, little-endian Bstrb which is the default in the FileReadCore
  $bstrbCore = CalcBstrb($offsetAligned, $numLanesTrans); # Bstrb in FileRdCore

  # Modify the offset according to the endianness of the transfer, and
  # must again align the address offset with the size of the transfer
  $offsetAligned = MakeOffsetBigEndian( $offsetAligned ) if ($endian eq 'big');
  $offsetAligned &=  (($maxBytesBus - 1) << (FromBin8($size))) &
                      ($maxBytesBus - 1);

  # Calculate Bstrb based on the aligned address
  $bstrbAligned = CalcBstrb($offsetAligned, $numLanesTrans); # aligned version of Bstrb

  # Shift specified Bstrb into the correct byte lanes lanes
  if ($bstrb ne '') {
    $bstrb = ShiftBstrb($bstrb, $offsetAligned);
  }

  # The following section of code checks the rules described in the
  # AHB ARMv6 File Reader Bus Master Technical Reference Manual

  # Computes default byte lane strobes based on size and address
  # of the transfer if byte lane strobes are not specified by the user


  # Calculate Bstrb for the unaligned transfer
  if ($endian eq 'big') {

    # If big-endian, default Bstrb must be aligned
    $bstrbDefault = $bstrbAligned;

  } else {

    # Only interested in lower-order address bits up to width of data bus
    $offset = $address & ($maxBytesBus - 1);

    # Modify the offset according to the endianness of the transfer, and
    # must again align the address offset with the size of the transfer
    $offset = MakeOffsetBigEndian( $offset ) if ($endian eq 'big');

    # Calculate the number of byte lanes in the transfer for unaligned transfer
    $numLanesUnalign = $numLanesTrans - ($offset & ($numLanesTrans - 1));

    # Special case of Bstrb value generated at the end of an unaligned burst
    if ($endOfUnaligned == 1) {

      # Address offset of original transfer in unaligned burst
      $seqOffset = hex($seqAddress) & ($maxBytesBus - 1);

      # Calculate the number of byte lanes left over because of unaligned transfer
      $numLanesUnalign = $seqOffset & ($numLanesUnalign - 1);
    }

    # If little,endian, Bstrb may be unaligned
    $bstrbDefault = CalcBstrb($offset, $numLanesUnalign); # default Bstrb for the transfer
  }

  if ($bstrb ne '') {
    # If Bstrb is specified, check that the specified Bstrb value is legal
    CheckBstrbFrame($bstrb, $bstrbDefault)
      if (not $idleTransfer);

    # Checks if the specified Bstrb value implies an unaligned transfer
    $unalignImplied = UnalignImplied($bstrb, $bstrbAligned);

    # Bstrb may imply Unalign
    if ($unalign eq '' ) {
        $unalign = $unalignImplied;
    } else {
      # Verify any specified Unalign field
      CheckUnalign($unalign, $unalignImplied)
        if (not $idleTransfer);
    }

  }  else {
    # If Bstrb is not specified, use default
    $bstrb = $bstrbDefault;

    # Checks if the default Bstrb value implies an unaligned transfer
    $unalignImplied = UnalignImplied($bstrbDefault, $bstrbAligned);

    # In this case, Unalign may not be implied
    if ($unalign eq '' ) {
        $unalign = '0';
    } else {
      # Verify any specified Unalign field
      CheckUnalign($unalign, $unalignImplied)
        if (not $idleTransfer);
    }
  }

  # Not allowed to have a sparse/unaligned transfer in big-endian mode
  if ($endian eq 'big' and not $idleTransfer and $unalign eq '1') {
    printf "Line %4d: ERROR 103: Transfer cannot be unaligned or sparse".
           " in big-endian mode\n", $lineNum;
    $fileErrors++;
  }

  # If Bstrb is not equal to the default in the FileRdCore, it must be encoded in the file
  $writeBstrb = ($bstrb == $bstrbCore) ? 0 : 1;

  if ($writeBstrb eq '1') {
    # Convert to 8-digit hex string for output to data file
    $bstrb = ToHex32($bstrb)
  }

  return ($unalign, $bstrb, $writeBstrb);
}


# ------------------------------------------------------------------------------
# Shift Bstrb into correct byte lanes
#
# Assumes 64 bit data representation
# Input Bstrb is a string of 1 or 0
# Output Bstrb is numeric
# ------------------------------------------------------------------------------
sub ShiftBstrb {

  my $bstrb     = shift;
  my $offset    = shift;

  my $numLanes  = length($bstrb);

  # mask and data are zero outside the specified transfer
  my $fullBstrb = '00000000';

  # align the address offset with the length of Bstrb
  $offset &= (0x100 - $numLanes); # Note 0x100 will cope up to HSIZE =1024 bits

  # Shift Bstrb value to the correct byte lanes
  substr $fullBstrb, ($maxBytesBus-$offset-$numLanes), $numLanes, $bstrb;

  # Convert to numeric
  return (FromBin8($fullBstrb));
}


# ------------------------------------------------------------------------------
# Calculate Bstrb
#
# Arguments: address offset, number of byte lanes in the transfer
# Output Bstrb is numeric
# ------------------------------------------------------------------------------
sub CalcBstrb {

  my $offset = shift;
  my $numLanesTrans = shift;

  my $bstrb;

  # (1 << $numLanesTrans) - 1) is the correct number of strobes for the transfer,
  # but shifted into the low order end of the data bus. The final shift left
  # by $offset shifts this value into the correct address lanes.
  $bstrb = ((1 << $numLanesTrans) - 1) << $offset;

  return $bstrb;
}

# ------------------------------------------------------------------------------
# Convert the address offset to big-endian
#
# Copes with address offsets up to 0xFF
# Note! returned offset will need aligning with the data width
# ------------------------------------------------------------------------------
sub MakeOffsetBigEndian {

  my $offset = shift;

  # Endianness boundary is the number of bytes within each endianness group
  #   for little endian, value is 1 (i.e. no effect)
  #   for ARM (legacy) big-endian, value is always 4 (BE-32: 32-bits)
  #   for true big-endian, value is equal to the databus width in bytes
  my $endBdy = 4;

  # Modify the offset according to the endianness of the transfer,
  # taking into account endianness granularity $endBdy:
  $offset = ( $offset & (0x100 - $endBdy) )                 # preserve high bits
          | ( ($endBdy - 1) - ($offset & ($endBdy - 1)) );  # reverse low bits

  return $offset;
}

# ------------------------------------------------------------------------------
# Checks user-entered Bstrb is within allowed frame
#
# ------------------------------------------------------------------------------
sub CheckBstrbFrame {

  my $bstrb         = shift;
  my $bstrbDefault  = shift;

  # Check that the byte lane strobes are valid,
  # i.e zero outside the size/address frame
  if (($bstrb & (((1 << $maxBytesBus) - 1) ^ $bstrbDefault)) != 0) {
    printf "Line %4d: ERROR 102: Byte lane strobes are asserted".
           " outside the transfer address size frame\n", $lineNum;

    # Un-comment for Debug:
    #  my $bstrbDefBin = ToBin8($bstrbDefault);
    #  my $bstrbActBin = ToBin8($bstrb);
    #  print "  Bstrb default = $bstrbDefBin\n".
    #        "  Bstrb actual  = $bstrbActBin\n";

    $fileErrors++;
  }

}


# ------------------------------------------------------------------------------
# Calculate if Bstrb implies Unaligned transfer
#
# If the user has specified a byte lane strobe value, it implies
# an unaligned or aligned transfer. The implied transfer value is obtained
# by comparing the user defined value with the value that will be
# calculated for an aligned transfer by the file reader.
#
# ------------------------------------------------------------------------------
sub UnalignImplied {

  my $bstrb         = shift;
  my $bstrbAligned  = shift;

  my $unalignImp    = '0';


  # Generate the implied Unalign value
  if ($bstrb eq '' or $bstrb == $bstrbAligned) {
    $unalignImp = '0';

  } else {
    $unalignImp = '1';
  }

  return $unalignImp;
}

# ------------------------------------------------------------------------------
# Check if the entered UNALIGN values is legal
#
# Compare the user defined value with the implied aligned value
#
# An error condition arises if the user's Unalign input is set to align (0)
# and the calculated value is set to Unalign (1).
#
# ------------------------------------------------------------------------------
sub CheckUnalign {

  my $unalign       = shift;
  my $unalignImp    = shift;


  if (($unalign eq '0') & ($unalignImp eq '1')) {

    printf "Line %4d: ERROR 101: Transfer is specified as aligned but".
           " Bstrb field implies unaligned\n", $lineNum;
    $fileErrors++;
  }

}


# ------------------------------------------------------------------------------
# Check that Exclusive access is aligned
#
# ------------------------------------------------------------------------------
sub CheckProtUnalign {

  my $prot    = shift;
  my $unalign = shift;

  # Only applies to v6 stimuli
  if  ( ($arch eq 'v6') and
        ($unalign eq '1') and
        (substr($prot, 0, 1) eq '1')
      ) {
    printf "Line %4d: ERROR 107: Exclusive access cannot be".
           " unaligned\n", $lineNum;
    $fileErrors++;
  }
}


# ------------------------------------------------------------------------------
# Address Alignment Checks
#
# ------------------------------------------------------------------------------
sub CheckAddrAlign {

  my $size = shift;
  my $addr = shift;
  my $unalign = shift;

  my $addrSizeErr;

  # Check if there is an Address/Size mismatch
  #   Tests if address == address & (0xffffffff << 'HSIZE');
  if  ( $addr and (
        ( ($size eq '011') && ($addr !~ /([0-9A-Fa-f]{7})[0|8]/i) ) or
        ( ($size eq '010') && ($addr !~ /([0-9A-Fa-f]{7})[0|4|8|C]/i) ) or
        ( ($size eq '001') && ($addr !~ /([0-9A-Fa-f]{7})[0|2|4|6|8|A|C|E|]/i) )
      ) ) {

    $addrSizeErr = 1;

    if ( $arch eq 'v6' and $unalign eq '1' ) {
      # set pending addr/size mismatch error flag
      SetMismatch();

    } else {
      # report error
      ResetMismatch();
      $fileErrors++;
      AddrSizeErrorRpt($size);
    }

  } else {
    $addrSizeErr = 0;

  }

  return $addrSizeErr
}


# ------------------------------------------------------------------------------
# Report address / size mismatch error
#
# ------------------------------------------------------------------------------
sub AddrSizeErrorRpt {

  my $size = shift;

  # check address alignment
  if ($size eq '011')  {
    printf "Line %4d: ERROR 64: Address is not".
           " dword aligned\n", $lineNum;
    $fileErrors++;

  } elsif ($size eq '010') {
    printf "Line %4d: ERROR 64: Address is not".
           " word aligned\n", $lineNum;
    $fileErrors++;

  } elsif ($size eq '001') {
    printf "Line %4d: ERROR 64: Address is not".
           " halfword aligned\n", $lineNum;
    $fileErrors++;

  } else {
    printf "Line %4d: ERROR 64: Address is not aligned with size".
           " of transfer\n", $lineNum;
    $fileErrors++;
  }
}



# ------------------------------------------------------------------------------
# Check for early burst termination
#
# Assumes a new burst is starting
# Arguments: Number of transfers remaining
#
# ------------------------------------------------------------------------------
sub CheckBurstTerm {

  my $count = shift;

  # If there are remaining transfers and burst is not expected to be cancelled
  if ( ($verbose == 1) and ($count > 0) and $sequence{'RESP'} ne '10') {

    printf "Line %4d: WARNING 216: Burst terminated early by".
           " insufficient Sequence commands\n", $lineNum;
    $fileWarnings++;
  }

  # if pending addr/size mismatch error
  if (GetMismatch() == 1 and $arch eq 'v6')
  {
    ResetMismatch();
    if ($verbose == 1) {
      printf "Line %4d: WARNING 236: Unaligned transfer crossing address".
             " size boundary.\n", $sequence{'LINE'};
      $fileWarnings++;
    }
  }

}


# ------------------------------------------------------------------------------
# Set burst counters for the remaining number of transfers in a burst
#
# ------------------------------------------------------------------------------
sub SetBurstCount  {

  my $currBurst = shift;
  my $mismatch  = shift;

  my $transCount;
  my $incrCount;

  # Set the bust counters according to the burst type
  if    ($currBurst eq '000') {$transCount = 0;  $incrCount = 0;}  # single
  elsif ($currBurst eq '001') {$transCount = 0;  $incrCount = 1;}  # incr
  elsif ($currBurst eq '010') {$transCount = 3;  $incrCount = 0;}  # wrap4
  elsif ($currBurst eq '011') {$transCount = 3;  $incrCount = 0;}  # incr4
  elsif ($currBurst eq '100') {$transCount = 7;  $incrCount = 0;}  # wrap8
  elsif ($currBurst eq '101') {$transCount = 7;  $incrCount = 0;}  # incr8
  elsif ($currBurst eq '110') {$transCount = 15; $incrCount = 0;}  # wrap16
  elsif ($currBurst eq '111') {$transCount = 15; $incrCount = 0;}  # incr16
  else                        {$transCount = 0;  $incrCount = 1;}  # incr

  # If a defined-length unaligned burst (i.e. not INCR) is taking place,
  # there will be an extra transfer
  if (GetMismatch() == 1 and $currBurst ne '001') {
    $transCount++;
  }

  SetTransCount($transCount);
  SetIncrCount($incrCount);

  return ($transCount, $incrCount);
}


# ------------------------------------------------------------------------------
# Reset burst counters and check for early burst termination
#
# ------------------------------------------------------------------------------
sub ResetBurstCount
{
  # Check that previous burst was not terminated early
  CheckBurstTerm(GetTransCount());

  # Reset the bust counters to zero
  SetTransCount(0);
  SetIncrCount(0);
}

# Set the transCount counter
sub SetTransCount
{
  $transCount = shift;
}

# Decrement the transCount counter
sub DecTransCount
{
  # Only valid to decrement the counter if a burst is in progress
  if ($transCount > 0) {
    $transCount--;
  }
}


# Get the value of the transCount counter
sub GetTransCount
{
  return $transCount;
}

# Increment the incrCount counter
sub IncIncrCount
{
  # Only valid to increment the counter if a burst is in progress
  if ($incrCount > 0) {
    $incrCount++;
  }
}

# Set the Incr counter
sub SetIncrCount
{
  $incrCount = shift;
}


# Get the value of the incrCount counter
sub GetIncrCount
{
  return $incrCount;
}


# ------------------------------------------------------------------------------
# Subroutines to set and reset global flag mismatch
#
# ------------------------------------------------------------------------------
sub SetMismatch
{
  $mismatch = 1;
}

sub ResetMismatch
{
  $mismatch = 0;
}

sub GetMismatch
{
  return $mismatch;
}


# ------------------------------------------------------------------------------
# Calculate memory size required for FileReader
#   Adds up the total number of 32-bit words required to hold the stimulus
#    output
#
# ------------------------------------------------------------------------------
sub CalcMemory {

my $cmd = shift;

  if ($cmd eq 'W') {
    $memorySize += 4;                             # Write

  } elsif ($cmd eq 'R') {
    $memorySize += 6;                             # Read

  } elsif ($cmd eq 'S') {
    $memorySize += 5;                             # Seq

  } elsif ($cmd eq 'B') {
    $memorySize += 1;                             # Busy

  } elsif ($cmd eq 'I') {
    $memorySize += 2;                             # Idle

  } elsif ($cmd eq 'P') {
    $memorySize += 7;                             # Poll

  } elsif ($cmd eq 'L') {
    $memorySize += 2;                             # Loop

  } elsif ($cmd eq 'C') {
    $memorySize += 2 + $command{'COUNT'};         # Comment

  } elsif ($cmd eq 'Q') {
    $memorySize += 1;                             # Quit

  } else {
    # Error - invalid command found - should not happen
    warn "WARNING 255: Invalid Command $currCmd for calculating Memory Size".
         " at stimulus line $lineNum\n";
  }

  if ($command{'WRITEBS'} eq '1' )
  {
    $memorySize ++;
  }
}


# ------------------------------------------------------------------------------
# Converts 3-bit binary string representation of Hsize value to number of bytes
#
# ------------------------------------------------------------------------------
sub HsizeToBytes {
  return 1 << unpack("C", pack("B8","00000". shift));
}


# ------------------------------------------------------------------------------
# Converts number of bytes to binary string representation of Hsize
#
# ------------------------------------------------------------------------------
sub BytesToHsize {

  my $transferWidth = shift;
  my $size = '';

  if    ($transferWidth == 1) {$size = '000'}
  elsif ($transferWidth == 2) {$size = '001'}
  elsif ($transferWidth == 4) {$size = '010'}
  elsif ($transferWidth == 8) {$size = '011'}
  else {
    # Transfer wider than 64 bits not supported - should not happen
    warn "WARNING 254: Unsupported transfer width of $transferWidth bytes".
         " at stimulus line $lineNum\n";
  }

  return $size;
}


# ------------------------------------------------------------------------------
# Converts an n-bit binary string to hex with n/4 digits
# Note: Only works for whole bytes.
#
# ------------------------------------------------------------------------------
sub BinToHex {
  unpack('H*', pack('B*', shift));
}

# ------------------------------------------------------------------------------
# Converts an numeric value to 8 hex digits
#
# ------------------------------------------------------------------------------
sub ToHex32 {
  sprintf("%08X", shift);
}

# ------------------------------------------------------------------------------
# Converts up to 8 bits binary to a number
# Note: Wraps at 256
#
# ------------------------------------------------------------------------------
sub FromBin8 {
    unpack('C', pack('B8',substr('0' x 8 . shift, -8)));
}


# ------------------------------------------------------------------------------
# Converts a number to an 8-bit binary string
# Note: Wraps at 256
#
# ------------------------------------------------------------------------------
sub ToBin8 {
  return unpack( "B8",  pack ('C', shift));
}


# ------------------------------------------------------------------------------
# Output format definitions
#
# ------------------------------------------------------------------------------


format WRITECMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'ADDR'}
@<<<<<<<
$command{'DATAH'}
@<<<<<<<
$command{'DATAL'}
@<<<<<<<
$command{'BSTRBHEX'} if ($command{'WRITEBS'} eq '1')
.


format READCMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'ADDR'}
@<<<<<<<
$command{'DATAH'}
@<<<<<<<
$command{'DATAL'}
@<<<<<<<
$command{'MASKH'}
@<<<<<<<
$command{'MASKL'}
@<<<<<<<
$command{'BSTRBHEX'} if ($command{'WRITEBS'} eq '1')
.


format SEQCMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'DATAH'}
@<<<<<<<
$command{'DATAL'}
@<<<<<<<
$command{'MASKH'}
@<<<<<<<
$command{'MASKL'}
@<<<<<<<
$command{'BSTRBHEX'} if ($command{'WRITEBS'} eq '1')
.


format BUSYCMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'BSTRBHEX'} if ($command{'WRITEBS'} eq '1')
.


format IDLECMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'ADDR'}
@<<<<<<<
$command{'BSTRBHEX'} if ($command{'WRITEBS'} eq '1')
.


format POLLCMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'TOUT'}
@<<<<<<<
$command{'ADDR'}
@<<<<<<<
$command{'DATAH'}
@<<<<<<<
$command{'DATAL'}
@<<<<<<<
$command{'MASKH'}
@<<<<<<<
$command{'MASKL'}
@<<<<<<<
$command{'BSTRBHEX'} if ($command{'WRITEBS'} eq '1')
.


format LOOPCMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'NUM'}
.


format COMMCMD =
@<<<<<<<
$command{'FUNCTION'}
@<<<<<<<
$command{'NUM'}
@<<<<<<<
$command{'WORD1'}
@<<<<<<<
$command{'WORD2'}   if ($command{'COUNT'} > 1)
@<<<<<<<
$command{'WORD3'}   if ($command{'COUNT'} > 2)
@<<<<<<<
$command{'WORD4'}   if ($command{'COUNT'} > 3)
@<<<<<<<
$command{'WORD5'}   if ($command{'COUNT'} > 4)
@<<<<<<<
$command{'WORD6'}   if ($command{'COUNT'} > 5)
@<<<<<<<
$command{'WORD7'}   if ($command{'COUNT'} > 6)
@<<<<<<<
$command{'WORD8'}   if ($command{'COUNT'} > 7)
@<<<<<<<
$command{'WORD9'}   if ($command{'COUNT'} > 8)
@<<<<<<<
$command{'WORD10'}  if ($command{'COUNT'} > 9)
@<<<<<<<
$command{'WORD11'}  if ($command{'COUNT'} > 10)
@<<<<<<<
$command{'WORD12'}  if ($command{'COUNT'} > 11)
@<<<<<<<
$command{'WORD13'}  if ($command{'COUNT'} > 12)
@<<<<<<<
$command{'WORD14'}  if ($command{'COUNT'} > 13)
@<<<<<<<
$command{'WORD15'}  if ($command{'COUNT'} > 14)
@<<<<<<<
$command{'WORD16'}  if ($command{'COUNT'} > 15)
@<<<<<<<
$command{'WORD17'}  if ($command{'COUNT'} > 16)
@<<<<<<<
$command{'WORD18'}  if ($command{'COUNT'} > 17)
@<<<<<<<
$command{'WORD19'}  if ($command{'COUNT'} > 18)
@<<<<<<<
$command{'WORD20'}  if ($command{'COUNT'} > 19)
.


format QUITCMD =
@<<<<<<<
$command{'FUNCTION'}
.

__END__
