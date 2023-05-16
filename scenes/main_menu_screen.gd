extends Node

const QUESTION_SCREEN_PATH = "res://scenes/question_screen.tscn"

func _ready():
	await SceneManager.scene_loaded

func _on_play_button_pressed():
	Global.load_next_screen()
