extends CharacterBody2D

const SPEED = 200.0
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):
	# Получаем вектор направления: (x: -1 до 1, y: -1 до 1)
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# Управляем физикой (движение)
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
	
	# Управляем анимацией
	update_animation(direction)

func update_animation(direction):
	if direction == Vector2.ZERO:
		# Если стоим на месте - останавливаем анимацию
		_animated_sprite.stop() 
		# Или включи анимацию покоя, если есть: _animated_sprite.play("idle")
	else:
		# Выбираем анимацию в зависимости от того, куда жмет игрок
		if abs(direction.x) > abs(direction.y):
			# Если движение по горизонтали сильнее
			if direction.x > 0:
				_animated_sprite.play("walk_right")
			else:
				_animated_sprite.play("walk_left")
		else:
			# Если движение по вертикали сильнее
			if direction.y > 0:
				_animated_sprite.play("walk_down")
			else:
				_animated_sprite.play("walk_up")
