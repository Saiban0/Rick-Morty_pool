extends Area2D

var velocity = Vector2.ZERO
var radius = 16  # adjust to match your sprite size

func _physics_process(delta):
	# Move ball
	position += velocity * delta
	# Apply friction
	velocity *= 0.99
