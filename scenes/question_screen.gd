extends Node

const ANSWER_BUTTON_SCENE = preload("res://scenes/answer_button.tscn")

var question: Dictionary

@onready var question_label = $CanvasLayer/PanelContainer/QuestionLabel
@onready var bg = $CanvasLayer/BG
@onready var answer_buttons_container = $CanvasLayer/PanelContainer2/AnswerButtonsContainer
@onready var popup: FalseCorrectPopup = $CanvasLayer/FalseCorrectPopup

func _ready():
	bg.texture = load("res://" + question.background)
	question_label.text = question.question
	_init_answer_buttons(question.answers)

func _init_answer_buttons(answers: Array) -> void:
	for answer in answers:
		var button: AnswerButton = ANSWER_BUTTON_SCENE.instantiate()
		button.answer_text = answer.text
		button.is_correct = answer.correct
		answer_buttons_container.add_child(button)
		button.pressed.connect(_check_correctness.bind(button.is_correct))

func _check_correctness(is_correct: bool) -> void:
	if is_correct:
		Global.correct_answers += 1
		popup.show_correct()
	else:
		popup.show_wrong()

func _on_next_question_button_pressed():
	Global.load_next_screen()
