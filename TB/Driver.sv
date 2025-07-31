
class Driver extends uvm_driver #(Sequence_item);
  
  `uvm_component_utils(Driver)
  
  virtual I2C_regfile_intf intf;
  
  Sequence_item item;
  
  
  
  function new (string name = "Driver" , uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  
  
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    if(!uvm_config_db #(virtual I2C_regfile_intf)::get(null,"*","intf",intf))
      `uvm_error(get_type_name(),"Getting the virtual interface didn't succeed")
    
  endfunction
  
  
  
  
  function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
  endfunction
  
  
  
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    forever begin
      
       item = Sequence_item::type_id::create("item");
    
       seq_item_port.get_next_item(item);
    
       drive(item);
    
       seq_item_port.item_done();
       
    end
    
    
  endtask
  
  
  
  
  
  task drive(Sequence_item item);
    
    
    @(posedge intf.clk);
    
    intf.rst_n = item.rst_n;
    intf.wr_en = item.wr_en;
    intf.valid = item.valid;
    intf.addr  = item.addr;
    intf.wdata = item.wdata;

    
  endtask
  
  
  
endclass