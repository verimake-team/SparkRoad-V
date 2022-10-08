#-----------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited or its affiliates.
#
#            (C) COPYRIGHT 2010-2013 ARM Limited or its affiliates.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited or its affiliates.
#
#  Version and Release Control Information:
#
#  File Revision       : $Revision: 369121 $
#  File Date           : $Date: 2017-08-11 14:38:07 +0100 (Fri, 11 Aug 2017) $
#
#  Release Information : ARM Internal: 
#-----------------------------------------------------------------------------
#
# Cortex-M0 DesignStart RTL Bundle simulation make file
#
#-----------------------------------------------------------------------------
#
#  Configurations
#
# Name of test directory (e.g. hello, dhry)
# TESTNAME must be specified on the make command line
TESTNAME    =

# List of all tests (this is used when running 'make all/clean')
TEST_LIST   = designtest_m0 dualtimer_demo self_reset_demo sleep_demo watchdog_demo \
 apb_mux_tests default_slaves_tests timer_tests dhry timer_driver_tests hello

# Default to DS-5 tool-chain
TOOL_CHAIN = ds5

# CM0 DesignStart FPGA and testbench
TBENCH_VC  = ./tbench.vc

# Simulator type (mti/vcs/nc)
SIMULATOR  = mti

# MTI option
MTI_OPTIONS     = 

MTI_SIM_OPTIONS = -voptargs="+acc=+tb_fpga." 
MTI_VC_OPTIONS  = -f $(TBENCH_VC)

# VCS option
VCS_OPTIONS    = +vcs+lic+wait +v2k +lint=all,noTMR,noVCDE -debug
VCS_SIM_OPTION = +vcs+lic+wait +vcs+flush+log -assert nopostproc
VCS_VC_OPTIONS = -f $(TBENCH_VC)

# NC verilog option
NCSIM_OPTIONS  = -unbuffered -status -LICQUEUE -f ncsim.args -cdslib cds.lib -hdlvar hdl.var -NBASYNC
NC_VC_OPTIONS  = -f $(TBENCH_VC)

# Software make options
# - Pass onto the software makefile to define targetted CPU type
# You can append additional make options for testcode here
SW_MAKE_OPTIONS = CPU_PRODUCT=$(CPU_PRODUCT) TOOL_CHAIN=$(TOOL_CHAIN)

# ------- Simulator redirect -----------

compile : compile_$(SIMULATOR)


run     : run_$(SIMULATOR)


sim     : sim_$(SIMULATOR)


all     : all_$(SIMULATOR)

# ------- VCS -----------

# Compile RTL
compile_vcs :
	vcs $(VCS_OPTIONS) $(VCS_VC_OPTIONS) | tee compile_vcs.log

# Run simulation in batch mode
run_vcs : code
	@if [ ! -d logs ] ; then \
	  mkdir logs; \
	fi
	@cp setup_vcs.do vcs_cmd.do    
	@echo run >> vcs_cmd.do
	@echo quit >> vcs_cmd.do
	./simv $(VCS_SIM_OPTION) -ucli -i vcs_cmd.do | tee logs/run_$(TESTNAME).log ;

# Run simulation in interactive mode
sim_vcs : code
	./simv -do "setup_vcs.do" -gui +vcs+lic+wait +vcs+flush+log &

# Compile RTL, and run all tests in batch mode
all_vcs : compile_vcs 
	@if [ ! -d logs ] ; then \
	  mkdir logs; \
	fi
	@cp setup_vcs.do vcs_cmd.do    
	@echo run >> vcs_cmd.do
	@echo quit >> vcs_cmd.do
	@echo Run tests ...
	for thistest in $(TEST_LIST) ; do \
	  echo $$thistest   ; \
	  make testcode TESTNAME=$$thistest ;\
	  if [ -e itcm64.hex ] ; then \
	    ./simv +vcs+lic+wait +vcs+flush+log -ucli -i vcs_cmd.do | tee logs/run_$$thistest.log ;\
	  else \
	    echo Cannot read itcm64.hex ;\
	    exit 1; \
	  fi ; \
	done

# ------- NC -----------

# Compile RTL
compile_nc :
	ncprep +overwrite $(NC_VC_OPTIONS) +debug  | tee    compile_nc.log
	ncvlog  -work worklib -f  ncvlog.args      | tee -a compile_nc.log
	ncelab  -mess -f ncelab.args -access +w    | tee -a compile_nc.log

