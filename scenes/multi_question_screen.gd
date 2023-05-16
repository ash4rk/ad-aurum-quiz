extends Node

signal check_correctness
const ANSWER_CHECKBOX_SCENE = preload("res://scenes/answer_checkbox.tscn")

var question: Dictionary

@onready var question_label = $CanvasLayer/PanelContainer/QuestionLabel
@onready var bg = $CanvasLayer/BG
@onready var answer_checkboxes_container = $CanvasLayer/PanelContainer2/VBoxContainer/AnswerCheckBoxesContainer
@onready var popup: FalseCorrectPopup = $CanvasLayer/FalseCorrectPopup
@onready var next_button = $CanvasLayer/FalseCorrectPopup/PanelContainer/VBoxContainer/NextQuestionButton

func _ready():
	bg.texture = load("res://" + question.background)
	question_label.text = question.question
	_init_answer_checkboxes(question.answers)

func _process(_delta):
	next_button.disabled = SceneManager.is_transitioning

func _init_answer_checkboxes(answers: Array) -> void:
	for answer in answers:
		var check: AnswerButton = ANSWER_CHECKBOX_SCENE.instantiate()
		check.answer_text = answer.text
		check.is_correct = answer.correct
		answer_checkboxes_container.add_child(check)
		check_correctness.connect(check.check_button)

func _check_correctness() -> void:
	check_correctness.emit()
	for check in answer_checkboxes_container.get_children():
		if (not check.is_correct and check.button_pressed) or (check.is_correct and not check.button_pressed):
			popup.show_wrong()
			return
	Global.correct_answers += 1
	popup.show_correct()

