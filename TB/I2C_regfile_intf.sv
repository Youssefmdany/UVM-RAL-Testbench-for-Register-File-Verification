

interface I2C_regfile_intf #( parameter ADDR_WIDTH = 32,
                              parameter DATA_WIDTH = 8 ) (input bit clk);


   logic                        rst_n;
   logic                        wr_en;
   logic                        valid;
   logic[ADDR_WIDTH-1:0]        addr;
   logic[DATA_WIDTH-1:0]        wdata;
   logic[DATA_WIDTH-1:0]        rdata;



endinterface
