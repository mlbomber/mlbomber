function update_event(Dom.event event)
{
        x = Int.to_string(event.key_code ? 0)
        
        function send(pa)
        {
                 id = get_name()
                 action = {action:pa, id}
                 update_state(action)
        }

        match(x)
        {
                 case 39: send({right})
                 case 37: send({left})
                 case 38: send({up})
                 case 32: send({drop})
                 case 40: send({down})
                 case _: void
        }
}
