
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

function get_image_random()
{
    length_image_list = List.length(image_list)
    index_img = Random.int(length_image_list)
    List.nth(index_img, image_list)?error("get_image") 
}
