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

See page 9 of the [XC-1A Hardware Manual][manual] (pdf) for I/O pin mapping.

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

Find the adapter IDs of both XMOS boards by running this command in an XMOS command
prompt, with both boards attached via USB:

	xrun -l

Start two xgdb sessions in seperate XMOS command prompts:

	xgdb boardA.xe

	xgdb boardB.xe

Connect one session to each XC-1A board:

	connect --adapter-id <adapterid>

Both first stage loaders must now be run within one second of each other. This is
because the XMOS links are muxed with ports and the ports have to be driven low on 
both sides before the links are enabled. The first stage loader drives the ports low 
waits 1 second then enables the ports. 

The easiest method is to type 'run' in each command prompt first, and then attempt to
press return in them both as fast as possible. 

If that works, halt both sessions (ctrl + c).

Select the appropriate executable in each command prompt:

	file appA.xe

	file appB.xe

Reconnect to the XMOS boards (make sure to use the same adapter ID!):

	connect --adapter-id <adapterid> --noreset

Load the program

	load

Finally, run them

	continue

If all has gone well, you will see output printed to the command prompt and button
lights illuminate on both boards.



[me]:http://www.tomcarter.org.uk
[manual]:https://www.xmos.com/download/public/XC-1A-Hardware-Manual(1).pdf
