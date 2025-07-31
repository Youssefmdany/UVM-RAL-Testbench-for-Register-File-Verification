
class Reg_block extends uvm_reg_block;
  
  `uvm_object_utils(Reg_block)
  
  rand CTRL_R    CTRL_R_h;
  rand DATA_R    DATA_R_h;
  rand S0_ADR_R  S0_ADR_R_h;
  rand FREQ_R    FREQ_R_h;
  
  
  function new(string name = "Reg_block");
    
    super.new(name,build_coverage(UVM_NO_COVERAGE));
    
  endfunction
  
  
  
  function void build();
    
    CTRL_R_h = CTRL_R::type_id::create("CTRL_R_h");
    CTRL_R_h.build();
    CTRL_R_h.configure(this);

    DATA_R_h = DATA_R::type_id::create("DATA_R_h");
    DATA_R_h.build();
    DATA_R_h.configure(this);
    
    S0_ADR_R_h = S0_ADR_R::type_id::create("S0_ADR_R_h");
    S0_ADR_R_h.build();
    S0_ADR_R_h.configure(this);
        
    FREQ_R_h = FREQ_R::type_id::create("FREQ_R_h");
    FREQ_R_h.build();
    FREQ_R_h.configure(this);
    
    
    default_map = create_map("I2C_Regs_Map",32'h0,1,UVM_LITTLE_ENDIAN,1);
    default_map.add_reg(CTRL_R_h,32'hA000_B000,"RW");
    default_map.add_reg(DATA_R_h,32'hA000_B001,"RW");
    default_map.add_reg(S0_ADR_R_h,32'hA000_B002,"RW");
    default_map.add_reg(FREQ_R_h,32'hA000_B003,"RW");
    
    lock_model();
    
  endfunction
  
  
  
endclass
