extends TextureRect

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var bg : Texture = load(str("res://assets/backgrounds/planet", rng.randi_range(1,10),"_bg.png"))
	self.texture = bg
