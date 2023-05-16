extends Node

const QUESTION_SCREEN_PATH = "res://scenes/question_screen.tscn"

func _ready():
	await SceneManager.scene_loaded

func _on_play_button_pressed():
	if not SceneManager.is_transitioning:
		SceneManager.change_scene(
			QUESTION_SCREEN_PATH, {
				"pattern_enter": "fade",
				"pattern_leave": "squares",
			#	"on_tree_enter": func(scene): scene.internal_variable += internal_variable
			}
		)
