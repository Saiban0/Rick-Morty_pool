extends Node2D

signal update_scoreboard
signal ball_dropped
signal cue_ball_potted
signal game_over
func handle_points_and_turns(team : String):
	if Globals.turn_order[Globals.current_turn_index]["team"] == team:
		Globals.players[Globals.current_turn_index]["score"] += 1
		Globals.turn_order[Globals.current_turn_index]["turns"] += 1
	else:
		Globals.turn_order[(Globals.current_turn_index + 1) % Globals.players.size()]["turns"] += 1
	
func _handle_black_ball(team: String):
	var winning_team: String
	if $"..".get_tree().get_nodes_in_group(str("balls_", team)).size() < 1:
		winning_team = team
		game_over.emit(winning_team, false)
	else:
		winning_team = Globals.turn_order[(Globals.current_turn_index + 1) % Globals.players.size()]["team"]
		game_over.emit(winning_team, true)
	Globals.game_over = true
	#var output_dict : Dictionary = {
		#"winning_team" : winning_team,
		#"score_blue" : Globals.team_a_score,
		#"score_red" : Globals.team_b_score,
		#"player_red" : [
			#{"name" : Globals.players[0]["name"], "score" : Globals.players[0]["score"]},
			#{"name" : Globals.players[1]["name"], "score" : Globals.players[1]["score"]}
			#],
		#"player_blue" : [
			#{"name" : Globals.players[2]["name"], "score" : Globals.players[2]["score"]},
			#{"name" : Globals.players[3]["name"], "score" : Globals.players[3]["score"]}
		#]
	#}
	#var output_file : FileAccess = FileAccess.open("user://billiard_game")
	

func _on_holes_point_scored(ball) -> void:
	ball_dropped.emit(ball)
	$"..".balls_group.erase(ball)
	ball.remove_from_group("balls")
	if ball.is_in_group("balls_Blue"):
		ball.remove_from_group("balls_Blue")
		handle_points_and_turns("Blue")
	elif ball.is_in_group("balls_Red"):
		ball.remove_from_group("balls_Red")
		handle_points_and_turns("Red")
	else:
		_handle_black_ball(Globals.turn_order[Globals.current_turn_index]["team"])
	update_scoreboard.emit()

func _on_holes_cue_ball_lost() -> void:
	await get_tree().create_timer(2).timeout
	cue_ball_potted.emit()
