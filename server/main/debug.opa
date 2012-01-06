function show_debug(){
  ser = OpaSerialize.String.serialize(GameState.get())
  xhtml =  <h1>Etat</h1>
           <div>{ser}</div>
  Resource.html("debug", xhtml)
}
