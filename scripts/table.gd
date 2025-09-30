extends Node2D

signal update_scoreboard
signal ball_dropped
signal cue_ball_potted

func _on_holes_point_scored(ball) -> void:
	update_scoreboard.emit()
	ball_dropped.emit(ball)
	$"..".balls_group.erase(ball)
	ball.remove_from_group("balls")
	if ball.is_in_group("balls_A"):
		ball.remove_from_group("balls_A")
	elif ball.is_in_group("balls_B"):
		ball.remove_from_group("balls_B")
	#elif ball.is_in_group("8ball"):
		#ball.remove_from_group("8ball")
	self.remove_child(ball)
	$"../../../../Potted_balls_display".add_child(ball)


func _on_holes_cue_ball_lost() -> void:
	await get_tree().create_timer(2).timeout
	cue_ball_potted.emit()
