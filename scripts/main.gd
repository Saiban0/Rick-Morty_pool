extends Node

const globals = preload("res://scripts/globals.gd")

@export var ball_scene : PackedScene

#game variables
var ball_images := []
var cue_ball

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
			add_child(ball)
			ball.get_node("Sprite2D").texture = ball_images[ball_nb]
			ball_nb += 1
		rows -= 1

func reset_cue_ball():
	cue_ball = ball_scene.instantiate()
	add_child(cue_ball)
	cue_ball.position = globals.START_POS
	cue_ball.get_node("Sprite2D").texture = ball_images[-1]

func show_cue():
	$Cue.position = cue_ball.position

func _process(delta):
	show_cue()

func _on_cue_shoot(power):
	cue_ball.apply_central_impulse(power)
