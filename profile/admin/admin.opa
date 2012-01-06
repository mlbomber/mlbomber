

function profile(){
    //Resource.html("Change Pseudo",
    <fieldset>
        <legend>config player</legend>
            <input type="text" id="{IdChangePseudo.change_pseudo}" />
            <button type="button" onclick={function(_) { change_name() }}>Change pseudo</>
            {List.fold(create_img_box(_,_),image_list,<></>)} 
            <div id="{IdChangePseudo.test}"></div>
    </fieldset>
    }


function change_name(){
    name = Dom.get_value(#{IdChangePseudo.change_pseudo})
    score = 0
    function change_name(st){
        match(st){
            case {none}:some({~name,~score, image:get_image_random()})
            case {some:profile}:some({profile with ~name,~score})
        }
    }

    UserContext.change(change_name, players_UserContext)
    #{IdChangePseudo.test}="New Pseudo : {name}"
}

title = "toto"

Server.start(Server.http, [{resources: static_images},{~title, page:init_pseudo}] )

