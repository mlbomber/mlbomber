/* Jeu */
function show_game(){
	Resource.html("BOMBER >> Play",
		<div id="main" onready={function(_ev){loop()}}>
		</div>
	)
}

function refresh(){
	#main = load_map(GameState.get())
}

function loop(){
	refresh()
	sleep(80,loop)
}

function do_404(){	
	Resource.html("BOMBER >> 404",
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


