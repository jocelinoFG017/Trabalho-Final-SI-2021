extends Area2D

signal pickup 

var textures = {'papirinho': 'res://Assets/Collectibles/Papiro.png'}

func init(type, pos):
	$Sprite.texture = load(textures[type])
	position = pos

func _input(event):
	if event.is_action_pressed("game_usage"):
		if get_overlapping_bodies().size() > 0:
			emit_signal("pickup")
			
			print("pegou o papiro")
			$Control.show()
			#$Label.show()
			#$Panel.show()
			yield(get_tree().create_timer(5), 'timeout')
			print("agora o papiro sera destruido")
			#$Label.hide()
			#$Panel.hide()
			queue_free()
