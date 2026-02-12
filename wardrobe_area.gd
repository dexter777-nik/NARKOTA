extends Area2D

var can_change = false
var is_street_clothes = false

# Ссылки на текстуры (замени пути на свои)
var home_skin = preload("res://nikita.png")
var street_skin = preload("res://никита бандюган-sheet.png")

func _on_body_entered(body):
	if body.name == "Player": # Проверь, что твой игрок называется именно Player
		can_change = true
		print("Нажми E, чтобы переодеться")

func _on_body_exited(body):
	if body.name == "Player":
		can_change = false

func _input(event):
	if can_change and event.is_action_pressed("interact"): # Кнопка E
		change_clothes()

func change_clothes():
	# Ищем спрайт игрока. Предположим, он в группе "player" 
	# или мы ищем его через get_node в сцене.
	var player_sprite = get_tree().get_first_node_in_group("player").get_node("Sprite2D")
	
	if is_street_clothes:
		player_sprite.texture = home_skin
		print("Никита надел домашнее")
	else:
		player_sprite.texture = street_skin
		print("Никита готов к выходу")
	
	is_street_clothes = !is_street_clothes # Меняем состояние (туда-сюда)
