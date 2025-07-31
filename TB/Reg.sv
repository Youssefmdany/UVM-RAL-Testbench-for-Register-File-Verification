
class CTRL_R extends uvm_reg;
  
  `uvm_object_utils(CTRL_R)
  
  rand uvm_reg_field CR0; 
  rand uvm_reg_field CR1; 
  rand uvm_reg_field AA; 
  rand uvm_reg_field SI; 
  rand uvm_reg_field STO; 
  rand uvm_reg_field STA; 
  rand uvm_reg_field ENS1; 
  rand uvm_reg_field CR2; 
  
  
 function new (string name ="CTRL_R");
    
    super.new(name,8,UVM_NO_COVERAGE);
    
 endfunction
  
  
 function void build;
    
  CR0   = uvm_reg_field::type_id::create("CR0"); 
  CR1   = uvm_reg_field::type_id::create("CR1"); 
  AA    = uvm_reg_field::type_id::create("AA"); 
  SI    = uvm_reg_field::type_id::create("SI"); 
  STO   = uvm_reg_field::type_id::create("STO"); 
  STA   = uvm_reg_field::type_id::create("STA"); 
  ENS1  = uvm_reg_field::type_id::create("ENS1"); 
  CR2   = uvm_reg_field::type_id::create("CR2");     
  
  
    CR0.configure(
      .parent(this), .size(1), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    
    CR1.configure(
      .parent(this), .size(1), .lsb_pos(1),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );

    AA.configure(
      .parent(this), .size(1), .lsb_pos(2),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    
    SI.configure(
      .parent(this), .size(1), .lsb_pos(3),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    
    STO.configure(
      .parent(this), .size(1), .lsb_pos(4),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    
     STA.configure(
      .parent(this), .size(1), .lsb_pos(5),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
        
     ENS1.configure(
      .parent(this), .size(1), .lsb_pos(6),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    
     CR2.configure(
      .parent(this), .size(1), .lsb_pos(7),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
        
        
 endfunction
  
  
endclass







class DATA_R extends uvm_reg;
  
 `uvm_object_utils(DATA_R) 
 
 rand uvm_reg_field SD;
 
  
  function new (string name = "DATA_R");
    
    super.new(name,8,UVM_NO_COVERAGE);
    
  endfunction
  
  
  
  function void build;
      

    SD   = uvm_reg_field::type_id::create("SD");  

    SD.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(1), .individually_accessible(1)
    );

    
  endfunction
  
  
endclass






class S0_ADR_R extends uvm_reg;
  
 `uvm_object_utils(S0_ADR_R) 

 rand uvm_reg_field GC;  
 rand uvm_reg_field ADR;

  
  function new (string name = "S0_ADR_R");
    
    super.new(name,8,UVM_NO_COVERAGE);
    
  endfunction
  
  
  
  function void build;
    

    GC    = uvm_reg_field::type_id::create("GC");  
    ADR   = uvm_reg_field::type_id::create("ADR");  

    GC.configure(
      .parent(this), .size(1), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(1), .individually_accessible(1)
    );

    ADR.configure(
      .parent(this), .size(7), .lsb_pos(1),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(1), .individually_accessible(1)
    );
    
    
  endfunction
  
  
endclass









class FREQ_R extends uvm_reg;
  
 `uvm_object_utils(FREQ_R) 


 rand uvm_reg_field Frequency;  

  
  function new (string name = "FREQ_R");
    
    super.new(name,8,UVM_NO_COVERAGE);
    
  endfunction
  
  
  
  function void build;

    Frequency    = uvm_reg_field::type_id::create("Frequency");  
    
    Frequency.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(1), .individually_accessible(1)
    );

    
  endfunction
  
  
endclass