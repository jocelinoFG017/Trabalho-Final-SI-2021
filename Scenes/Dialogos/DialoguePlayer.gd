extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file

var dialogues = []
var current_dialogue_id = 0
var is_dialogue_active = false

func _ready():
	play()
	
func play():
	$NinePatchRect.visible = false
	#yield(get_tree().create_timer(3), 'timeout')
	print("entrou no play")
	if is_dialogue_active:
		return
	print("passou do if")
	dialogues = load_dialogue()
	turn_off_the_player()
	is_dialogue_active = true
	print("chegou aqui")
	
	print("era pra ficar visivel")
	current_dialogue_id = -1
	next_line()
	
	
func _input(event):
	if not is_dialogue_active:
		return
	
	if event.is_action_pressed("game_usage"):
		$NinePatchRect.visible = true
		next_line()
		
func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		#$Timer.start()
		$NinePatchRect.visible = false
		turn_on_the_player()
		return
	
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]["name"]	
	$NinePatchRect/Message.text = dialogues[current_dialogue_id]["text"]
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())

func _on_Timer_timeout():
	is_dialogue_active = false
	
func turn_on_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)

func turn_off_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
