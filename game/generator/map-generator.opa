// FIX LowLevelArray.init 

function init(n)(f){
//    open LowLevelArray
    if( n==0 ) LowLevelArray.empty else {
      v0 = f(0)
      a = LowLevelArray.create(n,v0)
      recursive function aux(i){
        if( i==n) a
        else {
     	  LowLevelArray.set(a,i,f(i))
          aux(i+1)
	}
      }
      aux(1)
    }
}

function game_state generate_map(int rowsize, int colsize){
        function remplitabrow(int row){
                 function remplitabcol(int col){
			println("{row}:{col}")
                          renseigneTile(row,col)
                          
                 }
                 init(colsize)(remplitabcol)
        }
        
       map = init(rowsize)(remplitabrow)
       game_state gamestateini = {destructibles:[],
                                  map:map,
                                  players:[],
                                  end_game:false}
                                  gamestateini
}

function tile renseigneTile(int row, int col){
         if (mod(row,2)==1 && mod(col,2)==1){
            {full}
         } else {
            {empty} 
         }
}

