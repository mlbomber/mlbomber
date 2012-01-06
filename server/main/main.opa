/* Jeu */
function show_game(){
	Ressource.html("BOMBER",
		<div>carte</div>
	)
}

function do_404(){	
	Ressource.html("BOMBER >> 404",
		<div>Cette page n'existe pas.</div>
	)
}


/* Server */
// Navigation
function start(uri){
    	match (uri) {
    		case { path : [], ... }: profile()
    		case { path : ["game"|_], ... }: show_game()
    		case { path : ["debug"|_], ... }: show_debug()	
    		case { path : [_], ... }: do_404()
	}
}

// Serveur
Server.start(
        Server.http,
        {
                [ {resources: @static_resource_directory("resources")},
                        {register: ["resources/style/css.css"]},
                        {dispatch:start}
                ]
        }
)

title = "MLBomber"


