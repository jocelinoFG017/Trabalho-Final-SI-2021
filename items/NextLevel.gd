extends Area2D
#  This scene basically change the actually scene to
#  the near scene
export(String, FILE,"*.tscn") var cenas

func _input(event):
	if event.is_action_pressed("game_usage"):
		if get_overlapping_bodies().size() > 0:
			$Sprite.play()
			yield(get_tree().create_timer(1), 'timeout')
			next_level()


func next_level():
	get_tree().change_scene(cenas)
