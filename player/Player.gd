extends KinematicBody2D

export(int) var run_speed  # velocidade de movimento  = 150
export(int) var jump_speed # velocidade de pulo = -305
export(int) var gravity # gravidade = 750

enum {IDLE, RUN, JUMP}
#var isAttacking = false # melee attack 

var state
var anim
var new_anim
var velocity = Vector2() # velocidade de movimento

func _ready():
	change_state(IDLE)

func start(pos):
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

# Funcao que detecta as teclas pressionadas pelo usuario
func get_input():
	# o movimento ocorre em todos os states
	velocity.x = 0
	# Valores de entrada (Movimento do Personagem)
	var right = Input.is_action_pressed("right") # direita
	var left = Input.is_action_pressed("left") # esquerda
	var jump = Input.is_action_just_pressed("jump") # pular
	#var attack = Input.is_action_pressed("attack") # atacar
	
	
	# Verificando entradas do teclado
	if right :#and #isAttacking == false: # se for para a direita
		velocity.x += run_speed
		#$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	if left :#and isAttacking == false:# se for para a esquerda
		velocity.x -= run_speed
		#$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	if jump and state == JUMP: #and jump_count < max_jumps:
		new_anim = 'jump_up'
		velocity.y = jump_speed / 1.5
		#jump_count += 1
	if jump and is_on_floor():
		change_state(JUMP)
		velocity.y = jump_speed
	#elif jump:
	#	velocity.y -= 1
	#$l0_sprite_1.play("KnifeAttack")
	if state ==  IDLE and velocity.x != 0:
		change_state(RUN)
	if state ==  RUN and velocity.x == 0:
		change_state(IDLE)
	if state in [IDLE,RUN] and !is_on_floor():
		change_state(JUMP)
		
	#else:
	#	velocity.x = 0
	#	if isAttacking == false:
			#$AnimatedSprite.play("idle")
	#		pass
	#if attack:
	#	$AnimatedSprite.play("KnifeAttack")
	#	isAttacking = true
	#	$AttackArea/CollisionShape2D.disabled = false
	#velocity = velocity.normalized() * run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	if new_anim != anim:
		anim = new_anim
		$AnimatedSprite.play(anim)
	#move o player
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if state == JUMP and is_on_floor():
		change_state(IDLE)
#func _on_AnimatedSprite_animation_finished():
	#if $AnimatedSprite.animation == "KnifeAttack":
		#$AttackArea/CollisionShape2D.disabled = true
		#isAttacking = false
