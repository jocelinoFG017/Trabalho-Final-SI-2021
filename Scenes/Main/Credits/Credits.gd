extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Main/Main.tscn")

func _on_GitButton_pressed():
	OS.shell_open("https://github.com/jocelinoFG017")
