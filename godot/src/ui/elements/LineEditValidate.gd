# Abstract class for text input validation. Overwrite
# the _validate method to validate the content on text change.
class_name LineEditValidate
extends LineEdit

var focus_normal: StyleBoxFlat = preload("res://assets/stylebox/button_focused.tres")
var focus_error: StyleBoxFlat = preload("res://assets/stylebox/button_focused_error.tres")

var is_valid := true setget set_is_valid
var is_focused := false

# Returns `true` if the text input is valid.
# Override this method in classes that extend `LineEditValidate`.
# @tags - virtual
func _validate(_text: String) -> bool:
	return true
	
func set_is_valid(value: bool) -> void:
	is_valid = value
	if is_valid or text == "":
		set("custom_styles/focus", focus_normal)
	else:
		set("custom_styles/focus", focus_error)


func _process(_delta):
	if self.is_focused and Input.is_key_pressed(KEY_CONTROL):
		if Input.is_key_pressed(KEY_A):
			self.select_all()


func _on_LineEditValidate_text_changed(new_text: String) -> void:
	self.is_valid = _validate(new_text)


func _on_LineEditValidate_focus_entered():
	self.is_focused = true
	self.is_valid = _validate(self.text)


func _on_LineEditValidate_focus_exited():
	self.is_focused = false
	self.deselect()







