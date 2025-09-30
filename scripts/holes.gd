extends Area2D

signal point_scored
signal cue_ball_lost

func _ready():
	connect("body_entered", Callable(_on_body_entered))
	
func _on_body_entered(body):
	if body.is_in_group("balls"):
		body.remove_from_group("balls")
		body.hide()
		body.set_physics_process(false)
		print(body.position)
		if body.is_in_group("balls_A"):
			Globals.team_a_score += 1
		elif body.is_in_group("balls_B"):
			Globals.team_b_score += 1
		elif body.is_in_group("cue_ball"):
			cue_ball_lost.emit()
			body.remove_from_group("cue_ball")
			return
		point_scored.emit(body)
