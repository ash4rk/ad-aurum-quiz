extends Control

var localizationIndex = 0
var localizations = ["en", "ru"]
var flags = {
	"en": preload("res://assets/locales/uk_flag.png"),
	"ru": preload("res://assets/locales/ru_flag.png"),
}

func _ready():
	TranslationServer.set_locale("en")

func _on_pressed():
	localizationIndex = (localizationIndex + 1) % localizations.size()

	self.texture_normal = flags[localizations[localizationIndex]]
	TranslationServer.set_locale(localizations[localizationIndex])
	Global.load_questions()

func _on_mouse_entered():
	self.modulate = Color(1.0, 1.0, 1.0, 0.7)

func _on_mouse_exited():
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)
