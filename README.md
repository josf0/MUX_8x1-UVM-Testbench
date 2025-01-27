<h1>UVM Testbench for 8x1 Multiplexer</h1>

<h2>Overview</h2>
This is a simple testbench I've created for an 8x1 MUX RTL design.

<h2>UVM Architecture</h2>
The TB architecture consists of the test > env > wr_agent > rd_agent > scoreboard.
The write agent is active as it needs to drive the values to the DUT but the read agent is passive as it needs to only monitor the output from the DUT.

To simulate the test I've include make targets, you can refer the Makefile or run `make help` to list out the available make targets.
