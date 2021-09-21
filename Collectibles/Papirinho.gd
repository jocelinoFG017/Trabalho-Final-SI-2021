extends Area2D

signal pickup 

var textures = {'papirinho': 'res://Assets/Collectibles/Papiro.png'}

func init(type, pos):
	$Sprite.texture = load(textures[type])
	position = pos


func _on_Papirinho_body_entered(body):
	emit_signal("pickup")
	queue_free()
