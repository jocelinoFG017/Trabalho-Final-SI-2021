extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_StartButton_pressed():
	#get_tree().change_scene("res://Transitions/All/Transition01.tscn")
	get_tree().change_scene("res://Transitions/All/Transition01.tscn")
	#get_tree().change_scene("res://levels/Level_01.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Main/Credits/Credits.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Settings.tscn")


func _on_HowtoPlayButton_pressed():
	get_tree().change_scene("res://Scenes/Main/ComoJogar/ComoJogar.tscn")


func _on_Area2D_mouse_entered():
	$StartButton/Area2D/Sprite.show()


func _on_CreditsButton_mouse_entered():
	#$CreditsButton/Sprite.show()
	pass


func _on_CreditsButton_mouse_exited():
	#$CreditsButton/Sprite.hide()
	pass
