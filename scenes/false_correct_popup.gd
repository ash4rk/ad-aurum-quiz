extends Control

class_name FalseCorrectPopup

@export_color_no_alpha var correct_modulate
@export_color_no_alpha var false_modulate
@onready var false_correct_label = $PanelContainer/VBoxContainer/FalseCorrectLabel

func show_correct():
	self.visible = true
	false_correct_label.text = "KEY_CORRECT"
	self.modulate = correct_modulate

func show_wrong():
	self.visible = true
	false_correct_label.text = "KEY_WRONG"
	self.modulate = false_modulate

func _on_next_question_button_pressed():
	Global.load_next_screen()
