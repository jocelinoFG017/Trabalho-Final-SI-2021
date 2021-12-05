extends Area2D

#var res = preload("res://testSheet.tscn").intance()

#  Direcao da pedra
var dir = Vector2(1,0)
#  velocidade da pedra
var vel = 200
#  dano
export(int) var damage = 1

func _process(delta):
	translate(dir * vel * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_pedra_body_entered(body):
	if body.collision_layer == 4 and is_in_group("Atiraveis"):
		body.take_damage()
		print("colidindo no javali")