# Note : If coverage is required, you can add -coverage all to ncelab

# Run simulation in batch mode
run_nc : code
	@if [ ! -d logs ] ; then \
	  mkdir logs; \
	fi
	@cp setup_nc.tcl run.tcl.tmp    
	@echo run  >> run.tcl.tmp
	@echo exit >> run.tcl.tmp
	@mv  run.tcl.tmp run.tcl
	ncsim $(NCSIM_OPTIONS) -input run.tcl | tee logs/run_$(TESTNAME).log ;

# Run simulation in interactive mode
sim_nc : code
	ncsim -gui -input setup_nc.tcl $(NCSIM_OPTIONS)

# Compile RTL, and run all tests in batch mode
all_nc : compile_nc 
	@if [ ! -d logs ] ; then \
	  mkdir logs; \
	fi
	@cp setup_nc.tcl run.tcl.tmp    
	@echo run  >> run.tcl.tmp
	@echo exit >> run.tcl.tmp
	@mv  run.tcl.tmp run.tcl
	@echo Run tests ...
	for thistest in $(TEST_LIST) ; do \
	  echo $$thistest   ; \
	  make testcode TESTNAME=$$thistest ;\
	  if [ -e itcm64.hex ] ; then \
	    ncsim $(NCSIM_OPTIONS) -input run.tcl | tee logs/run_$$thistest.log ;\
	  else \
	    echo Cannot read itcm64.hex files ;\
	    exit 1; \
	  fi ; \
	done

# ------- MTI -----------

# Compile RTL
compile_mti :
	@if [ -d work ] ; then \
          true ; \
	else \
	  vlib work; \
	fi
	vlog -incr -lint +v2k $(MTI_OPTIONS) $(MTI_VC_OPTIONS) | tee compile_mti.log

# Run simulation in batch mode
run_mti : code
	@if [ ! -d logs ] ; then \
	  mkdir logs; \
	fi
	vsim $(MTI_SIM_OPTIONS) -c tb_fpga -do "radix hex;do setup_mti.do;run -all;quit -f" | tee logs/run_$(TESTNAME).log ;

# Run simulation in interactive mode
sim_mti : code
	vsim $(MTI_SIM_OPTIONS) -do "do setup_mti.do;do wave_mti.do" -gui tb_fpga &

# Create work directory
lib_mti :
	vlib work

# Compile RTL, and run all tests in batch mode
all_mti : compile_mti
	@if [ ! -d logs ] ; then \
	  mkdir logs; \
	fi
	@echo Run tests ...
	for thistest in $(TEST_LIST) ; do \
	  echo $$thistest   ; \
	  make testcode TESTNAME=$$thistest ;\
	  if [ -e itcm64.hex ] ; then \
	    vsim $(MTI_SIM_OPTIONS) -c tb_fpga -do "radix hex;do setup_mti.do;run -all;quit -f" | tee logs/run_$$thistest.log ;\
	  else \
	    echo Cannot read itcm64.hex files ;\
	    exit 1; \
	  fi ; \
	done

# ------- Software -----------

# code target is used by other simulation targets (e.g. run_mti, sim_mti)
# Before simulation, testcode need to be compiled, (FPGA does not have a bootrom)
code : testcode

# Note : The use of ls after compile allows for a distributed filesystem
testcode:
ifeq ($(TESTNAME),)
	$(error Please specify TESTNAME on the make command line)
endif
	@(if [ -d "../testcodes/$(TESTNAME)" ] ; then \
	  cd ../testcodes/$(TESTNAME) ;\
	  make all $(SW_MAKE_OPTIONS) TESTNAME=$(TESTNAME); \
	  echo Compile done ;\
	  ls > /dev/null ;\
    echo Copy $(TESTNAME).hex to itcm64.hex ;\
    if [ -e  $(TESTNAME).hex ] ; then \
      cp $(TESTNAME).hex ../../rtl_sim/itcm64.hex ; \
    else \
      echo Wait for hex file ...; \
      ls > /dev/null ;\
      sleep 5 ; \
      if [ -e  $(TESTNAME).hex ] ; then \
        cp $(TESTNAME).hex ../../rtl_sim/itcm64.hex ; \
      else \
        echo Problem reading hex file ;\
        exit 1; \
      fi ;\
    fi ;\
	  cd ../../rtl_sim ;\
	  tclsh split_hex_8x8.tcl ;\
	else \
	  echo "ERROR: invalid TESTNAME value ( $(TESTNAME) )" ;\
	  exit 1 ;\
	fi ;\
	)

