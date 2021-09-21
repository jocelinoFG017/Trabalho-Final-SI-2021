extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://Assets/videos/VideoPreLevel.tscn")


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credits/Credits.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Main/Settings.tscn")


func _on_HowtoPlayButton_pressed():
	get_tree().change_scene("res://Main/ComoJogar.tscn")


func _on_Area2D_mouse_entered():
	$StartButton/Area2D/Sprite.show()


func _on_CreditsButton_mouse_entered():
	$CreditsButton/Sprite.show()


func _on_CreditsButton_mouse_exited():
	$CreditsButton/Sprite.hide()
