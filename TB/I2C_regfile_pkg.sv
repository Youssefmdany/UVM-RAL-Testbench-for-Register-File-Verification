package I2C_regfile_pkg;


parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 32;


import uvm_pkg::*;

`include "uvm_macros.svh"

`include "Sequence_item.sv"
`include "Reg.sv"
`include "Reg_block.sv"
`include "Adapter.sv"
`include "Reg_Sequence.sv"
`include "Sequencer.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Agent.sv"
`include "Environment.sv"
`include "Test.sv"




endpackage
