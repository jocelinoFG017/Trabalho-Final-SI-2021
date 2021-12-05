extends Control
# This file is the menu script.

func _ready():
	pass


func _on_StartButton_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Transitions/All/Transition01.tscn")


func _on_CreditsButton_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Scenes/Main/Credits/Credits.tscn")


func _on_ExitButton_pressed():
	$menuSound.play()
	get_tree().quit()


func _on_ConfigButton_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Settings.tscn")
	#$AudioStreamPlayer.stop()


func _on_HowtoPlayButton_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Scenes/Main/ComoJogar/ComoJogar.tscn")


func _on_Area2D_mouse_entered():
	$StartButton/Area2D/Sprite.show()


func _on_AboutMore_pressed():
	$AboutMore/about_sound.play()
	get_tree().change_scene("res://Scenes/Main/MoreAbout/MoreAbout.tscn")
