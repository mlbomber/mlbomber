/*SHOW FIXED MAP GENERATE ONE TIME*/
class_full = "full"
class_empty = "empty"
/*TOP-LEVEL*/
function array_foldi(cont,acc)(f){
   LowLevelArray.foldi(f,cont,acc)
}
function list_fold(cont,acc)(f){
   List.fold(f,cont,acc)
}

function load_map(game_state game_state)
{
        acc = acc <+> <div class="empty" style="top:{col}px;left:{row}px"></div>
        x = array_foldi(game_state.map,<></>){function (row,row_array,acc)
              array_foldi(row_array,acc){function (col,tile,acc)
               class = match(tile)
                       {
                       case {full}: class_full
                       case {empty}: class_empty
                       }
               (row, col) = generate_pixel_pos(row, col)
               acc <+> <div class="{class}" style="top:{col}px;left:{row}px"></div>
            }
        }

        x = list_fold(game_state.destructibles, x){function (d, acc)
            if(d.destructed)
            {
                (row, col) = generate_pixel_pos(d.row, d.col)
                acc <+>  <div class="destructible" style="top:{col}px;left:{row}px"></div>
            } else acc
        }

        x = list_fold(game_state.players, x){function (gameplayer, acc)
            match(gameplayer.bomb){
                case {none}:acc
                case {some:bomb}:accBomb(bomb,acc)
            }
        }
        x
}

function accBomb(bomb b,acc){
         (row, col) = generate_pixel_pos(b.row, b.col)
         if (b.timelaps<=0){
            acc <+>  <div class="explode" style="top:{col}px;left:{row}px"></div>
         }else{
            acc <+>  <div class="bomb" style="top:{col}px;left:{row}px"></div>
         }
}


function  (int, int) generate_pixel_pos(int row, int col)
{
        pixel_row = row * 40
        pixel_col = col * 45
        (pixel_row, pixel_col)
}
