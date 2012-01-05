

/* implement atomic section using session */
private
module Atomic {

  function session(){
    Session.make_callback{function (mess) 
      mess()
    }
  }
  
  session_section = session()
  section = Session.send(session_section,_)
  @expand function lsection(a){ Session.send(session_section,function (){a}) }

  function custom_section(s){
    Session.send(s,_)     
  }

  function new_section(){
    custom_section(session())
  }

}

/* implements ref with non blocking get and atomic update */
private
module AtomicMutable(initial_state){
  private ref = Reference.create(initial_state)
  function get(){Reference.get(ref)}
  function update(f){
    Atomic.section{ function()
      Reference.update(ref,f)
    }
  }
}

private
initial_state = 0 // dummy def

GameState = AtomicMutable(initial_state) 




// Calcule un nouvel état du jeu
server function game_state do_action(game_state state, action action){
	match(action){
		// Mise à jour des tick des bombes
		case({bombtick}): {state with players = bombtickPlayers(state.players)}
		// Prise en compte des action des joueurs
		case({player_action p_action, string id}): {
			// Récupération de la liste des playeris modifiée
			players = List.map(_,state.players)(function(player){
				// Si le joueur accomplit l'action et n'est pas mort, on le modifie
				if(player.id==id && player.dead == false){
					// Exécution de l'action
					player = match(p_action){
						// Largage de bombe
						case {drop}: drop_bomb(player)
						// Déplacement
                                                case _: 
					}
				}
				// Sinon on le renvoie
				else player
			})
		}
	}
}

// Largue une bombe à l'emplacement du joueur
function game_player drop_bomb(game_player player){
	// Si le joueur a une bombe
	if(player.bomb==none){
		// Génération d'une bombe sur le plateau aux coordonnées du joueur
		player with bomb = some({ row:player.row, col:player.col, range:3, timelaps:5 })
	}
	
}

// Gère le déplacement du joueur en fonction de la irection choisie
function game_player move_player(player_action action, game_player player, game_state state){
	// Selon le type de déplacement
	match(action){
		case {up}: move(-1, 0, player, state)
		case {down}: move(1, 0, player, state)
		case {right}: move(0, 1, player, state)
		case {down}: move(0, -1, player, state)
	}
}

// Définition d'un raccourci pour récupérer le i-eme élément d'un tableau
`@`(t,i){LowLevelArray.get(t,i)}

// Déplace le joueur en gérant les collisions
function game_player move(int d_row, int d_col, game_player player, game_state state)
{
	p_row = player.row
	p_col = player.col
	// Si le joueur est sur un bord de la map et ne peut pas se déplacer
	if( (p_row+d_row < 0 || p_row+d_row > LowLevelArray.length(state.map)-1 
		|| p_col+d_col < 0 || p_col+d_col > LowLevelArray.length(map@0)-1)
	// ou si la case est occupée par un bloc infranchissable
	|| check_non_passable(p_row+d_row, p_col+d_col, state) 
	// ou si la case est occupée par un bloc destructible non-detruit
	|| check_non_destructed(p_row+d_row, p_col+d_col, state))
		// renvoyer le joueur non modifié
		player 
	// sinon, déplacer le joueur
	else {player with row = p_row+d_row, col = p_col+d_col }
}

function bool check_non_passable(int row, int col, game_state state)
{
	match((state.map@row)@col){
		case {full} : true
		case _: false
	}
}

function bool check_non_destructed(int row, int col, game_state state)
{
	List.exist( function(elmt){ (elmt.row == row && elmt.col==col && elmt.destructed==false ) }, state.destructibles )
}

// Met à jour l'état du jeu mutable
server function update_state(action action){
	GameState.update( do_action(_,action) )	
}
