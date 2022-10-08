#------------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited or its affiliates.
#
#            (C) COPYRIGHT 2010-2015 ARM Limited or its affiliates.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited or its affiliates.
#
#  Version and Release Control Information:
#
#  File Revision       : $Revision: 368444 $
#  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
#
#  Release Information : ARM Internal
#------------------------------------------------------------------------------
#
# Script to split a 64 bit wide word in hex into 8 streams
# Necessary since fromelf doesn't support an 8x8 option.  So instead the elf
# is split into a 64x1, hence 64 bit words which is what the SSRAM memory is
# configured as.  The each 64 bit word is split into 8 bytes in this script
# and output into 8 seperate files.
#
# -----------------------------------------------------------------------------
#

# Variables
set SRC_FILE    "itcm64.hex";   # Input file name
set NUM_BANKS   8;              # Number of memory banks
set DATA_W      8;              # Each bank is 8 bits wide (used)
set OUT_FILE    "itcm";         # Will have a n.hex extension added

# Start of script

# Open the input file
set fin [open $SRC_FILE RDONLY];
if { $fin == 0 } {
    puts "Error opening $SRC_FILE for reading"
    return -1
}

# Create the 8 memory hex output files
for {set mem 0} {$mem < $NUM_BANKS} {incr mem} {
    # Create the individual output filename
    set filename [file join [pwd] $OUT_FILE]
    append filename $mem ".hex"
    
    # If file exists, truncate it to size of 0
    set fout [open $filename {CREAT WRONLY TRUNC}]
    if { $fout == 0 } {
        puts "Error opening $filename for writing"
        return -1
    }
    
    # Start with the offset, each hex byte is 2 characters
    # Lowest bank number is MSB
    set idx [expr {14 - 2*$mem}]
    while { ![eof $fin] } {
        set line [gets $fin]
        # Ensure we are only writing hexadecimal bytes
        if { [string is xdigit $line] } {
            puts $fout [string range $line $idx [expr {$idx+1}]]
        } else {
            puts "ERROR - non hex characters read"
            return -1
        }
    }
  
    # close the output file
    close $fout
    unset fout
    unset idx
    
    # Reset the input file
    seek $fin 0
}

# Close the input file
close $fin

# If we got here, then the script has succeeded
puts "$SRC_FILE successfully split into $NUM_BANKS hex files"

