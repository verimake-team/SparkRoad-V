# ------------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited.
#
#   (C) COPYRIGHT 2006-2013 ARM Limited.
#       ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited.
#
# ------------------------------------------------------------------------------
# Version and Release Control Information:
#
#      File Name           : $RCSfile: xmlparser.pm,v $
#
#      SVN Information
#
#      Checked In          : $Date: 2011-02-21 17:53:53 +0000 (Mon, 21 Feb 2011) $
#
#      Revision            : $Revision: 162121 $
#
#      Release Information : Cortex-M System Design Kit-r1p0-01rel0
#
# ------------------------------------------------------------------------------
# Purpose        : Parse XML file input and produce equivalent structure
#                   hash array, which can be accessed via public methods.
#
# Requirements   : Perl version 5.005 or later for thread safety
#
# Limitations    : See the POD after the __END__ marker in this file. Try:
#
#                    pod2text xmlparser.pm | more
#
# ------------------------------------------------------------------------------

eval "exec perl -w -S $0 $@" # -*- Perl -*-
  if ($running_under_some_sh);
  undef ($running_under_some_sh);

# Declare module name
package xmlparser;

# Declare import modules and libraries
require Exporter;
use strict;
use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK %XmlNodeTree %XmlNodeTotals );

# Declare public and private entities
@ISA     = qw( Exporter );

@EXPORT  = qw( ConfigureXmlParser
               RunXmlParser
               ListXmlHash
               ChangeRelativePath
               GetXmlNodeList
               GetXmlValue
               GetXmlName
               %XmlNodeTotals
               %XmlNodeTree );

@EXPORT_OK = qw( %XmlNodeTree );

$VERSION = 1.00;

# Dummy 'lock' routine for non-threaded versions of Perl
BEGIN {
  if ( $] < 5.005 ) { eval "sub lock {}"; }
}

# ------------------------------------------------------------------------------

# Script variables
my $DebugMode      = 0;
my $RecursionDepth = 0;
my $RecursionLimit = 25;
my $ShowIds        = 0;
my $ShowWarnings   = 1;
my $Verbose        = 1;
my $Warnings       = 0;

# Relative access path, serviced by ChangeRelativePath() function
my $RelativePath = '';

# Node stack
my @PathStack = ( 'ROOT' );
my $PathLevel = 0;

# Exportable global data structure and node counters (note that values and
#  attributes will be added dynamically when the XML file is parsed)
%XmlNodeTree = ( ROOT => { ITEMS => {ELEMENTS => [], ATTRIBUTES => []} } );
%XmlNodeTotals = ( TOTAL => 0, ELEMENTS => 0, ATTRIBUTES => 0 );


