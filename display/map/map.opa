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
        x = array_foldi(game_state.map,<></>){function (row,row_array,acc)
              array_foldi(row_array,acc){function (col,tile,acc)
               (row, col) = generate_pixel_pos(row, col)
               acc = acc <+> <div class="empty" style="top:{col}px;left:{row}px"></div>
               class = match(tile)
                       {
                       case {full}: class_full
                       case {empty}: class_empty
                       }
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
        x
}

function  (int, int) generate_pixel_pos(int row, int col)
{
        pixel_row = row * 40
        pixel_col = col * 45
        (pixel_row, pixel_col)
}
