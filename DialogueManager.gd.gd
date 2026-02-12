extends Node

var dialogue_script = [
	{"name": "Никита", "text": "(в трубку) Алло, мам? Да, я заселился.", "action": "show_phone"},
	{"name": "Мама", "text": "(голос из телефона) Ну слава богу, сынок. Как там?", "action": "play_cough"},
	{"name": "Никита", "text": "Да, мам. Всё отлично. Евроремонт почти...", "action": "zoom_window"},
	{"name": "Мама", "text": "Никитушка, я тебе перевела последние три тысячи...", "action": "show_money_notif"}
]

var current_step = 0

func _input(event):
	if event.is_action_pressed("ui_accept"): # Нажатие Space/Enter
		next_line()

func next_line():
	if current_step < dialogue_script.size():
		var data = dialogue_script[current_step]
		$UI/NameLabel.text = data["name"]
		$UI/TextLabel.text = data["text"]
		_handle_action(data["action"])
		current_step += 1
	else:
		print("Переход к сцене с Кириллом")

func _handle_action(action):
	match action:
		"show_phone": 
			$PhoneUI.visible = true
		"play_cough":
			$AudioPlayer.play_cough_sound()
