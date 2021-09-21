extends Control

onready var health_bar = $ProgressBar

func _on_Player_hpChanged(currentHP) -> void:
	health_bar.value = currentHP
