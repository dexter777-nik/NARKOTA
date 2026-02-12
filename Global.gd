# Global.gd
extends Node

# Деньги Никиты
var money: int = 0

# Функции работы с деньгами
func add_money(amount: int):
	money += amount
	print("Добавлено денег: ", amount, " Сейчас: ", money, " ₽")

func spend_money(amount: int) -> bool:
	if money >= amount:
		money -= amount
		print("Потрачено: ", amount, " Сейчас: ", money, " ₽")
		return true
	else:
		print("Недостаточно денег! Сейчас: ", money, " ₽")
		return false
