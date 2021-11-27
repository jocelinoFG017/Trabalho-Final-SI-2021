extends Control

enum{EN, PTBR, JA}
var idioma

signal idioma_atual(language)

func _ready():
	#localiza(PTBR)
	pass

func localiza(new_idioma):
	var idioma_atual = new_idioma
	match idioma_atual:
		EN:
			TranslationServer.set_locale("en")
		PTBR:
			TranslationServer.set_locale("pt_BR")
		JA:
			TranslationServer.set_locale("ja")

func _on_BackButton_pressed():
	$menuSound.play()
	get_tree().change_scene("res://Scenes/Main/Main.tscn")


func _on_FeedbackButton_pressed():
	$menuSound.play()
	OS.shell_open("https://docs.google.com/forms/d/e/1FAIpQLSdJbUFutyL4GDr5todKsM7HmUHkmCK81ScHj48xhx6FDrY9og/viewform")


func _on_UpdateLog_pressed():
	get_tree().change_scene("res://UpdateLogs/Updates.tscn")


func _on_LanguageButton_pressed():
	$menuSound.play()
	localiza(PTBR)


func _on_LanguageButton2_pressed():
	$menuSound.play()
	localiza(EN)

func _on_LanguageButtonJA_pressed():
	$menuSound.play()
	localiza(JA)


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_SupportButton_pressed():
	$menuSound.play()
	OS.shell_open("https://twitter.com/Jocelino017")
	pass # Replace with function body.
