/*==========Declaration des variables utiles pour la suite==========*/
/** Declaration UserContext **/
players_UserContext = UserContext.make(option(profile_player) none)
static_images = @static_resource_directory("resources/image_players")

/*Cree la liste d'image presente dans le dossier ou sont les images*/
list image_list = {
    Map.To.key_list(static_images)    
}

module IdChangePseudo {
    change_pseudo = Random.string(5)
    test = Random.string(5)
}

/*=================Fin declaration variable=========================*/


//change le nom d'un joueur et met un avatar auto 
//si il y a pas d'image deja choisi
function create_img_box(image,xhtml){

    function change_img(option profile_player){
        match (profile_player){
            case {none}:none
            case {some:profile_player}:some({profile_player with image:image})
        }
    }
    
    function onclick(_ev){
        UserContext.change(change_img, players_UserContext)
    }
    xhtml <+> <div onclick={onclick}><img src="/{image}" />{image}</div>
}


function init_pseudo(){
    //Resource.html("Change Pseudo",
    <fieldset>
        <legend>config player</legend>
            <input type="text" id="{IdChangePseudo.change_pseudo}" />
            <button type="button" onclick={function(_) { change_name() }}>Change pseudo</>
            {List.fold(create_img_box(_,_),image_list,<></>)} 
            <div id="{IdChangePseudo.test}"></div>
    </fieldset>
    }

function get_image_random()
{
    length_image_list = List.length(image_list)
    index_img = Random.int(length_image_list)
    List.nth(index_img, image_list)?error("get_image") 
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

