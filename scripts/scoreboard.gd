extends VBoxContainer

func _ready():
	Globals.connect("point_scored", Callable(self, "update_scoreboard"))
	_update_scoreboard()


func _update_scoreboard():
	$Aplayer1/AName1.text = "%s" % Globals.players[0]["name"]
	$Aplayer2/AName2.text = "%s" % Globals.players[1]["name"]
	$Aplayer3/AName3.text = "%s" % Globals.players[2]["name"]
	$Bplayer1/BName1.text = "%s" % Globals.players[3]["name"]
	$Bplayer2/BName2.text = "%s" % Globals.players[4]["name"]
	$Bplayer3/BName3.text = "%s" % Globals.players[5]["name"]
	$Aplayer1/AScore1.text = "%d" % Globals.players[0]["score"]
	$Aplayer2/AScore2.text = "%d" % Globals.players[1]["score"]
	$Aplayer3/AScore3.text = "%d" % Globals.players[2]["score"]
	$Bplayer1/BScore1.text = "%d" % Globals.players[3]["score"]
	$Bplayer2/BScore2.text = "%d" % Globals.players[4]["score"]
	$Bplayer3/BScore3.text = "%d" % Globals.players[5]["score"]
	$GlobalScore/Score.text = "%d : %d" % [Globals.team_a_score, Globals.team_b_score]
