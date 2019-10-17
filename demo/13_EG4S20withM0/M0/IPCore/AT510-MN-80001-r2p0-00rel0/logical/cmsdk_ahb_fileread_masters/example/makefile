#-----------------------------------------------------------------------------
# The confidential and proprietary information contained in this file may
# only be used by a person authorised under and to the extent permitted
# by a subsisting licensing agreement from ARM Limited.
#
#            (C) COPYRIGHT 2010-2013 ARM Limited.
#                ALL RIGHTS RESERVED
#
# This entire notice must be reproduced on all copies of this file
# and copies of this file may only be made by a person if such person is
# permitted to do so under the terms of a subsisting license agreement
# from ARM Limited.
#
#      SVN Information
#
#      Checked In          : $Date: 2011-04-01 16:11:27 +0100 (Fri, 01 Apr 2011) $
#
#      Revision            : $Revision: 166628 $
#
#      Release Information : Cortex-M System Design Kit-r1p0-00rel0
#-----------------------------------------------------------------------------

# Simulator type (mti/vcs/nc)
SIMULATOR   = mti

# MTI option
MTI_OPTIONS = -novopt

# VCS option
VCS_OPTIONS = +vcs+lic+wait -Mupdate -debug

# NC verilog option
NCSIM_OPTIONS = -unbuffered -status -LICQUEUE -f ncsim.args -cdslib cds.lib -hdlvar hdl.var -NBASYNC

# ------- Test vector -----------
frbm_example.out: frbm_example.fri
	@(perl ../../ahb_fileread_masters/bin/fm2conv.pl -busWidth=32 -infile=frbm_example.fri -outfile=frbm_example.out)

# ------- Simulator redirect -----------

compile : compile_$(SIMULATOR)


run     : run_$(SIMULATOR)


sim     : sim_$(SIMULATOR)


all     : all_$(SIMULATOR)


# ------- VCS -----------
compile_vcs :
	vcs $(VCS_OPTIONS) -f tbench.vc +v2k | tee compile_vcs.log

run_vcs : frbm_example.out
	echo quit > quit.do
	./simv +vcs+lic+wait +vcs+flush+log +v2k < quit.do

sim_vcs : frbm_example.out
	./simv -gui +vcs+lic+wait +vcs+flush+log &

all_vcs : frbm_example.out
	vcs -R -ntb_opts dtm $(VCS_OPTIONS) -f tbench.vc

# ------- MTI -----------

compile_mti :
	@if [ -d work ] ; then \
          true ; \
	else \
	  vlib work; \
	fi
	vlog -incr -lint $(MTI_OPTIONS) -f tbench.vc | tee compile_mti.log

run_mti : frbm_example.out
	vsim $(MTI_OPTIONS) -c tb_frbm_example -do "run -all;quit -f"

sim_mti : frbm_example.out
	vsim $(MTI_OPTIONS) -gui tb_frbm_example &

all_mti : frbm_example.out
	qverilog -f tbench.vc

# ------- NC -----------

# Compile RTL
compile_nc :
	ncprep +overwrite  -f tbench.vc       | tee    compile_nc.log
	ncvlog  -work worklib -f  ncvlog.args | tee -a compile_nc.log
	ncelab  -mess -f ncelab.args          | tee -a compile_nc.log

# Run simulation in batch mode
run_nc : frbm_example.out
	@echo run  >  run.tcl.tmp
	@echo exit >> run.tcl.tmp
	@mv  run.tcl.tmp run.tcl
	ncsim $(NCSIM_OPTIONS) -input run.tcl

# Run simulation in interactive mode
sim_nc : frbm_example.out
	ncsim -gui $(NCSIM_OPTIONS)

all_nc : frbm_example.out
	echo quit > quit.do
	irun -f tbench.vc < quit.do


# ------- clean -----------

clean :
	@if [ -d work ] ; then \
	  rm -rf work ; \
	fi
	@if [ -e vsim.wlf ] ; then \
	  rm vsim.wlf ; \
	fi
	@if [ -e frbm_example.out ] ; then \
	  rm frbm_example.out ; \
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
	@if [ -e qverilog.log ] ; then \
	  rm  qverilog.log ; \
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
	@if [ -e quit.do ] ; then \
	  rm -rf quit.do ; \
	fi
	@if [ -e irun.key ] ; then \
	  rm -rf irun.key ; \
	fi
	@if [ -e irun.log ] ; then \
	  rm -rf irun.log ; \
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
