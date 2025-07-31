class Monitor extends uvm_monitor;
  
  `uvm_component_utils(Monitor)
  
  Sequence_item item;
  
  virtual I2C_regfile_intf intf;
  
  uvm_analysis_port #(Sequence_item) monitor_ap;
  
  
  
  function new (string name = "Monitor", uvm_component parent);
    
    super.new(name,parent);
    monitor_ap = new("monitor_ap",this);
    
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
    
       @(posedge intf.clk);
       
       item.rst_n = intf.rst_n;
       item.wr_en = intf.wr_en;
       item.valid = intf.valid;
       item.addr  = intf.addr;
       item.wdata = intf.wdata;
       item.rdata = intf.rdata;
    
       monitor_ap.write(item);
       
    end
    
    
  endtask
  
  
  
  
  
  
endclass
