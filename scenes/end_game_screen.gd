extends Node

const MAIN_MENU_SCREEN_PATH = "res://main.tscn"

var correct_answers: int
var number_of_questions: int
@onready var correct_answers_value_label = $VBoxContainer/CorrectAnswersValueLabel
@onready var new_game_button = $NewGameButton

func _ready():
	correct_answers_value_label.text = str(correct_answers) + "/" + str(number_of_questions)

func _process(delta):
	new_game_button.disabled = SceneManager.is_transitioning

func _on_new_game_button_pressed():
	Global.reset_game()
	if not SceneManager.is_transitioning:
		SceneManager.change_scene(
			MAIN_MENU_SCREEN_PATH, {
				"pattern_enter": "fade",
				"pattern_leave": "squares",
			}
		)
