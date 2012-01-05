/* implement atomic section using session */
private
module Atomic {

  function session(){
    Session.make_callback{function (mess) 
      mess()
    }
  }
  
  session_section = session()
  section = Session.send(session_section,_)
  @expand function lsection(a){ Session.send(session_section,function (){a}) }

  function custom_section(s){
    Session.send(s,_)     
  }

  function new_section(){
    custom_section(session())
  }

}

/* implements ref with non blocking get and atomic update */
private
module AtomicMutable(initial_state){
  private ref = Reference.create(initial_state)
  function get(){Reference.get(ref)}
  function update(f){
    Atomic.section{ function()
      Reference.update(ref,f)
    }
  }
}

private
initial_state = 0 // dummy def

GameState = AtomicMutable(initial_state) 