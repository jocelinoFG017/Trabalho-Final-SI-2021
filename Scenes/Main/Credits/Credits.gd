extends Node


func _ready():
	pass


func _on_BackButton_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Scenes/Main/Main.tscn")

func _on_GitButton_pressed():
	$menuSound.play()
	OS.shell_open("https://github.com/jocelinoFG017")
