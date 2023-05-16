extends Node

const ANSWER_BUTTON_SCENE = preload("res://scenes/answer_button.tscn")

var question: Dictionary

#question.question - question text
#question.background - image path (like "backgrounds/osmium.jpg")
#question.answers - array of answers

@onready var question_label = $CanvasLayer/PanelContainer/QuestionLabel
@onready var bg = $CanvasLayer/BG
@onready var answer_buttons_container = $CanvasLayer/PanelContainer2/AnswerButtonsContainer
@onready var popup = $CanvasLayer/FalseCorrectPopup
@onready var popup_label = $CanvasLayer/FalseCorrectPopup/PanelContainer/VBoxContainer/FalseCorrectLabel

func _ready():
	bg.texture = load("res://" + question.background)
	question_label.text = question.question
	_init_answer_buttons(question.answers)

func _init_answer_buttons(answers: Array) -> void:
	for i in answers:
		var button: AnswerButton = ANSWER_BUTTON_SCENE.instantiate()
		button.answer_text = i.text
		button.is_correct = i.correct
		answer_buttons_container.add_child(button)
		button.pressed.connect(_check_correctness.bind(button.is_correct))

func _check_correctness(is_correct: bool) -> void:
	if is_correct:
		popup_label.text = "Correct answer!"
	else:
		popup_label.text = "Wrong answer!"
	popup.visible = true

func _on_next_question_button_pressed():
	Global.load_next_question()
