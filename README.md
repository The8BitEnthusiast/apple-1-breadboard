# Apple 1 Computer on Breadboard

![Splash](https://github.com/The8BitEnthusiast/apple-1-breadboard/blob/main/images/main.png?raw=true)

This is an implementation of the Apple 1 computer on breadboard with the help of FPGA to support video display and PS/2 to ASCII keyboard conversion.

## Design Overview

This project builds upon Ben Eater's [6502 computer project](https://eater.net/6502). The base configuration of the WDC 65C02 microprocessor, 62256 RAM chip and 28C256 EEPROM is the same. Modifications made to the design to bring it into full compatibility with the Apple 1 are as follows:

- An FPGA is used to emulate the Apple 1 Video Terminal circuit and also to allow the use of a standard PS/2 keyboard by converting the PS/2 protocol to the ASCII signals expected by the Apple 1. The Video Terminal is the result of another project of mine, the details of which can be found [here](https://github.com/The8BitEnthusiast/apple-1-video-terminal-on-fpga).
- The 65C22 VIA IC is replaced with the 65C21 PIA, which is a drop-in replacement for the original PIA used on the Apple 1.

The top level schematic of this design is shown below. The KiCAD files are available in the schematics folder of this project.

![Top Schematic](https://github.com/The8BitEnthusiast/apple-1-breadboard/blob/main/images/apple-1-top-schematic.png?raw=true)
