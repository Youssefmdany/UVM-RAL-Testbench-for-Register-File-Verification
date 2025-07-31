class Sequence_item extends uvm_sequence_item;
  

 logic                             rst_n;
 rand logic                        wr_en;
 rand logic                        valid;
 rand logic[ADDR_WIDTH-1:0]        addr;
 rand logic[DATA_WIDTH-1:0]        wdata;
 logic[DATA_WIDTH-1:0]             rdata;
  
   `uvm_object_utils_begin(Sequence_item)
    `uvm_field_int(wr_en,UVM_ALL_ON)  
    `uvm_field_int(wdata,UVM_ALL_ON) 
    `uvm_field_int(addr,UVM_ALL_ON) 
    `uvm_field_int(rst_n,UVM_ALL_ON) 
  `uvm_object_utils_end
   
  
  constraint trans_con {
  
     addr inside {32'hA000_B003,32'hA000_B002,32'hA000_B001,32'hA000_B000}; 
  }
  
endclass 
