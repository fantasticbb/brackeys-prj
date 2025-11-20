extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	
	
	# 这里获取到的移动方向可以用来判断玩家是否要翻转
	# 方向的值应该是-1，0，1
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		# 说明我们此时向右移动
		animated_sprite.flip_h = false
	if direction < 0:
		# 说明我们此时向左移动
		animated_sprite.flip_h = true
	
	# 接着控制跑和跳的动画播放
	
	if is_on_floor():
		# 此时站在地面上
		if direction == 0:
			# 此时播放待机动画
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		# 此时浮空
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
