
class Adapter extends uvm_reg_adapter;
  
  `uvm_object_utils(Adapter)
  
  
  
  
function new (string name = "Adapter");
  
  super.new(name);
  
endfunction




function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
  
  Sequence_item item = Sequence_item::type_id::create("item");
  
  item.wr_en = (rw.kind == UVM_WRITE);
  item.addr  = rw.addr;
  
  if(item.wr_en) item.wdata = rw.data;
    
  item.valid = 1;
  item.rst_n = 1;
  return item;
  
endfunction  
  
 
 
 function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
 
   Sequence_item item = Sequence_item::type_id::create("item");
   
   assert( $cast( item, bus_item ) )
   else  `uvm_fatal("Adapter","casting didn't succeed")
 
   rw.kind   = item.wr_en ? UVM_WRITE : UVM_READ;
   rw.addr   = item.addr;
   rw.data   = item.rdata;
   rw.status = UVM_IS_OK;
   
 endfunction 
  
  
  
endclass
