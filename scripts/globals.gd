extends Node

const MAX_POWER : float = 120.0
const START_POS := Vector2(1152, 389.1)
var team_a_score : int = 0
var team_b_score : int = 0
var Aplayer1_name : String = "Aplayer1"
var Aplayer2_name : String = ""
var Aplayer3_name : String = ""
var Bplayer1_name : String = ""
var Bplayer2_name : String = ""
var Bplayer3_name : String = ""
var players : Array = [{"name": Aplayer1_name, "score": 0},{"name": Aplayer2_name, "score": 0},{"name": Aplayer3_name, "score": 0},
				{"name": Bplayer1_name, "score": 0},{"name": Bplayer2_name, "score": 0},{"name": Bplayer3_name, "score": 0},]
