## 使用方法 Usage  
[Click here for English version](#usage)  

1. 按如下顺序将 FPGA 与兼容 SWD 的调试器相连 (请在断电状态操作)  
  ```
  FPGA               兼容 SWD 的调试器
  3.3           ---- TVCC/VCC/3.3V
  A7 (SWDIOTMS) ---- TMS
  A8 (SWCLKTCK) ---- TCK
  GND           ---- GND
  ```
  （如果你使用的是其他开发板，可能需要修改引脚约束文件将顶层模块 `M0demo.v` 中的 `SWDIOTMS` 与 `SWCLKTCK` 分配至另外可用的端口，然后再将自己分配的端口与调试器的对应端口相连）  
  
2. 在 4.6 版本的 TD 工具中综合项目，将 `M0demo.bit` 烧录给开发板（本项目文件可在 4.6 版本的 TD 下正常使用，若使用其他版本，可能需要修改部分文件）  
3. 用 MDK 打开 `../M0/MDK` 中的项目  
4. 在 MDK 中点击 `Options for Target... -> Debug -> Use(ST-Link/JLink...) -> Settings`，检查能否通过 SWD 检测到正确的内核  
5. `rebuild` 项目  
6. 点击 `Start/Stop Debug Session`，设置断点，开始运行，即可观察到 LED 在代码的控制下开始闪烁了  

### Usage  
<pre>
/*******************************************************************************************
**************************"Hello Cortex-M0" run on the Anlogic FPGA*************************
*******************************************************************************************/
/*
Date:20191118
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
            | 3.3 ----->      TVCC/VCC(Pin1)    |
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
     
9th. You will see diode state changing on the development board

10th. Enjoy yourself!
</pre>
