extends Node

const QUESTION_SCREEN_PATH = "res://scenes/question_screen.tscn"
const MULTI_QUESTION_SCREEN_PATH = "res://scenes/multi_question_screen.tscn"
const END_GAME_SCREEN_PATH = "res://scenes/end_game_screen.tscn"
const QUESTIONS_JSON_PATH = "res://questions.json"

var _questions: Array
var _question_idx: int = -1
var correct_answers: = 0
var answers_number_display: int = 4

func _ready():
	var json_string = FileAccess.get_file_as_string(QUESTIONS_JSON_PATH)
	_questions = JSON.parse_string(json_string)

func load_next_screen():
	_question_idx += 1
	if _question_idx >= _questions.size():
		_load_eng_game_screen()
		return
		
	var next_question: Dictionary = _filter_by_answers_number(_questions[_question_idx])
	
	if _count_correct_answers(next_question.answers) > 1:
		_load_next_multi_question(next_question)
	else:
		_load_next_question(next_question)

func reset_game():
	_question_idx = -1
	correct_answers = 0

func _filter_by_answers_number(question: Dictionary) -> Dictionary:
	var result_question: Dictionary
	# Pop first correct answer from question.answers
	var first_correct_answer = question.answers.pop_at(_get_first_correct_idx(question.answers))
	# Add one correct answer
	result_question.answers = [first_correct_answer]
	# Fill another answers
	for i in range(answers_number_display-1):
		result_question.answers.push_back(question.answers[i])
	# Add other fields to question
	result_question.question = question.question
	result_question.background = question.background
	return result_question

func _get_first_correct_idx(answers: Array) -> int:
	for i in range(answers.size()):
		if answers[i].correct:
			return i
	assert(false, "ERROR: Question does not have a single correct answer.")
	return 0

func _pass_end_game_params(scene): 
	scene.correct_answers = correct_answers
	scene.number_of_questions = _questions.size()

func _count_correct_answers(answers: Array) -> int:
	var result: int = 0
	for i in answers:
		if i.correct:
			result += 1
	return result

func _load_eng_game_screen():
	if not SceneManager.is_transitioning:
		SceneManager.change_scene(
			END_GAME_SCREEN_PATH, {
				"pattern_enter": "fade",
				"pattern_leave": "squares",
				"on_tree_enter": func(scene): _pass_end_game_params(scene)
			}
		)

func _load_next_question(question: Dictionary):
	if not SceneManager.is_transitioning:
		SceneManager.change_scene(
			QUESTION_SCREEN_PATH, {
				"pattern_enter": "fade",
				"pattern_leave": "squares",
				"on_tree_enter": func(scene): scene.question = question
			}
		)

func _load_next_multi_question(question: Dictionary):
	if not SceneManager.is_transitioning:
		SceneManager.change_scene(
			MULTI_QUESTION_SCREEN_PATH, {
				"pattern_enter": "fade",
				"pattern_leave": "squares",
				"on_tree_enter": func(scene): scene.question = question
			}
		)
