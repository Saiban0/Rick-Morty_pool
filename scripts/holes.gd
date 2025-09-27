extends Area2D

func _ready():
	connect("body_entered", Callable(_on_body_entered))
	
func _on_body_entered(body):
	if body.is_in_group("balls"):
		body.set_physics_process(false)
		body.hide()
		body.linear_velocity = Vector2(0.0, 0.0)
		body.angular_velocity = 0.0
		body.sleeping = 1
