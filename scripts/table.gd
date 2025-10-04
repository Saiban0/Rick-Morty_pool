extends Node2D

signal update_scoreboard
signal ball_dropped
signal cue_ball_potted
signal game_over

func _on_holes_point_scored(ball) -> void:
	ball_dropped.emit(ball)
	$"..".balls_group.erase(ball)
	ball.remove_from_group("balls")
	if ball.is_in_group("balls_A"):
		ball.remove_from_group("balls_A")
		if Globals.turn_order[Globals.current_turn_index]["team"] == "A":
			Globals.players[Globals.current_turn_index]["score"] += 1
			Globals.turn_order[Globals.current_turn_index]["turns"] += 1
		else:
			Globals.turn_order[(Globals.current_turn_index + 1) % Globals.players.size()]["turns"] += 1
	elif ball.is_in_group("balls_B"):
		ball.remove_from_group("balls_B")
		if Globals.turn_order[Globals.current_turn_index]["team"] == "B":
			Globals.players[Globals.current_turn_index]["score"] += 1
			Globals.turn_order[Globals.current_turn_index]["turns"] += 1
		else:
			Globals.turn_order[(Globals.current_turn_index + 1) % Globals.players.size()]["turns"] += 1
	else: #Balle noire
		var winning_team : String
		if $"..".get_tree().get_nodes_in_group("balls").size() == 0:
			winning_team = Globals.turn_order[Globals.current_turn_index]["team"]
		else:
			winning_team = Globals.turn_order[(Globals.current_turn_index + 1) % Globals.turn_order.size()]["team"]
		Globals.game_over = true
		game_over.emit(winning_team)
	update_scoreboard.emit()
	self.remove_child(ball)
	$"../../../../GUI/Potted_balls_display".add_child(ball)

func _on_holes_cue_ball_lost() -> void:
	await get_tree().create_timer(2).timeout
	cue_ball_potted.emit()
