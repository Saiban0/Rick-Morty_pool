extends ProgressBar

func _process(_delta: float):
	value = $"../Cue".power * (100 / Globals.MAX_POWER)
