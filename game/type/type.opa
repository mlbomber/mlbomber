/* Types de jeu du bomberman */

// Joueur ingame
type game_player = {
	// id du joueur
	string id,
	// vrai si le joueur est mort
	bool dead,
	// position
	int row,
	int col,
	option(bomb) bomb
}

// Bombe
type bomb = {
	// position
	int row,
	int col,
	// portée de la bombe
	int range,
	// compte à rebours
	int timelaps
}

// Case du jeu
type tile = {empty} or {full}

// Action communiquée
type action = {player_action action, string id} or {bombtick}

// Action du joueur (déplacement ou placement de bombe)
type player_action = {up} or {down} or {left} or {right} or {drop}

// profil du joueur
type profile_player = {
	string name,
	string image,
	int score
}
