class Sequencer extends uvm_sequencer #(Sequence_item);
  
  `uvm_component_utils(Sequencer)
  
  
  
  function new(string name = "Sequencer" , uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  
  
  
endclass
