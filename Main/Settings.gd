extends Control

func _ready():
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://Main/Main.tscn")


func _on_FeedbackButton_pressed():
	OS.shell_open("https://docs.google.com/forms/d/e/1FAIpQLSdJbUFutyL4GDr5todKsM7HmUHkmCK81ScHj48xhx6FDrY9og/viewform")
