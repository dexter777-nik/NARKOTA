extends Node

@onready var money_label = %MoneyLabel

func _ready():
	# 1. Сразу подписываемся на изменения денег в Глобальном скрипте
	Global.money_changed.connect(update_money_display)
	
	# 2. Обновляем текст текущим значением (на случай, если деньги уже были)
	update_money_display(Global.money)
	
	# 3. Мама присылает деньги
	Global.add_money(250)

# Теперь функция принимает аргумент new_value от сигнала
func update_money_display(new_value: int):
	money_label.text = str(new_value) + " Тенге"
