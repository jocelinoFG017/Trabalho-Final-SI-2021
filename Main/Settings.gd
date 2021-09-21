extends Control

func _ready():
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://Main/Main.tscn")


func _on_FeedbackButton_pressed():
	OS.shell_open("https://docs.google.com/forms/d/e/1FAIpQLSdJbUFutyL4GDr5todKsM7HmUHkmCK81ScHj48xhx6FDrY9og/viewform")


func _on_UpdateLog_pressed():
	get_tree().change_scene("res://UpdateLogs/Updates.tscn")


func _on_LanguageButton_pressed():
	TranslationServer.set_locale("pt_BR")


func _on_LanguageButton2_pressed():
	TranslationServer.set_locale("en")
