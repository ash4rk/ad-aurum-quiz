extends Node

const QUESTION_SCREEN_PATH = "res://scenes/question_screen.tscn"

@onready var answers_number_option: OptionButton = $CanvasLayer/HBoxContainer/AnswersNumberOption

func _ready():
	await SceneManager.scene_loaded

func _on_play_button_pressed():
	Global.load_next_screen()

func _on_answers_number_option_item_selected(index):
	Global.answers_number_display = int(answers_number_option.get_item_text(index))
