extends Node2D

@onready var balls = get_children()

var bounce = 0.9

func _physics_process(delta):
	# Move balls
	for ball in balls:
		ball._physics_process(delta)
	
	# Resolve collisions between each pair
	for i in range(balls.size()):
		for j in range(i + 1, balls.size()):
			resolve_collision(balls[i], balls[j])
	
func resolve_collision(ball1, ball2):
	var normal = (ball2.position - ball1.position)
	var dist = normal.length()
	var penetration = ball1.radius + ball2.radius - dist

	if penetration > 0:
		normal = normal.normalized()
		
		# Resolve overlap (push balls apart)
		var correction = normal * (penetration / 2)
		ball1.position -= correction
		ball2.position += correction

		# Relative velocity along the normal
		var rel_vel = ball1.velocity - ball2.velocity
		var vel_along_normal = rel_vel.dot(normal)
		
		if vel_along_normal > 0:
			return  # already separating
		
		# Impulse scalar
		var j = -(1 + bounce) * vel_along_normal / 2.0  # divide by 2 since mass=1
		
		# Apply impulse
		ball1.velocity += j * normal
		ball2.velocity -= j * normal
