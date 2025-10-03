extends PanelContainer

var messages = [
		"WIN_MSG1", "WIN_MSG2", "WIN_MSG3", "WIN_MS4", 
		"WIN_MSG5", "WIN_MSG6", "WIN_MSG7", "WIN_MSG8"]

func get_winning_team_members(winning_team: String) -> Array:
	var members : Array
	for player in Globals.players:
		if player["team"] == winning_team:
			members.append(player["name"])
	return members

func _on_table_game_over(winning_team: String) -> void:
	self.show()
	$MarginContainer/VBoxContainer/Text.text = str(tr(messages[randi() % messages.size()])) % get_winning_team_members(winning_team)
