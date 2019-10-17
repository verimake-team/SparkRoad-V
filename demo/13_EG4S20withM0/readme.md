/*******************************************************************************************
**************************"Hello Cortex-M0" run on the Anlogic FPGA*************************
*******************************************************************************************/
/*
Date:20191017
Author: R7 and PengYu
*/

/*******************************************************************************************
*__      __       _ __  __       _          __   __                   _             _      *
*\ \    / /      (_)  \/  |     | |         \ \ / /       /\         | |           (_)     *
* \ \  / /__ _ __ _| \  / | __ _| | _____    \ V /       /  \   _ __ | | ___   __ _ _  ___ *
*  \ \/ / _ \ '__| | |\/| |/ _` | |/ / _ \    > <       / /\ \ | '_ \| |/ _ \ / _` | |/ __|*
*   \  /  __/ |  | | |  | | (_| |   <  __/   / . \     / ____ \| | | | | (_) | (_| | | (__ *
*    \/ \___|_|  |_|_|  |_|\__,_|_|\_\___|  /_/ \_\   /_/    \_\_| |_|_|\___/ \__, |_|\___|*
*                                                                              __/ |       *
*                                                                             |___/        *
*******************************************************************************************/

1st. Connect these pins in turn.
     (PS:Please do not connect wire while it is hooked to the electrical outlet!)
            |-----------------------------------|
            |FPGA       ST-Link/JLink..(via SWD)|
            | A7  ----->      TMS               |
            | A8  ----->      TCK               |
            | GND ----->      GND               |
            |-----------------------------------|
     
2nd. Connect the FPGA to computer via Type-C(USB).
     
3rd. Download M0demo.bit with JTAG mode.

4th. Open MDK project in ../M0/MDK

5th. Click Options for 
     Target -> Debug -> Use(ST-Link/JLink..) -> Setting
     Check whether CoreSight is correct

6th. Click rebuild

7th. Click Start/Stop Debug Session

8th. Set breakpoint and click run
     
9th. You will see diode state change on the development board

10th. Enjoy yourself!