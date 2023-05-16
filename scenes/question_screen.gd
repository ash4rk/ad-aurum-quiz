extends Node

const QUESTIONS_JSON_PATH = "res://questions.json"

var answer: Dictionary

@onready var question_label = $CanvasLayer/PanelContainer/QuestionLabel
@onready var bg = $CanvasLayer/BG
@onready var answer_button_container = $CanvasLayer/PanelContainer2/AnswerButtonsContainer

func _ready():
	var json_string = FileAccess.get_file_as_string(QUESTIONS_JSON_PATH)
	var questions_data = JSON.parse_string(json_string) # Array
	answer = questions_data[0]
	print(answer)
