extends Control


func _ready():
	yield(get_tree().create_timer(3), 'timeout')
	$Button.show()

func _input(event):
	if Input.is_action_just_pressed("next"):
		_on_Button_pressed()



func _on_Button_pressed():
	get_tree().change_scene("res://levels/Level01/Level_01.tscn")
