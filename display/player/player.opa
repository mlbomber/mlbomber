/*SHOW FIXED MAP GENERATE ONE TIME*/
function lmap(l)(f){List.map(f,l)}

/*TOP-LEVEL*/
function load_player(game_state game_state)
{
        x = lmap(game_state.players){function (p)
            (row, col) = generate_pixel_pos(p.row, p.col)
            <div class="bomb" style="top:{col}px;left:{row}px"></div>
        }
        x
}

function  (int, int) generate_pixel_pos(int row, int col)
{
        pixel_row = row * 45
        pixel_col = col * 40
        (pixel_row, pixel_col)
}
