class Environment extends uvm_env;
  
  `uvm_component_utils(Environment)
  
   Agent      agent;
   Adapter    adapter;
   Reg_block  reg_block;
   
  
  function new (string name = "Environment", uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  
  
  
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    agent      = Agent::type_id::create("agent",this);
    adapter    = Adapter::type_id::create("adapter",this);
    reg_block  = Reg_block::type_id::create("reg_block",this);
    reg_block.build();
    
  endfunction
  
  
  
  function void connect_phase(uvm_phase phase);

    super.connect_phase(phase);
    
    reg_block.default_map.set_sequencer(.sequencer(agent.sequencer), .adapter(adapter) );
    reg_block.default_map.set_base_addr(32'h0);
    
    
  endfunction



  task run_phase(uvm_phase phase);

     super.run_phase(phase);

  endtask


  
  
endclass 
