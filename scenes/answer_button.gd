extends Button

class_name AnswerButton

var answer_text: String
var is_correct: bool

func _ready():
	self.text = answer_text

func check_button():
	if is_correct:
		$AnimationPlayer.play("green_blinking")
	if not is_correct and button_pressed:
		self.modulate = Color.DARK_RED
