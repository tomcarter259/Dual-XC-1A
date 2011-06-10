Dual XC-1A
==========

This project connects two XMOS XC-1A development boards together via 5-wire XMOS
links. The connection is tested via a simple demo.

Author
------

I'm [Tom Carter][me]. This project was adapted from an example of connecting two XMOS
XC-1 booads by Martin Young.

Walkthrough
===========

To Construct the XMOS Link
--------------------------

Connect your XMOS link cable between X3PortA on the first board and X3PortA on the
second. Note the cable must have a twist in it, so XLA0 1 on the first board is
connected to XLA0 1 on the second.

See page 9 of the [XC-1A Hardware Manual][manual] for I/O pin mapping.

To Build
--------

	build.bat

This must be run from the XMOS command prompt.

The script compiles the example program, splits it into parts and then creates 4 new
executables. 'boardA.xe' and 'boardB.xe' are first stage loaders for each board. They
establish the XMOS link. 'appA.xe' and 'appB.xe' contain the main program. Usually,
xgdb deals with loading and running these but we have to use seperate debugger
sessions and so it must be done manually.

To Run
------




[me]:http://www.tomcarter.org.uk
[manual]:https://www.xmos.com/download/public/XC-1A-Hardware-Manual(1).pdf