# ------------------------------------------------------------------------------
#   PUBLIC: RunXmlParser - Extracts the multi-line value and fields
# ------------------------------------------------------------------------------
sub RunXmlParser {

  # Passed parameter 1 is the XML filename
  my $XmlFilename = shift;

  # Local variable(s)
  my $TextLine         = '';
  my $LineCount        = 0;
  my $LeadingSpace     = 0;
  my $Delimeter        = '';
  my $Before           = '';
  my $After            = '';
  my $Field            = '';
  my $Residue          = '';
  my $InContainer      = 0;
  my $GotHeader        = 0;
  my $HeaderMisaligned = 0;
  my $ContainerType    = '';
  my $Element          = '';
  my $EmptyElement     = 0;
  my $InstanceId       = 1;
  my $Increment        = 1;
  my $CurrentPath      = 'ROOT';
  my $ParentPath       = 'ROOT';
  my $AttributeCount   = 0;
  my $ParseEnable      = 1;
  my ($JustFilename)   = $XmlFilename =~ /([^\/]+)$/;

  # Open the input file
  open (INPUT_FILE, "<$XmlFilename") or
    ReportError('Cannot open the specified file for reading');

  print "Parsing the '$JustFilename' file...\n" if ( $Verbose );

  # Process each line of the file
  while ( $TextLine = <INPUT_FILE> ) {

    # Increment line count
    $LineCount++;

    # Parse the line(s), when enabled
    while ( $ParseEnable ) {

      # Remove single line comments, leading or end-of-line whitespace,
      #  carriage returns, newlines and tab characters. Leading whitespace
      #  is tracked for checking the <?xml ...?> processing instruction
      $TextLine =~ s/<!--.*-->//g;
      $LeadingSpace = ( $TextLine =~ s/^\s+// ) ? 1 : 0;
      $TextLine =~ s/\s*(\r|\n|\t)$//g;

      # Only process lines that are not blank
      unless ( $TextLine eq '' ) {

        # Display line when in debug mode
        if ( $DebugMode ) { printf "Line %-03d: '$TextLine'\n", $LineCount; }

        # Reconstruct fields of text (from multiple lines), which are delimited
        #  by the reserved characters '<' and '>'. Store the extracted tokens
        #  in the same order as they are processed. A path stack is used to
        #  determine the name of the current container. All nodes found within
        #  the scope of the current container are stored in a keyed list (the
        #  node structure hash array)
        if ( ($Delimeter) = $TextLine =~ /([<>])/ ) {

          # Store the patterns before and after the delimeter
          $Before = $`;
          $After = $';

          # Determine appropriate action for the '<' delimeter
          if ( $Delimeter eq '<' ) {

            # Terminate reconstruction of a value field?
            if ( ! $InContainer ) {

              # Terminate the reconstructed value by concatenating the string
              #  preceding the '<' delimeter and extracting any residual text
              $Field = $Field . $Before;

              unless ( $Field eq '' ) {
                # Display the value when in debug mode
                if ( $DebugMode ) { print "Value of '$Element' = '$Field'\n"; }

                # Check and store the extracted value
                CheckValue($Field, $LineCount);
                $XmlNodeTree{$CurrentPath}{VALUE} = $Field;

                # Clear the field ready for a new reconstruction
                $Field = '';
              }

              # Change to the 'in-container' state
              $InContainer = 1;
            }

            # Initiate reconstruction of a container field?
            if ( $InContainer ) {

              # Initiate reconstruction of a new container by storing it and
              #  testing for the closing delimeter. If found, then trim the
              #  field accordingly and extract any residual text, else pad
              #  the field to support multi-line reconstruction
              $Field = $After;
              if ( $Field =~ s/>(.*)$// ) {
                $After = $1;
                $Before = '';
                $Delimeter = '>';
              } else {
                $Field = $Field . ' ';
              }

              # If '<?xml' is found then check the alignment of the field
              unless ( $GotHeader ) {
                if ( $TextLine =~ /<\?xml/ ) {
                  $HeaderMisaligned = ($LineCount > 1 or $LeadingSpace);
                }
              }

            }
          }

          # Determine appropriate action for the '>' delimeter
          if ( $Delimeter eq '>' ) {

            # Determine action for this delimeter
            if ( ! $InContainer ) {

              # Initiate reconstruction of a new value by storing it and
              #  testing for the opening delimeter. If found, then trim the
              #  field accordingly and extract any residual text
              $Field = $After;
              if ( $Field =~ s/<(.*)$// ) { $Residue = '<' . $1; }

            } else {

              # Terminate the reconstructed container by concatenating the
              #  remaining portion and smartly formatting the field to simplify
              #  pattern-matching. Selectively extract and residual text
              $Field = TidyXmlContainer($Field . $Before, $LineCount);
              $Residue = ( $After ne '' ) ? '>' . $After : '';

              # Display the container name when in debug mode
              if ( $DebugMode ) { print "Container: '$Field'\n"; }

              # Ignore blank fields when produced by the removal of
              #  multi-line comments
              unless ( $Field eq '' ) {

                # Check the 'wellformedness' of the reconstructed container
                CheckWellformedXml($Field, $LineCount);

                # Re-initialise the node reference increment
                $Increment = 1;

                # Determine container type from beginning of the field, and
                #  apply appropriate syntax checks
                $ContainerType = substr($Field, 0, 1);
                if ( $ContainerType eq '?' ) {

                  # Check processing instructions
                  if ( $Field =~ /^\?xml/ ) {
                    unless ( $GotHeader ) {
                      CheckXmlHeader($Field, $HeaderMisaligned);
                      $GotHeader = 1;
                    }
                  } else {
                    # Anything else is not supported
                    ReportError("Unsupported XML processing instruction starting on line $LineCount");
                  }

                } elsif ( $ContainerType eq '!' ) {

                  # Check declarations
                  CheckDeclaration($Field, $LineCount);

                } elsif ( $ContainerType =~ /[a-z_.\-\/]/i ) {

                  # Check elements
                  CheckElement($Field, $LineCount);

                  # Determine element sub-type
                  if ( $ContainerType ne '/' ) {

                    # Extract and remove the element name
                    $Field =~ s/([a-z0-9_:\.\-]+)\s?//i;
                    $Element = $1;

                    # Check if this is an empty element
                    $EmptyElement = ( $Field =~ /\/$/ ) ? 1 : 0;

                    # Determine the parent path and then post-increment the path stack pointer
                    $ParentPath = DetermineStructPath($PathLevel++);

                    # For this new element, determine its unique current path. If the key is
                    #  unique, then initialise the item lists in the current node record
                    $InstanceId = 1;
                    while ( 1 ) {
                      $PathStack[$PathLevel] = sprintf("%s[%d]", $Element, $InstanceId++);
                      $CurrentPath = DetermineStructPath($PathLevel);
                      unless ( exists($XmlNodeTree{$CurrentPath}) ) {
                        $XmlNodeTree{$CurrentPath}{ITEMS}{ELEMENTS} = [];
                        $XmlNodeTree{$CurrentPath}{ITEMS}{ATTRIBUTES} = [];
                        last;
                      }
                    }

                    # Display element name and path information when in debug mode
                    if ( $DebugMode ) {
                      printf "Element (%s): '%s'\nPUSH: Appending path: '%s', Parent path: '%s'\n",
                        $EmptyElement ? 'empty' : 'open', $PathStack[$PathLevel], $CurrentPath, $ParentPath;
                    }

                    # Update the item list of the parent node record
                    push ( @{ $XmlNodeTree{$ParentPath}{ITEMS}{ELEMENTS} }, $PathStack[$PathLevel] );

                    # Extract attributes and add the count to the node total
                    $AttributeCount = ExtractAttributes($Field, $CurrentPath);
                    $XmlNodeTotals{ATTRIBUTES} += $AttributeCount;

                    # Display number of extracted attributes when in debug mode
                    if ( $DebugMode ) {
                      unless ( $AttributeCount == 0 ) {
                        print "Extracted $AttributeCount attribute(s) from element '$PathStack[$PathLevel]'\n";
                      }
                    }

                    # Selectively decrement the path stack pointer and determine paths
                    if ( $EmptyElement ) {
                      $CurrentPath = DetermineStructPath(--$PathLevel);
                      $ParentPath = DetermineStructPath($PathLevel - 1);

                      # Display current and parent paths when in debug mode
                      if ( $DebugMode ) {
                        print "POP: Current path: '$CurrentPath', Parent path: '$ParentPath'\n";
                      }
                    }

                  } else {

                    # Decrement the node stack pointer and determine the paths
                    $CurrentPath = DetermineStructPath(--$PathLevel);
                    $ParentPath  = DetermineStructPath($PathLevel - 1);

                    # Display paths when in debug mode
                    if ( $DebugMode ) {
                      print "POP: Current path: '$CurrentPath', Parent path: '$ParentPath'\n";
                    }

                    # Disable the node reference increment for closed elements
                    $Increment = 0;

                  }

                } else {
                  # Any other type of field is not supported
                  ReportError("Unrecognised or illegal XML field starting on line $LineCount");
                }

                # Increment the node counts
                $XmlNodeTotals{ELEMENTS} += $Increment;
                $XmlNodeTotals{TOTAL}++;

                # Clear the field ready for a new reconstruction and change to
                #  the 'in-value' state
                $Field = '';
                $InContainer = 0;
              }

            }
          }

        } else {
          # Continue to build the field from multiple lines
          $Field = $Field . $TextLine;
        }

      }

      # If a second pass is required to process any residual text from the
      #  first attempt then remain in this loop, else exit the parsing loop
      if ( $Residue ne '' ) {
        # Display residual text when in debug mode
        if ( $DebugMode ) { print "Residue: '$Residue'\n"; }
        $TextLine = $Residue;
        $Residue  = '';
      } else {
        $ParseEnable = 0;
      }
    }

    # Re-enable parsing for a fresh line of text
    $ParseEnable = 1;
  }

  # Check that the root node is properly terminated upon the EOF
  if ( $PathLevel != 0 ) {
    ReportError('Unexpected end-of-file due to a syntax error');
  }

  # Close the XML file
  close (INPUT_FILE);

  # Display node totals when in verbose mode
  if ( $Verbose ) {
    printf "Processed %d line(s) with %d warning(s) - extracted %d XML node(s) [%d, @%d]...\n",
      $LineCount, $Warnings, $XmlNodeTotals{TOTAL},
      $XmlNodeTotals{ELEMENTS}, $XmlNodeTotals{ATTRIBUTES};
  }
}


# ------------------------------------------------------------------------------
#   TidyXmlContainer - Apply intelligent text formatting to the container
# ------------------------------------------------------------------------------
sub TidyXmlContainer {

  # Passed parameter 1 is the container
  my $Container = shift;
  # Passed parameter 2 is the line number
  my $LineNumber = shift;

  # Local variable(s)
  my $Field = '';
  my $Quote = '';
  my $Token = '';
  my $InQuotes = 0;

  # Check for illegal empty container
  if ( $Container eq '' ) {
    ReportError("Empty XML field starting on line $LineNumber");
  }

  # Remove multi-line comments and end-of-field or leading whitespace
  $Container =~ s/^!--.*--$//;
  $Container =~ s/^\s*//;
  $Container =~ s/\s*$//g;

  # If the container is an element with attributes, then process it with
  #  respect for embedded whitespace within quoted strings
  $Field = $Container;
  while ( ($Quote) = $Field =~ /[^=]+=\s*(['"]).*['"]/ ) {

    # Selectively clear the container string for recomposition
    if ( $InQuotes == 0 ) { $Container = ''; }

    # Extract portions of the container between matching quote characters
    #  and process whitespace on alternate iterations
    while ( $Field =~ s/([^$Quote]+)($Quote*)// ) {
      $Token = $1 . $2;
      unless ( $InQuotes % 1 ) {
        $Token =~ s/\s+/ /g;
        $Token =~ s/\s?=\s?/=/g;
      }
      $Container = $Container . $Token;
      $InQuotes++;
    }

  }

  return ($Container);
}


# ------------------------------------------------------------------------------
#   CheckWellformedXml - Check the 'wellformedness' of the container
# ------------------------------------------------------------------------------
sub CheckWellformedXml {

  # Passed parameter 1 is the container
  my $Container = shift;
  # Passed parameter 2 is the line number
  my $LineNumber = shift;

  # Local variable(s)
  my $BadProcInstr    = ( $Container =~ /^\?/ and
                          $Container !~ /\?$/ ) ? 1 : 0;
  my $BadDecl         = ( $Container =~ /^\!/ and
                          $Container =~ /[\!\?\/]$/ ) ? 1 : 0;
  my $BadOpenElement  = ( $Container =~ /^[a-z_.\-]/i and
                          $Container !~ /\/?$/ ) ? 1 : 0;
  my $BadCloseElement = ( $Container =~ /^\// and
                          $Container =~ /(=|\/$)/ ) ? 1 : 0;

  # Check and display an error if invalid
  if ( $BadProcInstr or $BadDecl or $BadOpenElement or $BadCloseElement ) {
    ReportError("XML field starting on line $LineNumber is not well-formed");
  }
}


# ------------------------------------------------------------------------------
#   CheckXmlHeader - Validate the <?xml ...?> header container
# ------------------------------------------------------------------------------
sub CheckXmlHeader {

  # Passed parameter 1 is the header
  my $Header = shift;
  # Passed parameter 2 is the alignment error flag
  my $Misaligned = shift;

  # Local variable(s)
  my $XMLVersion  = '1.0 (default)';
  my $XMLEncoding = 'iso-8859-1 (default)';
  my $XMLMode     = 'yes (default)';

  # Announce the header check
  print "Validating XML header...\n" if ( $Verbose );

  # Check the mis-alignment flag
  if ( $Misaligned ) {
    ReportError("The '?xml' declaration must start on line 1, column 1");
  }

  # Check syntax of supported attributes
  if ( ($Header !~ /^\?xml[\s\?]/) or
       ($Header !~ /((version|encoding|standalone)=("[^"]+"|'[^']+'))*/) ) {
    ReportError("Invalid '<?xml ...?>' processing instruction");
  }

  # Check version, encoding and standalone (mode) attributes
  if ( $Header =~ /version=("[^"]+"|'[^']+')/ ) {
    $XMLVersion = $1; $XMLVersion =~ s/["']//g;
    if ($XMLVersion ne '1.0') {
      ReportError('Unsupported XML version');
    }
  }
  if ( $Header =~ /encoding=("[^"]+"|'[^']+')/ ) {
    $XMLEncoding = $1; $XMLEncoding =~ s/["']//g;
    if ( $XMLEncoding !~ /^(iso\-8859\-1|UTF\-8)$/ ) {
      ReportError('Unsupported XML encoding');
    }
  }
  if ( $Header =~ /standalone=("[^"]+"|'[^']+')/ ) {
    $XMLMode = $1; $XMLMode =~ s/["']//g;
    if ( $XMLMode !~ /(yes|no)\b/ ) {
      ReportError('Unsupported standalone declaration');
    }
  }

  # Display header settings
  print "XML version '$XMLVersion', encoding '$XMLEncoding', standalone" .
        " '$XMLMode'...\n" if ( $Verbose );
}


# ------------------------------------------------------------------------------
#   CheckDeclaration - Validate the <!... > declaration container
#                      NOTE: This procedure needs further work if required
# ------------------------------------------------------------------------------
sub CheckDeclaration {

  # Passed parameter 1 is the container
  my $Container = shift;
  # Passed parameter 2 is the line number
  my $LineNumber = shift;

  # Local variable(s)
  my $DeclarationType = '';

  # Check and display an error if invalid
  if ( ($DeclarationType) = $Container !~ /^\!(DOCTYPE|ENTITY)\b/ ) {
    ReportError("Unrecognised XML declaration starting on line $LineNumber");
  }
}


# ------------------------------------------------------------------------------
#   CheckElement - Validate the element container
# ------------------------------------------------------------------------------
sub CheckElement {

  # Passed parameter 1 is the container
  my $Container = shift;
  # Passed parameter 2 is the line number
  my $LineNumber = shift;

  # Local variable(s)
  my $ElementName    = '';
  my $AttributeName  = '';
  my $AttributeValue = '';
  my $StartQuote     = '';
  my $EndQuote       = '';
  my $ForbiddenQuote = '';
  my %Names          = ();

  # Extract and remove the element name, then check it for illegal
  #  chacters
  $Container =~ s/^\/?([^\s]+)\s?//;
  $ElementName = $1;
  if ( $ElementName =~ /[^a-z0-9_:\.\-]/i ) {
    ReportError("XML element starting on line $LineNumber has an illegal name");
  }

  # If defined, check attributes of element fields. Extract, remove
  #  and test the LHS and RHS fields of '=' assignments in turn
  while ( $Container =~ s/([^=]+)=(['"])// ) {

    $AttributeName = $1; $StartQuote = $2;
    $ForbiddenQuote = ($StartQuote eq '"') ? '"' : "'";

    # Check the attribute name for illegal characters
    if ( $AttributeName =~ /[^a-z0-9_:\.\-]/i ) {
      ReportError("XML element starting on line $LineNumber has an illegal attribute name");
    }
    # Check the attribute name for duplicates and note unique ones
    if ( exists($Names{$AttributeName}) ) {
      ReportError("XML element starting on line $LineNumber has a duplicate attribute name");
    }
    $Names{$AttributeName} = ''; # Value unimportant for purpose

    # Extract and remove the attribute value, restoring the container
    #  field appropriately for the next iteration
    if ( $Container =~ s/([^=]+)// ) {
      $AttributeValue = $1;
      $AttributeValue =~ s/(['"])\s?([^'"]*)$//;
      $EndQuote = $1; $Container = $2 . $Container;

      # Check the attribute value for illegal characters
      if ( $AttributeValue =~ /[<>$ForbiddenQuote]/ or
           ($AttributeValue =~ /&/ and
            $AttributeValue !~ /&(amp|lt|gt|apos|quot|\#[0-9]{3}|\#x[A-Fa-f0-9]{2});/) ) {
        ReportError("XML element starting on line $LineNumber has an illegal attribute value");
      }
      # Check for misquoted attribute value
      unless ( $StartQuote eq $EndQuote ) {
        ReportError("XML element starting on line $LineNumber has a misquoted attribute value");
      }
    }

  }
}


# ------------------------------------------------------------------------------
#   CheckValue - Check the XML value field for illegal characters
# ------------------------------------------------------------------------------
sub CheckValue {

  # Passed parameter 1 is the value
  my $Field = shift;
  # Passed parameter 2 is the line number
  my $LineNumber = shift;

  # Local variable(s)
  my $BadLTGT      = ( $Field =~ /[<>]/ ) ? 1 : 0;
  my $BadAmpersand = ( $Field =~ /&/ and
                       $Field !~ /&(amp|lt|gt|apos|quot|\#[0-9]{3}|\#x[A-Fa-f0-9]{2});/ ) ? 1 : 0;

  # Check and display an error if invalid
  if ( $BadLTGT or $BadAmpersand ) {
    ReportError("XML value field starting on line $LineNumber contains illegal characters");
  }
}


# ------------------------------------------------------------------------------
#   ExtractAttributes - Inspect and extract the attributes from elements
# ------------------------------------------------------------------------------
sub ExtractAttributes {

  # Passed parameter 1 is the container
  my $Container = shift;
  # Passed parameter 2 is the current path
  my $Path = shift;

  # Local variable(s)
  my $Attributes = 0;
  my $AttributeName = '';
  my $AttributeValue = '';

  # If defined, check attributes of element fields. Extract, remove
  #  and test the LHS and RHS fields of '=' assignments in turn
  while ( $Container =~ s/([^=]+)=['"]// ) {
    # Store the attribute name
    $AttributeName = $1;

    # Extract and remove the attribute value, restoring the container
    #  field appropriately for the next iteration
    if ( $Container =~ s/([^=]+)// ) {
      $AttributeValue = $1;
      $AttributeValue =~ s/['"]\s?([^'"]*)$//;
      $Container = $1 . $Container;

      # Update the item list in the current node record and then save
      #  both the attribute name and its value
      push ( @{ $XmlNodeTree{$Path}{ITEMS}{ATTRIBUTES} },  $AttributeName );
      $XmlNodeTree{$Path}{ATTRIBUTES}{$AttributeName} = $AttributeValue;
      $Attributes++;
    }
  }

  return ($Attributes);
}


# ------------------------------------------------------------------------------
#   PUBLIC: ListXmlHash - List contents of the structure, using safe recursion
# ------------------------------------------------------------------------------
sub ListXmlHash {

  # Passed parameter 1 is the requested node start point
  my $NodeKey = shift;

  # Local variable(s)
  my ($NodeName) = $NodeKey =~ /([^{]+)$/;;
  my @NodeKeys   = @{ $XmlNodeTree{$NodeKey}{ITEMS}{ELEMENTS} };
  my $NodeValue  = $XmlNodeTree{$NodeKey}{VALUE};
  my $NodeItem   = '';
  my @Markup     = ('', '@');

  # Initially display the 'listing structure' message
  if ( $RecursionDepth == 0 ) { print "Listing the data structure:\n\n"; }

  # Remove the reference number from the node name
  unless ( $ShowIds ) { $NodeName = GetXmlName($NodeName); }

  # Display the element name and optional value
  if ( not defined $NodeValue ) {
    printf " %s- $NodeName\n", ' ' x ($RecursionDepth * 2);
  } else {
    printf " %s- $NodeName = '$NodeValue'\n", ' ' x ($RecursionDepth * 2);
  }

  # Selectively display attributes
  foreach $NodeItem ( @{ $XmlNodeTree{$NodeKey}{ITEMS}{ATTRIBUTES} } ) {
    printf "   %s%s$NodeItem %s= '$XmlNodeTree{$NodeKey}{ATTRIBUTES}{$NodeItem}'\n",
             ' ' x ($RecursionDepth * 2), $Markup[1 - $ShowIds], $Markup[$ShowIds];
  }

  # List content of the current node by recursion within limits
  foreach $NodeItem ( @NodeKeys ) {
    if ( ++$RecursionDepth > $RecursionLimit ) {
      ReportError("Recursion depth of $RecursionLimit exceeded");
    } else {
      # Interrogate the next level of the hierarchy
      ListXmlHash("$NodeKey}{$NodeItem");
    }
    $RecursionDepth--;
  }
}


# ------------------------------------------------------------------------------
#   DetermineStructPath - Determine the structure path key
# ------------------------------------------------------------------------------
sub DetermineStructPath {

  # Passed parameter 1 is the level
  my $RequestedLevel = shift;

  # Local variable(s)
  my $LevelPointer = 0;
  my $Result       = 'ROOT';

  # Build the path and remove the outermost pair of braces, else return
  #  the root node
  if ( $RequestedLevel > 0 ) {
    $Result = '';
    while ( $LevelPointer <= $RequestedLevel ) {
      $Result = $Result . '{' . $PathStack[$LevelPointer++] . '}';
    }
    $Result =~ s/(^{|}$)//g;
  }

  return ($Result);
}


# ------------------------------------------------------------------------------
#   'TranslateXPath' - Translates the specified XPath into the nearest match
#                       access key
# ------------------------------------------------------------------------------
sub TranslateXPath {

  # Passed parameter 1 is the specified XPath
  my $Path = shift;

  # Local variable(s)
  my @XPathTokens  = [];
  my $Token        = '';
  my $Key          = '';
  my $ResolvedPath = 'ROOT';

  if ( $Path =~ s/^\/// ) {
    # Determine the key lookup for absolute paths
    @XPathTokens = split('/', $Path);
    foreach $Token ( @XPathTokens ) {
      foreach $Key ( @{ $XmlNodeTree{$ResolvedPath}{ITEMS}{ELEMENTS} } ) {
        if ( $Key eq $Token or $Key =~ /$Token/ ) {
          $ResolvedPath = $ResolvedPath . '}{' . $Key;
          last;
        }
      }
    }
    $Path = $ResolvedPath;
  } else {
    ReportError('Unsupported or badly formed XPath');
  }

  # Display the translated access key when in debug mode
  if ( $DebugMode ) { print "Key: '$Path'\n"; }

  return ($Path);
}


# ------------------------------------------------------------------------------
#   PUBLIC: 'GetXmlName' - Returns the XML node name without uniquifier(s)
# ------------------------------------------------------------------------------
sub GetXmlName {

  # Passed parameter 1 is the specified XML node
  my $XmlNode = shift;

  $XmlNode =~ s/\[\d+\]//g;

  return ($XmlNode);
}


# ------------------------------------------------------------------------------
#   PUBLIC: 'ChangeRelativePath' - Sets and returns the relative path
# ------------------------------------------------------------------------------
sub ChangeRelativePath {

  # Passed parameter 1 is the specified path stem
  $RelativePath = shift;

  return ($RelativePath);
}


# ------------------------------------------------------------------------------
#   PUBLIC: 'GetXmlNodeList' - Return child node list for the specified parent
#                               node. Append '@' character to get attributes
# ------------------------------------------------------------------------------
sub GetXmlNodeList {

  # Passed parameter 1 is the requested node
  my $NodeKey = shift;

  # Local variable(s)
  my $NodeType  = ( $NodeKey =~ s/@// ) ? 'ATTRIBUTES' : 'ELEMENTS';
  my $ParentKey = '';
  my $Key       = '';
  my $MatchNode = '';
  my @Nodes     = ();

  # Determine nodename search or specific lookup
  if ( $NodeKey =~ s/^\/\//\// ) {

    # Translate the XPath, then split it into the parent key and search element
    $ParentKey = TranslateXPath($NodeKey);
    if ( $ParentKey =~ s/}{([a-z0-9\.\-\_]+)\[1\]$// ) { $MatchNode = $1; }

    # Conditionally search for matching keys and store full paths of matches
    unless ( $MatchNode eq '' or $NodeKey !~ /$MatchNode$/ ) {
      foreach $Key ( @{ $XmlNodeTree{$ParentKey}{ITEMS}{$NodeType} } ) {
        if ( $Key =~ /$MatchNode\[\d+\]/ ) { push @Nodes, "$ParentKey}{$Key"; }
      }
    }

  } else {  # Specific look-up

    # Conditionally prepend the current relative path
    unless ( $NodeKey =~ /^ROOT/ ) { $NodeKey = $RelativePath . $NodeKey; }

    # Translate XPaths when specified
    if ( $NodeKey =~ /\// ) { $NodeKey = TranslateXPath($NodeKey); }

    # Lookup listing node if it exists
    if ( exists($XmlNodeTree{$NodeKey}{ITEMS}{$NodeType}) ) {
      @Nodes = @{ $XmlNodeTree{$NodeKey}{ITEMS}{$NodeType} };
    } elsif ( $ShowWarnings ) {
      ReportWarning('Unable to get node list due to non-existent access path');
    }

  }

  # Display a list of nodes when in debug mode
  if ( $DebugMode ) { foreach $Key ( @Nodes) { print "List node: '$Key'\n"; } }

  return ( @Nodes );
}


# ------------------------------------------------------------------------------
#   PUBLIC: 'GetXmlValue' - Extract the value of the specified element.
#                           Prepend '@' character before name to get attributes
# ------------------------------------------------------------------------------
sub GetXmlValue {

  # Passed parameter 1 is the requested node start point
  my $NodeKey = shift;

  # Local variable(s)
  my $Attribute = ( $NodeKey =~ s/@(.+)$// ) ? $1 : '';
  my $Value     = '';
  my $NoValue   = '';

  # Conditionally prepend the current relative path
  unless ( $NodeKey =~ /^ROOT/ ) { $NodeKey = $RelativePath . $NodeKey; }

  # Translate XPaths when specified
  if ( $NodeKey =~ /\// ) { $NodeKey = TranslateXPath($NodeKey); }

  # Lookup the value or attribute node if it exists. It must be coded like this
  #  to avoid non-existent keys from being incorrectly added to the hash as a
  #  side effect of the 'exists()' function
  if ( exists($XmlNodeTree{$NodeKey}) ) {
    # Now check and extract the element or attribute value
    if ( $Attribute ne '' ) {
      if ( exists($XmlNodeTree{$NodeKey}{ATTRIBUTES}{$Attribute}) ) {
        $Value = $XmlNodeTree{$NodeKey}{ATTRIBUTES}{$Attribute};
        unless ( defined($Value) ) { $Value = $NoValue; }
      } elsif ( $ShowWarnings ) {
        ReportWarning('Access attempted to a non-existent attribute name');
      }
    } else {
      $Value = exists( $XmlNodeTree{$NodeKey}{VALUE} ) ?
                 $XmlNodeTree{$NodeKey}{VALUE} : $NoValue;
    }
  } elsif ( $ShowWarnings ) {
    ReportWarning("Access attempted to a non-existent element '$NodeKey'");
  }

  # Perform substitution of ampersand fields
  if ( $Value =~ /&(quot|apos|lt|gt|amp|#x?[A-Fa-f0-9]+);/ ) {
    $Value =~ s/&quot;/"/g;
    $Value =~ s/&apos;/'/g;
    $Value =~ s/&lt;/</g;
    $Value =~ s/&gt;/>/g;
    $Value =~ s/&amp;/&/g;
    $Value =~ s/&#([A-Fa-f0-9]{3});/chr( scalar $1 )/ge;          # Only UTF-8!
    $Value =~ s/&#x([A-Fa-f0-9]{2});/chr( hex( scalar $1 ) )/ge;  # Only UTF-8!
  }

  return ( $Value );
}


# ------------------------------------------------------------------------------
#   PUBLIC: 'ConfigureXmlParser' - Configure aspects of module behaviour
# ------------------------------------------------------------------------------
sub ConfigureXmlParser {

  # Passed parameter 1 is the hash array of options
  my %XmlParserOptions = @_;

  # Local variable(s)
  my @Keys   = keys( %XmlParserOptions );
  my $Item   = '';
  my $Result = 0;

  # Extract values and execute requested actions
  foreach $Item ( @Keys ) {
    if ($Item eq 'debug_mode' and $XmlParserOptions{$Item} ) {
      $DebugMode = 1;
    } elsif ( $Item eq 'recursion_limit' and $XmlParserOptions{$Item} > 0 ) {
      $RecursionLimit = $XmlParserOptions{$Item};
    } elsif ( $Item eq 'reset' and $XmlParserOptions{$Item} ) {
      %XmlNodeTree = ( ROOT => { ITEMS => {ELEMENTS => [], ATTRIBUTES => []} } );
      %XmlNodeTotals = ( TOTAL => 0, ELEMENTS => 0, ATTRIBUTES => 0 );
      @PathStack = ( 'ROOT' );
      $PathLevel = 0;
      $RelativePath = '';
    } elsif ( $Item eq 'show_ids' ) {
      $ShowIds = ( $XmlParserOptions{$Item} ) ? 1 : 0;
    } elsif ( $Item eq 'show_warnings' ) {
      $ShowWarnings = ( ! $XmlParserOptions{$Item} ) ? 0 : 1;
    } elsif ( $Item eq 'verbose' ) {
      $Verbose = ( $XmlParserOptions{$Item} ) ? 1 : 0;
    } else {
      $Result = 1; # Flag a return code error
    }
  }
  return ( $Result );
}


# ------------------------------------------------------------------------------
#   ReportError - Reports an error message on STDOUT and forces exit(1)
# ------------------------------------------------------------------------------
sub ReportError {

  # Passed parameter 1 is the error message
  my $ErrorMessage = shift;

  print "ERROR (xmlparser): $ErrorMessage - aborting!\n\n";
  exit 1;
}


# ------------------------------------------------------------------------------
#   ReportWarning - Reports a warning message on STDOUT
# ------------------------------------------------------------------------------
sub ReportWarning {

  # Passed parameter 1 is the warning message
  my $WarningMessage = shift;

  print "WARNING (xmlparser): $WarningMessage!\n\n";
  $Warnings++;
}

1;

__END__


# ------------------------------------------------------------------------------
#   POD section (formatting is sensitive to blankline whitespace!)
# ------------------------------------------------------------------------------

=pod

=head1 NAME

xmlparser - Standalone XML parser with hash array output

=head1 SYNOPSIS

Example usage:

  # Reference the module
  use xmlparser;

  # Configure parser options, parse the file and list its structure
  ConfigureXmlParser( verbose => 0, reset => 1 );
  RunXmlParser('my.xml');
  ListXmlHash('ROOT');

  # Access specific groups of elements
  my @MyElements = GetXmlNodeList('/myxml/mynames');
  my $Element    = '';
  my $Attribute  = '';

  foreach $Element ( @MyElements ) {
    ChangeRelativePath('/myxml/mynames/');
    printf "Element '%s'='%s'\n", GetXmlName($Element), GetXmlValue($Element);

    foreach $Attribute ( GetXmlNodeList("\@$Element") ) {
      ChangeRelativePath("/myxml/mynames/$Element/");
      printf "Attribute '$Attribute'='%s'\n", GetXmlValue("\@$Attribute");
    }
  }

=head1 DESCRIPTION

In the absence of complete documentation, this section contains the
best source of information.

=head2 DOCUMENTATION

Documentation about this module does not yet exist for developers
within ARM Limited, but this section will provide essential clues
to the usage. If your query is not answered below, then please
contact the author, <richard.oliver@arm.com>, for more details.

=head2 PRINCIPLES

This multi-line parser will extract elements and value text separated
by <tagged_delimeters>. XML directives and declarations are treated as
exceptions and these values will not be added to the hash array.

The parsing algorithm alternates between these two states:

=over 3

=item 1.

  Accumulate value fields until detection of '<' character and
  then change to the 'in-container' state.

=item 2.

  Accumulate element fields until detection of '>' character and
  then change to the 'in-value' state if an end of element is detected.

=back

Upon successfully identifying the closing brace of an element field,
a new item is added to the child element list at the current level of
hierarchy. A new hash key, bearing the element name, is added and
the new hierarchical path is pushed onto the stack. For hierarchical
reference, the current path and parent path are updated. Attributes
are extracted and placed into a separate key-value node, using the
same principles. The parser changes state to accumulate text fields.
Upon closure of the element container, i.e. the next opening brace,
the accumulated text is assigned as the value of the current element.
Also upon this event, the path stack is popped and hierarchical paths
are re-evaluated. Every extracted field is checked for legal composition.
Elements and attributes are checked for wellformedness.

The following example will show the relationship:

B<XML source:>

  <cfgfile>
    <my_element animal="dog"/>
    <my_element>
      cat
    </my_element>
  </cfgfile>

B<Storage structure:>

  my %XmlNodeTree = (
                      ROOT => {
                        ITEMS => {
                          ELEMENTS => [ cfgfile[1] ],
                          ATTRIBUTES => []
                        }
                      }
                      ROOT}{cfgfile[1] => {
                        ITEMS => {
                          ELEMENTS => [ my_element[1], my_element[2] ],
                          ATTRIBUTES => []
                        }
                      }
                      ROOT}{cfgfile[1]}{my_element[1] => {
                        ITEMS => {
                          ELEMENTS => [],
                          ATTRIBUTES => [ animal ]
                        }
                        ATTRIBUTES => {
                          animal => 'dog'
                        }
                      }
                      ROOT}{cfgfile[1]}{my_element[2] => {
                        ITEMS => {
                          ELEMENTS => [],
                          ATTRIBUTES => []
                        }
                        VALUE => 'cat'
                      }
                    );

B<Extracted structure:>

  - ROOT
    - cfgfile
      - my_element
        @value = 'dog'
      - my_element = 'cat'


Note that data is stored in the hash array using a pseudo hierarchical
method. This makes it very simple to use grep when needing to find
specifically named elements.

To interrogate the hash array, it is recommended to use the public
access functions GetXmlNodes() and GetXmlValue(). These functions will
translate a basic XPath notation into keys for hash access and perform
substitution of escaped character sequences.

=head1 FUNCTIONS

Currently, there are only a few public methods available. This section
describes each one.

=head2 ConfigureXmlParser(<key-value pairs>)

Use this procedure to modify the behaviour of the parser, e.g. to reset
the hash array. It accepts the following key-value pairs, also shown in
the above example:

=over 3

=item *

debug_mode => <integer: 0|1> - show debugging information.

=item *

recursion_limit => <integer: 1..n> - for the B<ListXmlHash()> fn.

=item *

reset => <integer: 0|1> - resets the hash and stack.

=item *

verbose => <integer: 0|1> - modifies verbosity, e.g. quiet mode.

=item *

show_ids => <integer: 0|1> - shows actual hash keynames.

=item *

show_warnings => <integer: 0|1> - control reports of warnings.

=back

Further options may be added over time.

=head2 RunXmlParser(<xml_filename>)

Use this procedure to read in the specified XML file. Ensure that
you reset the hash array before attempting to read another file - see
B<ConifigureXmlParser()>.

=head2 ListXmlHash(<starting_key>)

Use this procedure to verify the extraction process. All data is
contained under the B<'ROOT'> node, so this is often the only key
that you should specify.

=head2 ChangeRelativePath(<xpath or key>)

This function sets the relative path to be prepended to the specified
argument when calling the B<GetXmlNodeList()> and B<GetXmlValue()>
public access functions. Building XPaths and keys is more managable
this way.

=head2 GetXmlNodeList(<xpath or key>)

Use this function to obtain the list of child elements or a list of
attributes under the specified hierarchical level. By specifying the
'@' character in the XPath or at the end of the key, you can request
attributes instead of elements. Access to a non-existent xpath or key
will return a zero-item list.

=head2 GetXmlValue(<xpath or key>)

Use this function to obtain the value of the element or attribute
under the specified hierarchical level. By specifying the '@' character
at the start of the attribute name (i.e. the rightmost item in the
XPath or key), you can request attributes instead of elements. Access
to a non-existent xpath or key will return a zero-length string. Access
to elements or attributes without value will return a zero-length string.

The following 'escaped' characters will be substituted to their
true ASCII character:

=over 3

=item *

&quot; -> "

=item *

&apos; -> '

=item *

&lt; -> <

=item *

&gt; -> >

=item *

&amp; -> &

=item *

&#x<2_hex_chars>; -> equivalent hexadecimal character

=item *

&#<3_dec_chars>; -> equivalent decimal character

=back

=head2 GetXmlName(<item string>)

Removes the uniquifying index from the hash key item and returns the
originally named item.

=head2 Direct hash access

Knowing the format of key structure will allow you to perform access
to the hash array directly. You always need to know something about the
information structure in order to specify an XPath or key. This is
true even when letting XSLT do the work!

With reference to the example shown above, to access the 2nd element,
you would need to recreate this key:

  # Direct access of an element
  my $Value = $XmlNodeTree{'ROOT}{cfgfile[1]}{my_element[2]'}{VALUE};

  # Direct access of an attribute
  my $Attribute = $XmlNodeTree{'ROOT}{cfgfile[1]}{my_element[1]'}{ATTRIBUTES}{animal};


To access the desired positional element without hardcoding the node
keys, you could try resolving this through the appropriate ITEMS array
which records the ordering of all child items at the access level.
Examples of this are shown below:

  # Set-up
  use xmlparser;                       # Load the XML parser module
  use xmlparser qw ( %XmlNodeTree );   # Request direct hash access

  # Indirectly access the 2nd 'my_element' element
  my $EI = $XmlNodeTree{'ROOT}{cfgfile[1]'}{ITEMS}{ELEMENTS}[1];
  my $Value = $XmlNodeTree{"ROOT}{cfgfile[1]}{$EI"}{VALUE};

  # Indirectly access the 1st attribute of the 1st element
  my $EI = $XmlNodeTree{'ROOT}{cfgfile[1]'}{ITEMS}{ELEMENTS}[0];
  my $AI = $XmlNodeTree{"ROOT}{cfgfile[1]}{$EI"}{ITEMS}{ATTRIBUTES}[0];
  my $Value = $XmlNodeTree{"ROOT}{cfgfile[1]}{$EI"}{ATTRIBUTES}{$AI};

As will be appreciated, this is quite complicated! Therefore it is
better to use the public access functions for ease of use. Your choice.

=head1 SUPPORT

The following support issues are noted under this section.

=head2 Regarding XML

This is a lightweight parser, compliant to only a subset of the
XML 1.0 standard. Namespaces are supported at a basic level, that
is, the ':' character is permitted in element names. The following
support issues are defined below:

=over 3

=item 1.

The ENTITY declaration is not fully implemented and there is no
preprocessor for expanding macros instantiated by the '&MyFile;'
notation.

=item 2.

The DOCTYPE declaration is not fully implemented and there is no
support for DTD or XML-Schema. Checks can be performed efficiently
by writing a customised checking procedure within the PERL domain.

=item 4.

Only the '<?xml ?>' processing instruction is supported as far as
basic validation.

=item 5.

Only character sets 'iso-8859-1' and 'UTF-8' are accepted in the
header check.

=item 6.

Elements embedded in the <emphasis>middle</emphasis> of value fields,
like the 'emphasis' tag you have just read, are not supported. It will
truncate the text value and prepend the remainder to the value of the
next element.

=back

=head2 Regarding XPath and XPointer

The XPath facility of the public access functions is only a basic
provision. It only translates very simple XPaths into access-key
notation, and it does not support any of the XPath functions. The
XPointer notation allows indexed dereferencing of specific elements.
This is sufficient to get the values of elements and attributes.
Some examples of XPath and XPointer interpretations are shown below:

  '/myxml'    = 'ROOT}{myxml[1]'                         # Absolute
  '/myxml[1]' = 'ROOT}{myxml[1]'

  'myxml'     = 'myxml[1]'                               # Relative
  'myxml[2]   = 'myxml[2]'

  '//myxml' = [ 'ROOT}{myxml[1]' 'ROOT}{myxml[2]' ... ]  # Search

Generally speaking, the relationship is to convert '/' characters into
'}{' brace-pairs, and to assume the first item when resolving non-indexed
references.

=head1 STATUS

This version (1.00) is the current initial version, dated 11th January 2007.

=head1 SEE ALSO

This is a customised standalone module. There are no references to other
modules from the developers community. Information for developers may be
obtained through internal ARM documentation.

=head1 COPYRIGHT

Copyright 2006 ARM Limited. All rights reserved <support@arm.com>

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. However, because this file is supplied
to support licenced IP from ARM Limited, please carefully check the terms
and conditions defined in your legal agreement with ARM Limited.

=cut
