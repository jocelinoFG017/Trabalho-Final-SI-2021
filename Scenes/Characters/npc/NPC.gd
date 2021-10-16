extends Area2D


func _input(event):
	if event.is_action_pressed("game_usage"):
		print("tecla pressionada")
		if get_overlapping_bodies().size() > 0:
			print("corpo colidiu")
			find_and_use_dialogue()
		
func find_and_use_dialogue():
	var dialogue_player = get_node_or_null("DialoguePlayer")
	
	if dialogue_player:
		print("Rodando dialogo")
		dialogue_player.play()
