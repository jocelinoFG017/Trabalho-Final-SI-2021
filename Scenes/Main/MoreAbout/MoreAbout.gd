extends Node


func _ready():
	pass


func _on_Button_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Scenes/Main/Main.tscn")
