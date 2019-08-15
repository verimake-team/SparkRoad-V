<?xml version="1.0" encoding="UTF-8"?>
<Project>
    <Project_Created_Time>2015-12-03 11:43:51</Project_Created_Time>
    <TD_Version>4.3.949</TD_Version>
    <UCode>00000000</UCode>
    <Name>sdram_test</Name>
    <HardWare>
        <Family>EG4</Family>
        <Device>EG4S20BG256</Device>
    </HardWare>
    <Source_Files>
        <Verilog>
            <File>../Command.v</File>
            <File>../control_interface.v</File>
            <File>../sdr_data_path.v</File>
            <File>../sdr_sdram.v</File>
            <File>../sdram_control.v</File>
            <File>al_ip/pll1.v</File>
            <File>al_ip/SDRAM.v</File>
            <File>seg_4.v</File>
        </Verilog>
        <CWC_FILE/>
        <ADC_FILE>sdram_test.adc</ADC_FILE>
        <SDC_FILE>sdram_test.sdc</SDC_FILE>
    </Source_Files>
    <TOP_MODULE>
        <LABEL/>
        <MODULE>sdram_control</MODULE>
        <CREATEINDEX>user</CREATEINDEX>
    </TOP_MODULE>
    <Property>
        <GlobalProperty/>
        <DesignProperty>
            <infer_fsm>auto</infer_fsm>
            <infer_mux>on</infer_mux>
        </DesignProperty>
        <RtlProperty/>
        <GateProperty>
            <auto_partition>off</auto_partition>
            <report>simple</report>
        </GateProperty>
        <PlaceProperty>
            <opt_timing>high</opt_timing>
        </PlaceProperty>
        <RouteProperty>
            <opt_timing>high</opt_timing>
        </RouteProperty>
        <BitgenProperty::GeneralOption>
            <bin>off</bin>
            <c>off</c>
            <s>off</s>
            <svf>off</svf>
            <svf_comment_on>off</svf_comment_on>
            <version>0x0000</version>
        </BitgenProperty::GeneralOption>
        <TimingProperty/>
        <SimProperty/>
    </Property>
    <Project_Settings>
        <Current_Step>60</Current_Step>
        <SRC-Last-Read>2016-04-14 16:54:05</SRC-Last-Read>
        <SLC-Last-Read>2016-04-14 16:54:05</SLC-Last-Read>
        <SDC-Last-Read>2016-05-31 13:23:42</SDC-Last-Read>
        <Step_Last_Change>2019-08-09 19:51:50</Step_Last_Change>
        <Step_Status>true</Step_Status>
    </Project_Settings>
</Project>
