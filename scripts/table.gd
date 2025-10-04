extends Node2D

signal update_scoreboard
signal ball_dropped
signal cue_ball_potted
signal game_over

func _handle_points_and_turns(team : String):
	if Globals.turn_order[Globals.current_turn_index]["team"] == team:
		Globals.players[Globals.current_turn_index]["score"] += 1
		Globals.turn_order[Globals.current_turn_index]["turns"] += 1
	else:
		Globals.turn_order[(Globals.current_turn_index + 1) % Globals.players.size()]["turns"] += 1

func _handle_black_ball(team: String):
	var winning_team: String
	if $"..".get_tree().get_nodes_in_group(str("balls_", team)).size() < 1:
		winning_team = team
	else:
		winning_team = Globals.turn_order[(Globals.current_turn_index + 1) % Globals.players.size()]["team"]
	Globals.game_over = true
	game_over.emit(winning_team)

func _on_holes_point_scored(ball) -> void:
	ball_dropped.emit(ball)
	$"..".balls_group.erase(ball)
	ball.remove_from_group("balls")
	if ball.is_in_group("balls_A"):
		ball.remove_from_group("balls_A")
		_handle_points_and_turns("A")
	elif ball.is_in_group("balls_B"):
		ball.remove_from_group("balls_B")
		_handle_points_and_turns("B")
	else:
		_handle_black_ball(Globals.turn_order[Globals.current_turn_index]["team"])
	update_scoreboard.emit()
	self.remove_child(ball)
	$"../../../../GUI/Potted_balls_display".add_child(ball)

func _on_holes_cue_ball_lost() -> void:
	await get_tree().create_timer(2).timeout
	cue_ball_potted.emit()
