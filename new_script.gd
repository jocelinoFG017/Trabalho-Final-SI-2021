func get_input():
	if state == HURT:
		return
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_just_pressed("jump")
	
	velocity.x = 0
	
	if right:
		velocity.x += run_speed
		$Sprite.flip_h = false
	
	if left:
		velocity.x -= run_speed
		$Sprite.flip_h = true
	
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
