extends Node

const MAX_POWER : float = 100.0
const START_POS := Vector2(1152, 389.1)
var avatar_poopy: Texture = load("res://assets/poopy.png")
var avatar_rick: Texture = load("res://assets/rick.png")
var avatar_morty: Texture = load("res://assets/morty.png")
var avatar_squanchy: Texture = load("res://assets/squanchy.png")
var team_a_score : int = 0
var team_b_score : int = 0
var Aplayer1_name : String = "Aplayer1"
var Aplayer2_name : String = "Aplayer2"
var Bplayer1_name : String = "Bplayer1"
var Bplayer2_name : String = "Bplayer2"
var	Aplayer1_avatar = avatar_rick
var	Aplayer2_avatar = avatar_morty
var	Bplayer1_avatar = avatar_squanchy
var	Bplayer2_avatar = avatar_poopy
var players : Array = [{"avatar": Aplayer1_avatar, "name": Aplayer1_name, "score": 0},{"avatar": Aplayer2_avatar, "name": Aplayer2_name, "score": 0},
				{"avatar": Bplayer1_avatar, "name": Bplayer1_name, "score": 0},{"avatar": Bplayer2_avatar, "name": Bplayer2_name, "score": 0}]
var turn_order = [
	{"team": "A", "name": Aplayer1_name},
	{"team": "B", "name": Bplayer1_name},
	{"team": "A", "name": Aplayer2_name},
	{"team": "B", "name": Bplayer2_name}]
var current_turn_index: int = 0
