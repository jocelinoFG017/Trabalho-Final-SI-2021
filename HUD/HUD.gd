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


#Botao que inicia o jogo
func _on_StartButton_pressed():
	get_tree().change_scene("res://levels/Level01.tscn")#scene ainda nao criada


#botao que redireciona para a Scene Credits.tscn
func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credits/Credits.tscn")

#botão para sair do jogo
func _on_ExitButton_pressed():
	get_tree().quit()


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://Main/Settings.tscn")
