extends ProgressBar

const globals = preload("res://scripts/globals.gd")

func _process(_delta: float):
	value = $"../Cue".power * (100 / globals.MAX_POWER)
