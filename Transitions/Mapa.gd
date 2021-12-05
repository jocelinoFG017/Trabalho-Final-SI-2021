extends Node


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://levels/Level01/Level_01.tscn")
