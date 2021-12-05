extends Node2D


func _ready():
	pass


func _on_placa_placa_ativada():
	#print("sinal funcionando")
	$placa.show()
	$placa/Label.text.show()
	yield(get_tree().create_timer(3), 'timeout')
	#print("hide plaquinha")
	$placa.hide()
	$placa/Label.hide()
	#plaquinha2.hide()
