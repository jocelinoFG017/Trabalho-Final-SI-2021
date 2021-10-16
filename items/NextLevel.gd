extends Area2D

export(String, FILE,"*.tscn") var cenas

func _input(event):
	if event.is_action_pressed("game_usage"):
		if get_overlapping_bodies().size() > 0:
			next_level()


func next_level():
	get_tree().change_scene(cenas)
