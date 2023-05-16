extends Node

const QUESTION_SCREEN_PATH = "res://scenes/question_screen.tscn"
const QUESTIONS_JSON_PATH = "res://questions.json"

var _questions: Array
var _question_idx: int = -1

func _ready():
	var json_string = FileAccess.get_file_as_string(QUESTIONS_JSON_PATH)
	_questions = JSON.parse_string(json_string)

func load_next_question():
	_question_idx += 1
	
	if _question_idx >= _questions.size():
		#TODO: Open end game screen
		return
	
	if not SceneManager.is_transitioning:
		SceneManager.change_scene(
			QUESTION_SCREEN_PATH, {
				"pattern_enter": "fade",
				"pattern_leave": "squares",
				"on_tree_enter": func(scene): scene.question = _questions[_question_idx]
			}
		)
