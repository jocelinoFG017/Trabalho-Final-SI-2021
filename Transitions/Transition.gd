extends Control


func _ready():
	#TranslationServer.set_locale("en")
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://levels/Level_01.tscn")
