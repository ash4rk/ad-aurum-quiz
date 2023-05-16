extends Control

class_name FalseCorrectPopup

@onready var false_correct_label = $PanelContainer/VBoxContainer/FalseCorrectLabel

func show_correct():
	self.visible = true
	false_correct_label.text = "Верно"

func show_wrong():
	self.visible = true
	false_correct_label.text = "Неверно"

func _on_next_question_button_pressed():
	Global.load_next_screen()
