module I2C_RegFile #(parameter DATA_WIDTH = 8,
                     parameter ADDR_WIDTH = 32                                                                                   
 ) (
    
   input  reg                        clk,
   input  reg                        rst_n,
   input  reg                        wr_en,
   input  reg                        valid,
   input  reg[ADDR_WIDTH-1:0]        addr,
   input  reg[DATA_WIDTH-1:0]        wdata,
   output    [DATA_WIDTH-1:0]        rdata );
   
   
   
   
   
  reg[DATA_WIDTH-1:0]      CTRL ;
  reg[DATA_WIDTH-1:0]      DATA ;  
  reg[DATA_WIDTH-1:0]      FREQ ;
  reg[DATA_WIDTH-1:0]      S0_ADR ;  
  reg[DATA_WIDTH-1:0]      rdata_t  ;
   
   always @(posedge clk) begin
     
     
     if(!rst_n) begin
              CTRL   <= 0;
              DATA   <= 0;  
              FREQ   <= 0;
              S0_ADR <=0;
     end
     
     
     else if (wr_en && valid) begin
     
            if(addr == 32'hA000_B000)  CTRL    <= wdata;
       else if(addr == 32'hA000_B001)  DATA    <= wdata;  
       else if(addr == 32'hA000_B002)  FREQ    <= wdata;
       else if(addr == 32'hA000_B003)  S0_ADR  <= wdata;    
     
     end
     
 
      
     else if (!wr_en && valid) begin
     
            if(addr == 32'hA000_B000)  rdata_t <= CTRL; 
       else if(addr == 32'hA000_B001)  rdata_t <= DATA;     
       else if(addr == 32'hA000_B002)  rdata_t <= FREQ;   
       else if(addr == 32'hA000_B003)  rdata_t <= S0_ADR;           
     
     
     end
     
         
     
   end 
   
   


   assign rdata = rdata_t;
   

endmodule 
   
   
   
   
