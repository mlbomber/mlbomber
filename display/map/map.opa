/*SHOW FIXED MAP GENERATE ONE TIME*/
class_full = "full"
class_empty = "empty"
/*TOP-LEVEL*/
function load_map(game_state game_state)
{
        x = LowLevelArray.foldi(_,game_state.map,<></>){function (row,col_array,acc)
            LowLevelArray.foldi(_,col_array,acc){function (col,tile,acc)
               class = match(tile)
                       {
                       case {full}: class_full
                       case {empty}: class_empty
                       }
               (row, col) = generate_pixel_pos(row, col)
               acc <+> <div class={class} style="top:{col};left:{row}"></div>
            }
        }

        x = List.fold(_,game_state.destructibles, x){function (d, acc)
            if(d.destructed)
            {
                (row, col) = generate_pixel_pos(d.row, d.col)
                acc <+>  <div class="destructible" style="top:{col};left:{row}"></div>
            }
        }
        x
}

function  (int, int) generate_pixel_pos(int row, int col)
{
        pixel_row = row * 45
        pixel_col = col * 40
        (pixel_row, pixel_col)
}
