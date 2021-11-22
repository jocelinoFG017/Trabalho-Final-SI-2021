extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func _ready():
	pass



func get_input():
	velocity = Vector2()
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var up = Input.is_action_pressed("jump")
	var down = Input.is_action_pressed("sitDown")
	var use = Input.is_action_just_pressed("game_usage")
	
	
	if right:
		velocity.x += 1
	if left:
		velocity.x -= 1
	if up:
		velocity.y -= 1
	if down:
		velocity.y += 1
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
