server function print_test(x){
	println("{x}")
}

function update_event(Dom.event event)
{
        x = event.key_code ? 0 
	match(x)
        {
                 case 39: send_p_action({right})
                 case 37: send_p_action({left})
                 case 38: send_p_action({up})
                 case 32: send_p_action({drop})
                 case 40: send_p_action({down})
                 case _: void
        }
}
        
function send(action action){	
	update_state(action)
}

function send_p_action(pa){
	id = get_name()
        action = {action:pa, ~id}
	send(action)
}

function send_add_player(game_player player){
	send( {game_player: player} ) 
}
