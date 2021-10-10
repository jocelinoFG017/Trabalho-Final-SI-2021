extends Area2D

var active = false

signal placa_ativada

func _ready():
	pass


func _input(event):
	if event.is_action_pressed("game_usage"):
		if get_overlapping_bodies().size() > 0:
			active = true
			emit_signal("placa_ativada", active)
			print("mostra popup")
			$Panel.show()
			#get_tree().get_root().get_node($L)
			#$Label.show()
			yield(get_tree().create_timer(3), 'timeout')
			print("hide popup")
			#$Label.hide()
			$Panel.hide()
			active = false