# Compile all software including boot ROM
compile_all_code:
	for thistest in $(TEST_LIST) ; do \
	  echo Compiling $$thistest   ; \
	  echo Removing old itcm files ;\
	  rm -f itcm*  ;\
	  make testcode TESTNAME=$$thistest;\
	  if [ -e itcm3.hex ] ; then \
            echo OK    - itcm files created for test $$thistest ;\
	  else \
	    echo ERROR - itcm files NOT created for test $$thistest ;\
	    exit 1; \
	  fi ; \
	done


# Remove all software compilation results
clean_all_code:
	for thistest in $(TEST_LIST) ; do \
	  echo Cleaning $$thistest ...  ;\
	  cd ../testcodes/$$thistest ;\
	  make clean ;\
	  cd ../../rtl_sim ;\
	  rm -f *.hex ;\
	  rm -f *.elf ;\
	done

# Remove only the selected test
clean_code:
	@(cd ../testcodes/$(TESTNAME)   ; make clean; cd ../../rtl_sim; )

# ------- clean -----------

# Remove RTL compile files, log files, software compile files
clean : clean_all_code
	@if [ -d work ] ; then \
	  rm -rf work ; \
	fi
	@if [ -e tarmac0.log ] ; then \
	  rm tarmac0.log ; \
	fi
	@if [ -e tarmac1.log ] ; then \
	  rm tarmac1.log ; \
	fi
	@if [ -e vsim.wlf ] ; then \
	  rm vsim.wlf ; \
	fi
	@if [ -e compile_mti.log ] ; then \
	  rm  compile_mti.log ; \
	fi
	@if [ -e compile_vcs.log ] ; then \
	  rm  compile_vcs.log ; \
	fi
	@if [ -e compile_nc.log ] ; then \
	  rm  compile_nc.log ; \
	fi
	@if [ -e transcript ] ; then \
	  rm  transcript ; \
	fi
	@if [ -e simv ] ; then \
	  rm  simv ; \
	fi
	@if [ -d csrc ] ; then \
	  rm -rf csrc ; \
	fi
	@if [ -d simv.daidir ] ; then \
	  rm -rf simv.daidir ; \
	fi
	@if [ -e inter.vpd ] ; then \
	  rm -rf inter.vpd ; \
	fi
	@if [ -e vcs_cmd.do ] ; then \
	  rm -rf vcs_cmd.do ; \
	fi
	@if [ -e ucli.key ] ; then \
	  rm -rf ucli.key ; \
	fi
	@if [ -d DVEfiles ] ; then \
	  rm -rf DVEfiles ; \
	fi
	@if [ -d INCA_libs ] ; then \
	  rm -rf INCA_libs ; \
	fi
	@if [ -d cov_work ] ; then \
	  rm -rf cov_work ; \
	fi
	@if [ -e hdl.var ] ; then \
	  rm -rf hdl.var ; \
	fi
	@if [ -e ncelab.args ] ; then \
	  rm -rf ncelab.args ; \
	fi
	@if [ -e ncvlog.args ] ; then \
	  rm -rf ncvlog.args ; \
	fi
	@if [ -e ncsim.args ] ; then \
	  rm -rf ncsim.args ; \
	fi
	@if [ -e ncprep.log ] ; then \
	  rm -rf ncprep.log ; \
	fi
	@if [ -e ncelab.log ] ; then \
	  rm -rf ncelab.log ; \
	fi
	@if [ -e ncvlog.log ] ; then \
	  rm -rf ncvlog.log ; \
	fi
	@if [ -e ncsim.log ] ; then \
	  rm -rf ncsim.log ; \
	fi
	@if [ -e run.tcl ] ; then \
	  rm -rf run.tcl ; \
	fi
	@if [ -e RUN_NC ] ; then \
	  rm -rf RUN_NC ; \
	fi
	@if [ -e ncsim.key ] ; then \
	  rm -rf ncsim.key ; \
	fi
	@if [ -e cds.lib ] ; then \
	  rm -rf cds.lib ; \
	fi
