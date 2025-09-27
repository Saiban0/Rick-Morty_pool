extends Node

const globals = preload("res://scripts/globals.gd")

@export var ball_scene : PackedScene

#game variables
var ball_images := []
var cue_ball
#var can_shoot : bool = true
var movement : bool = false
var balls_group = Array()

func _ready():
	load_images()
	new_game()

func load_images():
	for i in range(1, 17, 1):
		var ball_image = load(str("res://assets/ball_", i, ".png"))
		ball_images.append(ball_image)

func new_game():
	generate_balls()
	reset_cue_ball()

func generate_balls():
	var ball_nb : int = 0
	var rows : int = 5
	var diameter = 32
	for i in range(5):
		for j in range(rows):
			var ball = ball_scene.instantiate()
			var x = 256 + i * (diameter * 0.866)  # cos(30°) environ 0.866
			@warning_ignore("integer_division")
			var y = 325 + j * diameter + i * (diameter / 2)
			ball.position = Vector2(x, y)
			ball.add_to_group("balls")
			add_child(ball)
			ball.get_node("Sprite2D").texture = ball_images[ball_nb]
			ball_nb += 1
		rows -= 1

func clear_balls():
	for ball in balls_group:
		ball.queue_free()
		ball.remove_from_group("balls")
	balls_group = null

func reset_cue_ball():
	if typeof(cue_ball) != TYPE_NIL:
		cue_ball.queue_free()
		cue_ball.remove_from_group("balls")
	cue_ball = ball_scene.instantiate()
	cue_ball.add_to_group("balls")
	add_child(cue_ball)
	cue_ball.get_node("Sprite2D").texture = ball_images[-1]
	balls_group = get_tree().get_nodes_in_group("balls")
	cue_ball.position = globals.START_POS

func check_ball_movement(array) -> bool:
	for ball in array:
		if ball.linear_velocity.length() > 2 || abs(ball.angular_velocity) > 0.1:
			return (true)
	return (false)

func update_cue():
	if movement || !cue_ball.visible:
		$Cue.hide()
	else:
		$Cue.show()
		$Cue.position = cue_ball.position

func _process(delta):
	movement = check_ball_movement(balls_group)
	update_cue()
	if Input.is_action_just_pressed("reset_cue_ball") && !movement:
		reset_cue_ball()
	if Input.is_action_just_pressed("full_reset") && !movement:
		clear_balls()
		new_game()

func _on_cue_shoot(power):
	cue_ball.apply_central_impulse(power)
	
