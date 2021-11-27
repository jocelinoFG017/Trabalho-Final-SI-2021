extends Control
#  This is the code to the pauseScreen scene
signal continue_choosed
export(bool) var stop = false

func _ready():
	$ContinueButton.show()
	$BackButton.show()
	emit_signal("continue_choosed")
	stop = true


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Main/Main.tscn")


func _on_ContinueButton_pressed():
	$BackButton.hide()
	$ContinueButton.hide()
