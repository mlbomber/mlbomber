
/*==========Declaration des variables utiles pour la suite==========*/
/** Declaration UserContext **/
players_UserContext = UserContext.make(option(profile_player) none)
static_images = @static_resource_directory("resources/image_players")

/*Cree la liste d'image presente dans le dossier ou sont les images*/
list image_list = {
    Map.To.key_list(static_images)    
}

module IdChangePseudo {
    change_pseudo = Random.string(10)
    test = Random.string(10)
    class_img = "img" 
}

/*=================Fin declaration variable=========================*/


function image_style(id){
   all_image = Dom.select_class("img_click")
   Dom.iter(Dom.add_class(_,"img"), all_image)
   Dom.iter(Dom.remove_class(_,"img_click"), all_image)
   Dom.add_class(Dom.select_id(id),"img_click")
   Dom.remove_class(Dom.select_id(id),"img")
}
//change le nom d'un joueur et met un avatar auto 
//si il y a pas d'image deja choisi
function create_img_box(image,xhtml){

    function change_img(option profile_player){
        match (profile_player){
            case {none}:none
            case {some:profile_player}:some({profile_player with image:image})
        }
    }
    
    id=Random.string(10)
    function onclick(_ev){
        UserContext.change(change_img, players_UserContext)
        image_style(id)

    }
    xhtml <+> <div onclick={onclick}><a href="#" ><img id="{id}" class="{IdChangePseudo.class_img}" src="/{image}" /></a></div>
}


function get_image_random()
{
    length_image_list = List.length(image_list)
    index_img = Random.int(length_image_list)
    List.nth(index_img, image_list)?error("get_image") 
}
/*pour recuperer la valeur d'un usercontext
_."nomchanp" cree une fonction pour recup la valeur
de "nomchamp"*/
function unsafe_execute(f){
    function g(pu){
        f(pu ? error("Missing profile"))
    }
    UserContext.execute(g, players_UserContext)
}


function int get_score(){
    unsafe_execute(_.score)
}

function get_name(){
    unsafe_execute(_.name)
}

function get_image(){
    unsafe_execute(_.image)    
}


/*pour changer un Usercontext*/
function unsafe_change(f){
    function g(pu){
        some(f(pu ? error("Missing profile")))
    }
    UserContext.change(g, players_UserContext)
}

function set_score(int x){
    function set_score_to_u(profile_player pu){
        {pu with score:x}
    }
    unsafe_change(set_score_to_u)
}

function add_score(int x){
    function set_score_to_u(profile_player pu){
        {pu with score:pu.score + x}
    }
    unsafe_change(set_score_to_u)
}


