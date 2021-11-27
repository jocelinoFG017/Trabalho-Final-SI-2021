extends StaticBody2D

var gate_opened = false

signal open_gate

func _ready():
	$AnimationPlayer.play("gate_closed")
	#pass
	
func _input(event):
	if event.is_action_pressed("game_usage"):
		#if get_overlapping_bodies().size() > 0:
		gate_opened = true
		print("Tecla pressionada")
		$AnimationPlayer.play("gate_opened")
		print("O portão deve abrir agora")
		yield(get_tree().create_timer(3), 'timeout')
		$AnimationPlayer.play("gate_closed")
