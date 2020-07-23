extends MenuList

onready var login_form := $LoginForm
onready var register_form := $RegisterForm

func _ready() -> void:
	self.menu_current = login_form

func set_status(value: String) -> void:
	status = value

func reset() -> void:
	self.status = ""
	for child in get_children():
		child.reset()
	self.menu_current = login_form
	is_enabled = true


func _on_LoginForm_register_pressed():
	self.menu_current = register_form


func _on_RegisterForm_login_pressed():
	self.menu_current = login_form
