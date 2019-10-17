#------------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited or its affiliates.
#
#            (C) COPYRIGHT 2017 ARM Limited or its affiliates.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited or its affiliates.
#
#  Version and Release Control Information:
#
#  File Revision       : $Revision: 368564 $
#  File Date           : $Date: 2017-07-28 11:01:09 +0100 (Fri, 28 Jul 2017) $
#
#  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
#------------------------------------------------------------------------------

# ################################################################
# Script to produce compressed bitfile from Quartus output
# ################################################################

# ################################################################
# Project settings
# ################################################################
set BUILD_NUM       "v5";               # Change this for each build done
                                        # Maximum of 2 characters
set out_files_dir   "output_files";     # Output files directory


# ################################################################
# Code below here should not be modified
# ################################################################
set SOF_NAME        "SMM_M0DS_AN387";   # SoF file name
set TARGET_NAME     "an387_";           # Max 6 characters

# Wrapper procedure to execute the quartus_cfp programme
# Can accommodate 1 or 2 input files
proc run_cpf { exe options fileOut fileIn1 {fileIn2 ""}} {

    # Execute the conversion
    if { $fileIn2 != "" } {
        set good_run [catch {exec -- $exe $options $fileIn1 $fileIn2 $fileOut} result]
    } else {
        set good_run [catch {exec -- $exe $options $fileIn1 $fileOut} result]
    }

    # Check it ran okay, if not print the output and exit
    if { $good_run != 0 } { puts "ERROR : Creating $fileOut failed"; puts $result; return -1;
    } else { puts "$fileOut created successfully"}
    
    return 0;

}
# ################################################################
# Main start
# ################################################################

# Check we have the executable available
set cpf_exec [auto_execok "quartus_cpf"]
if { $cpf_exec == "" } { puts "ERROR : Cannot find quartus_cpf in the path " ; return -1 }

# ################################################################
# Create bit-stream
# ################################################################
# Assemble the file name
set TARGET_BUILD_NAME "$TARGET_NAME$BUILD_NUM"

# Ensure name is 8 characters or less for MPS2 MCC BIOS compatibility
if { [string length $TARGET_BUILD_NAME] > 8 } { puts "$TARGET_BUILD_NAME is more than 8 characters long, please shorten" ; return -1 }

set SOF_FILE [file join [pwd] $out_files_dir "$SOF_NAME.sof"]
set RBF_FILE [file join [pwd] $out_files_dir "$TARGET_BUILD_NAME.rbf"]

# ################################################################
# Convert the SoF to the RBF, including with compression
if { [run_cpf $cpf_exec "-c" $RBF_FILE $SOF_FILE ] != 0 } { return -1 }

# To have got here, all code has built correctly, so exit
return 0;

