#-----------------------------------------------------------------------------
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
#  File Revision       : $Revision: 368444 $
#  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
#
#  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
#-----------------------------------------------------------------------------

# FPGA Application note number
PROJECT=SMM_M0DS_AN387

# Revision to add as last character to RBF filename
# Note. Due to 8:3 filenaming, this can only be a single digit
REV=5


# Build complete flow
all: synth fit assembler timequest convert
	@echo -----------------------------------
	@echo -- Building $(PROJECT) --
	@echo -----------------------------------


synth:
	@echo ----------------------------
	@echo ---------Synthesis----------
	@echo ----------------------------
	quartus_map $(PROJECT)

fit:
	@echo ----------------------------
	@echo -----------Fitter-----------
	@echo ----------------------------
	quartus_fit $(PROJECT)

assembler:
	@echo ----------------------------
	@echo ---------Assembler----------
	@echo ----------------------------
	quartus_asm $(PROJECT)

timequest:
	@echo ----------------------------
	@echo -TimeQuest Timing Analysis--
	@echo ----------------------------
	quartus_sta $(PROJECT)

convert:
	@echo ----------------------------
	@echo -------Generate Image-------
	@echo ----------------------------
	quartus_cpf -c output_files/$(PROJECT).sof $(PROJECT).rbf -o bitstream_compression=on
	# Note.  File system on MPS2+ card supports 8:3 filename format, root name must be 8 or less characters.
	cp $(PROJECT).rbf an387_v$(REV).rbf
	rm $(PROJECT).rbf

# If GUI only is desired
gui:
	quartus

# Clean the directory
clean:
	@echo --- Cleaning Synthesised Database ---
	rm -rf db
	rm -rf incremental_db
	rm -rf c5_pin_model_dump.txt
	rm -rf PLLJ_PLLSPE_INFO.txt
	rm -rf *.done
	rm -rf *.qws
	rm -rf *_assignment_defaults.qdf
	rm -rf output_files/*.smsg
	rm -rf output_files/*.rpt
	rm -rf output_files/*.summary
	rm -rf output_files/*.done
	rm -rf output_files/*.jdi
	rm -rf output_files/*.pin
	rm -rf output_files/*.sld
	rm -rf output_files/*.sof
	rm -rf output_files/*.rbf
	rm -rf $(PROJECT)\_synth_log.txt
