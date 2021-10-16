extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Botao que inicia o jogo
func _on_StartButton_pressed():
	get_tree().change_scene("res://levels/Level01.tscn")#scene ainda nao criada


# Botao que redireciona para a Scene Credits.tscn
func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credits/Credits.tscn")


# Botao para sair do jogo
func _on_ExitButton_pressed():
	get_tree().quit()


# Botao de configurações
func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Main/Settings.tscn")
