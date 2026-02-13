extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):

	var direction = Vector2.ZERO

	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED

		# Анимации
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				$AnimatedSprite2D.play("walk_right")
			else:
				$AnimatedSprite2D.play("walk_left")
		else:
			if direction.y > 0:
				$AnimatedSprite2D.play("walk_down")
			else:
				$AnimatedSprite2D.play("walk_up")
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.stop()

	move_and_slide()
