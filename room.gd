extends Node2D

@onready var phone_ui = $UI/PhoneUI
@onready var dialogue_box = $UI/DialogueBox
@onready var money_label = $UI/MoneyLabel

var is_ringing = false
var can_start_dialogue = false


func start_call_event():
	is_ringing = true
	phone_ui.show()
	# Тут можно запустить анимацию тряски (AnimationPlayer)
	$AnimatedSprite2D.play("phone_shake") 
	$AudioStreamPlayer2D.play("c0cebf4e5c9d49d") # Звук звонка
	print("Нажми E, чтобы ответить")

func _input(event):
	if event.is_action_pressed("interact") and is_ringing: # "interact" привяжи к E в настройках
		answer_call()

func answer_call():
	is_ringing = false
	phone_ui.hide()
	$PhoneSound.stop()
	start_dialogue()

func start_dialogue():
	dialogue_box.show()
	# Массив с репликами
	var script = [
		{"name": "Никита", "text": "Алло, мам? Да, я заселился."},
		{"name": "Мама", "text": "Ну слава богу, сынок. Как там? Тепло?"},
		{"name": "Никита", "text": "Да, мам. Всё отлично. Евроремонт почти."},
		{"name": "Мама", "text": "Никитушка, я перевела последние 3000. Покушай нормально!"}
	]
	
	for line in script:
		$UI/DialogueBox/Name.text = line["name"]
		$UI/DialogueBox/Text.text = line["text"]
		await get_tree().create_timer(2.0).timeout # Пауза между репликами (или жди нажатия кнопки)

	complete_call()

func complete_call():
	dialogue_box.hide()
	# Начисляем деньги после разговора
	Global.add_money(3000)
	money_label.text = "Баланс: " + str(Global.money) + " руб."
	# Даем квест
	Global.has_food_quest = true
	print("Квест получен: Купить еды в парке")
