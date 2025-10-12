extends Node

const MAX_POWER : float = 90.0
const START_POS := Vector2(896, 320.25)
var avatar_rick: Texture = load("res://assets/avatars/rick.png")
var avatar_morty: Texture = load("res://assets/avatars/morty.png")
var avatar_summer: Texture = load("res://assets/avatars/summer.png")
var avatar_rockrick: Texture = load("res://assets/avatars/rockRick.png")
var avatar_spacebess: Texture = load("res://assets/avatars/spaceBess.png")
var avatar_spacemorty: Texture = load("res://assets/avatars/spaceMorty.png")
var team_a_score : int = 0
var team_b_score : int = 0
var Aplayer1_name : String = "Aplayer1"
var Aplayer2_name : String = "Aplayer2"
var Bplayer1_name : String = "Bplayer1"
var Bplayer2_name : String = "Bplayer2"
var Aplayer1_avatar = avatar_rick
var Aplayer2_avatar = avatar_morty
var Bplayer1_avatar = avatar_spacebess
var Bplayer2_avatar = avatar_rockrick
var players : Array = [{"team": "Blue", "avatar": Aplayer1_avatar, "name": Aplayer1_name, "score": 0},{"team": "Blue", "avatar": Aplayer2_avatar, "name": Aplayer2_name, "score": 0},
				{"team": "Red", "avatar": Bplayer1_avatar, "name": Bplayer1_name, "score": 0},{"team": "Red", "avatar": Bplayer2_avatar, "name": Bplayer2_name, "score": 0}]
var turn_order = [
	{"team": "Blue", "name": Aplayer1_name, "turns": 1},
	{"team": "Red", "name": Bplayer1_name, "turns": 1},
	{"team": "Blue", "name": Aplayer2_name, "turns": 1},
	{"team": "Red", "name": Bplayer2_name, "turns": 1}]
var current_turn_index: int
var game_over : bool = false
