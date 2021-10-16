extends Control

onready var health_bar_enemy = $ProgressBar

# Diminui a vida dos javalis comuns
func _on_Javali_enemyhpChanged(valor) -> void:
	health_bar_enemy.value = valor

# Diminui a vida do Javali BOSS
func _on_JavaliBoss_enemyhpChanged(valor) -> void:
	health_bar_enemy.value = valor
