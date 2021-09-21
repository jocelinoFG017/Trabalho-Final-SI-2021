extends KinematicBody2D

#  Carrega uma PackedScene(cena empacotada)
var pre_pedra = preload("res://Disparos/Rocks/Rock.tscn")


export(int) var run_speed  # velocidade de movimento  = 150
export(int) var jump_speed # velocidade de pulo = -305
export(int) var gravity # gravidade = 750

enum {IDLE, RUN, JUMP, HURT, DEAD, SITDOWN, BOWATTACK}
#var isAttacking = false # melee attack 

var state
var anim
var new_anim
var velocity = Vector2() # velocidade de movimento
var life


signal hpChanged(amout)
signal dead

func _ready():
	change_state(IDLE)


func start(pos):
	life = 10
	emit_signal("hpChanged", life)
	position = pos
	show()
	change_state(IDLE)


## Usando Maquina de estado(state machine)
func change_state(new_state):
	state = new_state
	match state:
		IDLE:
			new_anim = 'idle'
		RUN: 
			new_anim = 'run'
		JUMP:
			new_anim = 'jump_up'
		HURT:
			# new_anim = 'hurt'
			
			velocity.y = -200
			velocity.x = -100 * sign(velocity.x)
			life -= 1
			
			emit_signal("hpChanged", life)
			yield(get_tree().create_timer(0.5), 'timeout')
			change_state(IDLE)
			if life <= 0:
				change_state(DEAD)
		SITDOWN:
			new_anim = 'SitDown'
		BOWATTACK:
			new_anim = 'BowAttack'
		DEAD:
			emit_signal("dead")
			hide()


func get_input():
	if state == HURT:
		return
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_just_pressed("jump")
	var down = Input.is_action_just_pressed("sitDown")
	var disparo_pedra = Input.is_action_just_pressed("Disparo_Pedra")
	
	
	velocity.x = 0
	
	if right:
		velocity.x += run_speed
		$AnimatedSprite.flip_h = false
	
	if left:
		velocity.x -= run_speed
		$AnimatedSprite.flip_h = true
	if down:
		new_anim = 'SitDown'
	
	if jump and is_on_floor():
		change_state(JUMP)
		velocity.y = jump_speed
	
	if state == IDLE and velocity.x != 0:
		change_state(RUN)
	
	if state == RUN and velocity.x == 0:
		change_state(IDLE)
	
	if state in [IDLE,RUN] and !is_on_floor():
		change_state(JUMP)
	if state == JUMP and is_on_floor():
		change_state(IDLE)
	if state == JUMP and velocity.y > 0:
		new_anim = 'jump_down'
	
	if disparo_pedra:
		new_anim = 'BowAttack'
		if get_tree().get_nodes_in_group("Atiraveis").size() < 3:
			var pedra = pre_pedra.instance()
			pedra.global_position = $Position2D.global_position
			get_parent().add_child(pedra)
	
	#look_at(get_global_mouse_position())


func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	if new_anim != anim:
		anim = new_anim
		$AnimatedSprite.play(anim)
	#move o player
	velocity = move_and_slide(velocity, Vector2(0,-1))
	#
	if state == JUMP and is_on_floor():
		change_state(IDLE)
	
	for idx in range(get_slide_count()):
		var collision = get_slide_collision(idx)
		if collision.collider.name == 'Danger':
			hurt()
		if collision.collider.is_in_group('enemies'):
			var player_feet = (position + $CollisionShape2D.shape.extents).y
			if player_feet < collision.collider.position.y:
				collision.collider.take_damage()
				velocity.y = -200
			else:
				hurt()

func hurt():
	if state != HURT:
		$HurtSound.play()
		change_state(HURT)

#func _on_AnimatedSprite_animation_finished():
	#if $AnimatedSprite.animation == "KnifeAttack":
		#$AttackArea/CollisionShape2D.disabled = true
		#isAttacking = false




