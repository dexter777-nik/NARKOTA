extends CharacterBody2D

# Скорость движения
const SPEED = 300.0

func _physics_process(delta):
	# Получаем направление ввода (WASD или стрелки)
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Применяем скорость
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	# Функция для обработки движения и столкновений
	move_and_slide()
