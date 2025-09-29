extends Node2D

signal update_scoreboard

func _on_holes_point_scored() -> void:
	emit_signal("update_scoreboard")
