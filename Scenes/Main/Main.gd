extends Node

func _ready():
	$AudioStreamPlayer.play()

# Quando a música roda de novo
func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
