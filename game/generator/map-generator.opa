function game_state generate_map(int rowsize, int colsize){
       map =  LowLevelArray.init(rowsize,LowLevelArray.init(colsize,renseigneTile(rowsize, colsize)))
       game_state gamestateini = {destructibles:{},
                                  map:map,
                                  players:{}}
                                  gamestateini
}

function tile renseigneTile(int row, int col){
         if (mod(row,2)==1 && mod(col,2)==1){
            {full}
         } else {
            {empty} 
         }
}

