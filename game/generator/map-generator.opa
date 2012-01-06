function game_state generate_map(int rowsize, int colsize){
        function remplitabrow(int row){
                 function remplitabcol(int col){
                          renseigneTile(row,col)
                          
                 }
                 LowLevelArray.init(colsize)(remplitabcol)
        }
        
       map =  LowLevelArray.init(rowsize)(remplitabrow)
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

