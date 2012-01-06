/* Jeu */
function show_game(){
	Resource.html("BOMBER >> Play",
		<div id="main" onready={initialization}>
			<div id="map"/><div id="user"/>
		</div>
	)
}

function initialization(_ev){
	Dom.bind_with_options(Dom.select_document(), {keydown}, update_event, [{prevent_default}])
	send_add_player(
		{id:get_name(), dead:false, row:0, col:0, bomb:none}
	)
	#map = <>{load_map(GameState.get())}</>
	loop()
}

function refresh(){
	#user = <>{load_player(GameState.get())}</>
}

function loop(){
	refresh()
	sleep(100,loop)
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
    		case { path : [_|_], ... }: do_404()
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


