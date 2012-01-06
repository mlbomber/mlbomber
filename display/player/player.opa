/*SHOW FIXED MAP GENERATE ONE TIME*/
function lmap(l)(f){List.map(f,l)}

/*TOP-LEVEL*/
function load_player(game_state game_state)
{
        x = lmap(game_state.players){function (p)
            (row, col) = generate_pixel_pos(p.row, p.col)
            <div style="top:{col}px;left:{row}px"><div class="player"/></div>
        }
        x
}
