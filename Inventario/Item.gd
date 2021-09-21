extends Node2D


func _ready():
	if randi() % 2:
		$TextureRect.texture = load("res://Assets/Photo/nASKI/Ataque/Knife.png")
	else:
		$TextureRect.texture = load("res://Assets/Photo/nASKI/Ataque/Spear.png")
