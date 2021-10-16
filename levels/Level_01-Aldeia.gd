extends Node2D
# Novo Script para um novo nivel 
# nao esqueça este script é difirente da
# outra parte do nivel


onready var plaquinha = $placa/Label
#onready var plaquinha2 = $placa2/Label

func _ready():
	$Player.start($PlayerSpawn.position)
	set_camera_limits()

func set_camera_limits():
	var map_size = $World.get_used_rect()
	var cell_size = $World.cell_size
	$Player/Camera2D.limit_left = (map_size.position.x - 5) * cell_size.x
	$Player/Camera2D.limit_right = (map_size.end.x + 5) * cell_size.x


func _on_Player_dead():
	#GameState.restart()
	pass

#func _on_NextLevel_body_entered(body):
	#print("res://levels/Level_"+ str(int(get_tree().current_scene.name)+1)+".tscn")
	#GameState.next_level()
#	pass


func _on_placa_placa_ativada(current_status)-> void:
	print("sinal funcionando")
	plaquinha.show()
	#plaquinha2.show()
	yield(get_tree().create_timer(3), 'timeout')
	print("hide plaquinha")
	plaquinha.hide()
	#plaquinha2.hide()
	#plaquinha.text = str("Seja bem vindo ao jogo")


