extends Control
#  This code is for the transitions in game.

func _ready():
	yield(get_tree().create_timer(5), 'timeout')
	$Button.show()

func _input(event):
	if Input.is_action_just_pressed("next"):
		_on_Button_pressed()


func _on_Button_pressed():
	$menuSound.play()
	get_tree().change_scene("res://levels/Level01/Level_01.tscn")
