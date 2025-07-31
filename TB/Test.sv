class Test extends uvm_test;
  
  `uvm_component_utils(Test)
  
  
  Environment     environment;
  Reg_Sequence    reg_sequence;
  
  
  
  
  
  function new (string name = "Test", uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  
  
  
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    environment   = Environment::type_id::create("environment", this);
    reg_sequence  = Reg_Sequence::type_id::create("reg_sequence"); 
    
  endfunction
  
  
  
  
  
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    
  endfunction
  
  
  
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
    phase.raise_objection(this);

       reg_sequence.Reg_block_h = environment.reg_block ;
    
      #20

      `uvm_info(get_type_name(),"################### Start of Reg Sequence  ###################",UVM_LOW)
       reg_sequence.start(environment.agent.sequencer);
      
    phase.drop_objection(this);
    
    phase.phase_done.set_drain_time(this,100);
    
    
  endtask
  
  
  
  
  
  function void report_phase (uvm_phase phase);
    
    uvm_report_server  server;
    
    super.report_phase(phase);
    
    server = uvm_report_server::get_server();
    
    
    if(server.get_severity_count(UVM_ERROR)+server.get_severity_count(UVM_FATAL) > 0 ) begin
      
     `uvm_info(get_type_name(), "################### TEST FAILED ###################", UVM_LOW)    
      
    end
    
    else begin
      
    `uvm_info(get_type_name(), "################### TEST PASSED ###################", UVM_LOW)      
    
    end
    
    
    
  endfunction
  
  
  
endclass
