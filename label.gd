extends Node2D

@onready var money_label = $CanvasLayer/MoneyLabel

func _ready():
	# На старте комнаты Никиты мама присылает деньги
	Global.add_money(250)
	update_money_display()

func update_money_display():
	money_label.text = str(Global.money) + " Тенге"
