extends Camera2D

func _ready():
	var screen_size = get_window().size
	position = screen_size / 2
