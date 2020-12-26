extends Node2D

func _ready():
	$Player.start($PlayerSpawn.position)
	set_camera_limits()

func set_camera_limits():
	var map_size = $World.get_used_rect()
	var cell_size = $World.cell_size
	$Player/Camera2D.limit_left = (map_size.position.x - 5) * cell_size.x
	$Player/Camera2D.limit_right = (map_size.end.x + 5) * cell_size.x

func _on_Player_dead():
	#GameState.restart()
	pass

#func _on_NextLevel_body_entered(body):
	#print("res://levels/Level_"+ str(int(get_tree().current_scene.name)+1)+".tscn")
	#GameState.next_level()
#	pass
