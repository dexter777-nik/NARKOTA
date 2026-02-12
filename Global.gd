extends Node

# Сигнал, на который будут подписываться все Label с деньгами в игре
signal money_changed(new_amount)

# Переменная для хранения баланса
var money: int = 0

# Функция для добавления денег
func add_money(amount: int):
	money += amount
	# Испускаем сигнал, чтобы все интерфейсы узнали об обновлении
	money_changed.emit(money)
	print("Баланс пополнен на: ", amount, ". Текущий баланс: ", money)

# Функция для траты денег (с проверкой, хватает ли их)
func spend_money(amount: int) -> bool:
	if money >= amount:
		money -= amount
		money_changed.emit(money)
		return true # Возвращаем true, если покупка успешна
	else:
		print("Недостаточно тенге!")
		return false # Возвращаем false, если денег мало
