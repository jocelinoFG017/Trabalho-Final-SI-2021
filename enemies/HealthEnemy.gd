extends Control

onready var health_bar_enemy = $ProgressBar

func _on_Javali_enemyhpChanged(valor) -> void:
	health_bar_enemy.value = valor
