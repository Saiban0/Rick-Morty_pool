extends PanelContainer

var messages = [
		"WIN_MSG1", "WIN_MSG2", "WIN_MSG3", "WIN_MSG4", 
		"WIN_MSG5", "WIN_MSG6", "WIN_MSG7", "WIN_MSG8"]

var dumb_messages = ["DUMB_MSG01", "DUMB_MSG02", "DUMB_MSG03", "DUMB_MSG04", "DUMB_MSG05",
					"DUMB_MSG06", "DUMB_MSG07", "DUMB_MSG08", "DUMB_MSG09", "DUMB_MSG10",]

func get_winning_team_members(winning_team: String) -> Array:
	var members : Array
	for player in Globals.players:
		if player["team"] == winning_team:
			members.append(player["name"])
	return members

func _on_table_game_over(winning_team: String, dumbass : bool) -> void:
	if (dumbass):
		$MarginContainer/VBoxContainer/Text.text = str(tr(dumb_messages[randi() % dumb_messages.size()])) % get_winning_team_members(winning_team)
	else:
		$MarginContainer/VBoxContainer/Text.text = str(tr(messages[randi() % messages.size()])) % get_winning_team_members(winning_team)
	self.show()
