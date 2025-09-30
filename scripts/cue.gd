extends Sprite2D

signal shoot

var power : float = 0.0
var power_dir = 1

func _process(_delta):
	var mouse_pos = get_viewport().get_mouse_position()
	look_at(mouse_pos)
	if (self.visible):
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			power += 1.5 * power_dir
			if (power > Globals.MAX_POWER):
				power_dir = -1
			elif (power <= 0):
				power_dir = 1
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
				power = 0
				return
		else:
				power_dir = 1
				if (power > 0):
					var dir = mouse_pos - position
					shoot.emit(power * (dir.normalized() * 25 ))
					power = 0
