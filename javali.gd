extends KinematicBody2D

# Variaveis externas
export (int) var speed
export (int) var gravity

# Estados do inimigo
enum{WALK, HURT, DEAD}

var facing = 1

# Estado
var state
var anim
var new_anim
var velocity = Vector2()

# Quantidade de vidas
var enemy_life = 3


#  sinal de mudança no valor da vida
signal enemyhpChanged(valor)
#  sinal de morte
signal enemydead

#signal take_hit(valor)


func _ready():
	change_state(WALK)


func start(pos):
	emit_signal("enemyhpChanged", enemy_life)
	position = pos
	show()
	change_state(WALK)


func change_state(new_state):
	state = new_state
	match state:
		WALK:
			new_anim = 'walk'
		HURT:
			#new_anim = 'hurt'
			pass
			#$HitSound.play()
		DEAD:
			print("javali morreu")
			new_anim = 'dead'
			emit_signal("enemydead")
			yield(get_tree().create_timer(0.5), 'timeout')
			queue_free()


func _physics_process(delta):
	$AnimatedSprite.flip_h = velocity.x > 0
	velocity.y += gravity * delta
	velocity.x = facing * speed
	if new_anim != anim:
		anim = new_anim
		$AnimatedSprite.play(anim)
	#  move o inimigo
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	for idx in range(get_slide_count()):
		var collision = get_slide_collision(idx)
		if collision.collider.name == "Player":
			collision.collider.hurt()
		if collision.normal.x != 0:
			facing = sign(collision.normal.x)
			velocity.y = -100
	if position.y > 1000:
		queue_free()
	
	#if body.collision_layer == 4:
	#	pass

func take_damage():
	change_state(HURT)
	enemy_life -= 1
	emit_signal("enemyhpChanged", enemy_life)
	yield(get_tree().create_timer(0.5), 'timeout')
	change_state(WALK)
	if enemy_life <= 0:
		change_state(DEAD) 
#	$AnimationPlayer.play('death')
#	$CollisionShape2D.disabled = true
#	set_physics_process(false)

#func _on_AnimationPlayer_animation_finished(anim_name):
	#if anim_name == 'death':
		#queue_free()
