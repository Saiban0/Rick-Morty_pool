extends PanelContainer

signal dropped_ball

func _on_table_ball_dropped(ball) -> void:
	dropped_ball.emit(ball)
	$"../../GameViewport/SubViewport/Main".remove_child(ball)
	$SubViewportContainer/SubViewport/Area2D/StaticBody2D.add_child(ball)
