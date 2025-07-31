class Reg_Sequence extends uvm_sequence #(Sequence_item);
  
  `uvm_object_utils(Reg_Sequence)
  
  Reg_block          Reg_block_h;
  Sequence_item      Sequence_item_h;
  
  
  
  function new(string name = "Reg_Sequence"); 
    
    super.new(name);
    
  endfunction
  
  
  
  
  
  task body();
    
    uvm_reg_data_t    data;
    uvm_status_e      status;
    bit[7:0]          rdata_t;
    
    Sequence_item_h = Sequence_item::type_id::create("Sequence_item_h");
    //Reg_block_h     = Reg_block::type_id::create("Reg_block_h");
    
   repeat(10) begin

   
    assert(Sequence_item_h.randomize());
    Reg_block_h.CTRL_R_h.write( status, Sequence_item_h.wdata );

    assert(Sequence_item_h.randomize());
    Reg_block_h.DATA_R_h.write( status, Sequence_item_h.wdata );
 
    assert(Sequence_item_h.randomize());
    Reg_block_h.S0_ADR_R_h.write( status, Sequence_item_h.wdata );
 
    assert(Sequence_item_h.randomize());
    Reg_block_h.FREQ_R_h.write( status, Sequence_item_h.wdata );


    Reg_block_h.CTRL_R_h.read ( status, rdata_t );
    
    `uvm_info(get_type_name(),$sformatf("The read data from CTRL_R_h reg  = %h ",rdata_t),UVM_LOW)

    Reg_block_h.DATA_R_h.read ( status, rdata_t );
    
    `uvm_info(get_type_name(),$sformatf("The read data from DATA_R_h reg  = %h ",rdata_t),UVM_LOW)
    
     Reg_block_h.S0_ADR_R_h.read ( status, rdata_t );
    
    `uvm_info(get_type_name(),$sformatf("The read data from S0_ADR_R_h reg  = %h ",rdata_t),UVM_LOW)
    

    Reg_block_h.FREQ_R_h.read ( status, rdata_t );

    `uvm_info(get_type_name(),$sformatf("The read data from FREQ_R_h reg  = %h ",rdata_t),UVM_LOW)
  
  end    
    
  endtask
  
endclass
