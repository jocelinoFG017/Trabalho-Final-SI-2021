extends StaticBody2D

var gate_opened = false

signal open_gate

func _ready():
	$AnimationPlayer.play("gate_closed")
	get_input()
	#pass
	

func get_input():
	var use = Input.is_action_just_pressed("game_usage")
	
	if use:
		print("Tecla pressionada")
		#if get_overlapping_bodies().size() > 0:
		#	print("overlapping bodies > 0")
		#	$AnimationPlayer.play("gate_opened")
		#	gate_opened = true
		#	yield(get_tree().create_timer(3), 'timeout')
		#	$AnimationPlayer.play("gate_closed")



func _on_Gate_body_entered(body):
	get_input()
