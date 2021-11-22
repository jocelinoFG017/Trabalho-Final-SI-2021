extends Area2D

export(String, FILE, "*.json") var dialogue_file

var dialogues = []
var current_dialogue_id = 0
var is_dialogue_active = false


func _ready():
	play()


func play():
	#$CanvasLayer/NinePatchRect.visible = false
	#yield(get_tree().create_timer(3), 'timeout')
#	print("entrou no play")
	if is_dialogue_active:
		return
#	print("passou do if")
	dialogues = load_dialogue()
	#turn_off_the_player()
	is_dialogue_active = true
#	print("chegou aqui")
	
#	print("era pra ficar visivel")
	current_dialogue_id = -1
	next_line()


func _input(event):
	if event.is_action_pressed("game_usage"):
		#print("tecla pressionada")
		if get_overlapping_bodies().size() > 0:
			#print("corpo colidiu")
			next_line()
			#find_and_use_dialogue()


func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		#$Timer.start()
		$CanvasLayer/sprite.visible = true
		#$CanvasLayer/NinePatchRect.visible = true
		#$CanvasLayer/NinePatchRect.visible  = false
		#turn_on_the_player()
		return
	#$CanvasLayer/NinePatchRect/Name
	$CanvasLayer/sprite/Name.text = dialogues[current_dialogue_id]["name"]
	$CanvasLayer/sprite/Message.text = dialogues[current_dialogue_id]["text"]
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())


#func find_and_use_dialogue():
#	var dialogue_player = get_node_or_null("DialoguePlayer")

#	if dialogue_player:
#		print("Rodando dialogo")
#		dialogue_player.play()

