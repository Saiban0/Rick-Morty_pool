extends VBoxContainer

@onready var name_group = get_tree().get_nodes_in_group("name_labels")
@onready var avatar_group = get_tree().get_nodes_in_group("avatars")
@onready var score_group = get_tree().get_nodes_in_group("score_labels")

func _ready():
	set_scoreboard()

func set_scoreboard():
	var i = 0
	for label in name_group:
		label.text = "%s" % Globals.players[i]["name"]
		i += 1
	i = 0
	for label in avatar_group:
		label.set_texture(Globals.players[i]["avatar"])
		label.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
		i += 1
	_update_scoreboard()

func _update_scoreboard():
	var i = 0
	for label in score_group:
		label.text = "%s" % Globals.players[i]["score"]
		i += 1
	$Score/Score.text = "%d : %d" % [Globals.team_a_score, Globals.team_b_score]
	
