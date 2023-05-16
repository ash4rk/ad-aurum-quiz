extends Node

const ANSWER_CHECKBOX_SCENE = preload("res://scenes/answer_checkbox.tscn")

var question: Dictionary

@onready var question_label = $CanvasLayer/PanelContainer/QuestionLabel
@onready var bg = $CanvasLayer/BG
@onready var answer_checkboxes_container = $CanvasLayer/PanelContainer2/VBoxContainer/AnswerButtonsContainer
@onready var popup: FalseCorrectPopup = $CanvasLayer/FalseCorrectPopup
@onready var next_button = $CanvasLayer/FalseCorrectPopup/PanelContainer/VBoxContainer/NextQuestionButton

func _ready():
	bg.texture = load("res://" + question.background)
	question_label.text = question.question
	_init_answer_checkboxes(question.answers)

func _process(delta):
	next_button.disabled = SceneManager.is_transitioning

func _init_answer_checkboxes(answers: Array) -> void:
	for answer in answers:
		var button: AnswerButton = ANSWER_CHECKBOX_SCENE.instantiate()
		button.answer_text = answer.text
		button.is_correct = answer.correct
		answer_checkboxes_container.add_child(button)

func _check_correctness() -> void:
	for answer in answer_checkboxes_container.get_children():
		if (not answer.is_correct and answer.button_pressed) or (answer.is_correct and not answer.button_pressed):
			popup.show_wrong()
			return
	Global.correct_answers += 1
	popup.show_correct()

