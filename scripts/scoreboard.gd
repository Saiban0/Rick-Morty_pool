extends VBoxContainer

@onready var name_group = get_tree().get_nodes_in_group("name_labels")
@onready var avatar_group = get_tree().get_nodes_in_group("avatars")
@onready var score_group = get_tree().get_nodes_in_group("score_labels")

func _ready():
	set_scoreboard()
	swap_1_and_2((name_group))
	_set_label_color()

func swap_1_and_2(array: Array) -> Array:
	var temp = array[1]
	array[1] = array[2]
	array[2] = temp
	return array

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

func _set_label_color():
	for i in name_group.size():
		if i == Globals.current_turn_index:
			name_group[i].add_theme_color_override("font_color", Color(1.0, 1.0, 0.0, 1.0))
		else:
			name_group[i].remove_theme_color_override("font_color")
	$"../../../../CurrenTurnPanel/MarginContainer/CenterContainer/Label".text = str(tr("CURR_TURN")) % Globals.turn_order[Globals.current_turn_index]["name"]
