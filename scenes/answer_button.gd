extends Button

class_name AnswerButton

var answer_text: String
var is_correct: bool

func _ready():
	self.text = answer_text
