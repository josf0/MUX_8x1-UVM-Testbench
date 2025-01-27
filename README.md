<h1>UVM Testbench for 8x1 Multiplexer</h1>

<h2>Overview</h2>
This is a simple testbench I've created for an 8x1 MUX RTL design.

<h2>UVM Architecture</h2>
<img src="images/uvm_tb.png">
The architecture consists of two agents. The write agent is active as it needs to drive data into the DUV while the read agent is passive as it only needs to monitor outputs from the DUV.
