extends StaticBody2D

var display_physics = PhysicsMaterial.new()
func _ready():
	display_physics.bounce = 0.0
	display_physics.friction = 0.0

func _spawn_ball(ball) -> void:
	ball.set_physics_process(true)
	ball.position = Vector2(0, 24)
	ball.set_physics_material_override(display_physics)
	ball.show()
	ball.linear_velocity = Vector2(50.0 , 0.0)
	ball.angular_velocity = 15
	ball.set_physics_process(true)
	
