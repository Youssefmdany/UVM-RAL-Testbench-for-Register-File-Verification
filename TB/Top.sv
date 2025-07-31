import uvm_pkg::*;


`include "I2C_regfile_intf.sv"

import I2C_regfile_pkg::*;


module Top;



bit clk;


I2C_regfile_intf intf(.clk(clk));

I2C_RegFile #(  .ADDR_WIDTH(32),
                .DATA_WIDTH(8)


              ) I2C_regfile ( 
                          
                .clk(intf.clk),
                .rst_n(intf.rst_n),
                .wr_en(intf.wr_en),                          
                .valid(intf.valid),                 
                .addr(intf.addr),
                .wdata(intf.wdata),
                .rdata(intf.rdata)          
                          
);




initial begin
  
  intf.rst_n = 0;
  #10
  intf.rst_n = 1;
  
  forever #10 clk=~clk;
  
end







initial begin
  

  #5000
  
  $finish();
  
end






initial begin
  
uvm_config_db #(virtual I2C_regfile_intf)::set(null,"*","intf",intf);

run_test("Test");


 
end



endmodule
