extends Control

const RU_FLAG_PIC = preload("res://assets/locales/ru_flag.png")
const UK_FLAG_PIC = preload("res://assets/locales/uk_flag.png")

func _ready():
	TranslationServer.set_locale(TranslationServer.get_locale())
	_update_flag_picture(TranslationServer.get_locale())

func _on_pressed():
	var new_locale: String
	if TranslationServer.get_locale().contains('en'):
		new_locale = "ru"
	else:
		new_locale = "en"
		
	TranslationServer.set_locale(new_locale)
	_update_flag_picture(new_locale)

func _update_flag_picture(locale: String):
	match locale:
		"ru":
			self.texture_normal = RU_FLAG_PIC
		"en":
			self.texture_normal = UK_FLAG_PIC

func _on_mouse_entered():
	self.modulate = Color(1.0, 1.0, 1.0, 0.7)

func _on_mouse_exited():
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)
