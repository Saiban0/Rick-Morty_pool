extends PanelContainer

var messages = [
		"Burrrrp... %s and %s just wiped the floor across *infinite dimensions*!",
		"%s and %s won... but at what cost, Morty? WHAT COST?!",
		"Wubba lubba dub dub! %s and %s cleared the table, baby!",
		"%s and %s pulled a Cronenberg breakshot, nobody saw it coming!",
		"Game over! %s and %s are the interdimensional billiard champions!",
		"%s and %s... I mean, they won THIS game, but in 97% of timelines they totally lost.",
		"%s and %s potted more balls than a Plumbus factory, Morty!",
		"Congrats to %s and %s — council of pool Ricks approves!"
	]

func get_winning_team_members(winning_team: String) -> Array:
	var members : Array
	for player in Globals.players:
		if player["team"] == winning_team:
			members.append(player["name"])
	return members

func _on_table_game_over(winning_team: String) -> void:
	self.show()
	$MarginContainer/VBoxContainer/Text.text = str(messages[randi() % messages.size()]) % get_winning_team_members(winning_team)
