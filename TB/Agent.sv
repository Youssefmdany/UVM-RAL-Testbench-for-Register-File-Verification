class Agent extends uvm_agent;
  
  `uvm_component_utils(Agent)
  
   Driver      driver;
   Monitor     monitor;
   Sequencer   sequencer;
   
  
  function new (string name = "Agent", uvm_component parent);
  
     super.new(name,parent);
  
  endfunction
  
  
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    driver      = Driver::type_id::create("driver",this);
    monitor     = Monitor::type_id::create("monitor",this);
    sequencer   = Sequencer::type_id::create("sequencer",this);
    
  endfunction
  
  
  
  function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
    driver.seq_item_port.connect(sequencer.seq_item_export);
    
  endfunction
  
  
  
  task run_phase(uvm_phase phase);

    super.run_phase(phase);

  endtask
  
  
endclass
