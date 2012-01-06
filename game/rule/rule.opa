

function list(game_player) bombtickPlayers(list(game_player) players){
         List.map(bombtickPlayer,players)
         List.map(killplayer(_,players),players)
      
}

function game_player bombtickPlayer(game_player player){
         match(player.bomb){
                case {none} : player
                case {some:bomb} : {player with bomb:{some:bombtick(bomb)}}
         }

}

function bomb bombtick(bomb bomb){
         newtimelaps = bomb.timelaps - 1
         {bomb with timelaps:newtimelaps}
}

function game_player killplayer(game_player player, list(game_player) players){
         List.fold(bomboptionkillplayer,players,player)
}

function game_player bomboptionkillplayer(game_player playerbomb, game_player player){
         match(playerbomb.bomb){
                  case {none} : player
                  case {some:bomb} : bombkillplayer(bomb, player)
         }

}

function game_player bombkillplayer(bomb bomb, game_player player){
         if(bomb.timelaps==0){
                if (player.row==bomb.row){
                   portesup = bomb.row + bomb.range
                   portemin = bomb.row - bomb.range
                   if (player.row <= portesup && player.row >= portemin){
                      {player with dead:true}
                   } else player
                } else {
                  if(player.col==bomb.col){
                      portesup = bomb.col + bomb.range
                      portemin = bomb.col - bomb.range
                      if (player.col <= portesup && player.col >= portemin){
                         {player with dead:true}
                      } else player  
                  } else player
                }
         } else  player
}
