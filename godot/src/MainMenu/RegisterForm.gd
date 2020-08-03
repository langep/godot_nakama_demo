extends Menu

signal register_pressed(email, password)
signal login_pressed

onready var status_panel := $StatusPanel
onready var email_field := $PanelContainer/MarginContainer/VBoxContainer/Email/LineEditValidate
onready var password_field := $PanelContainer/MarginContainer/VBoxContainer/Password/LineEditValidate
onready var repeat_password_field = $PanelContainer/MarginContainer/VBoxContainer/RepeatPassword/LineEditValidate

func _ready() -> void:
	reset()
	

func reset() -> void:
	.reset()
	self.status = ""
	email_field.text = ""
	password_field.text = ""
	repeat_password_field.text = ""
	

func set_status(text: String) -> void:
	.set_status(text)
	status_panel.text = text
	status_panel.visibility = text != ""

func attempt_register() -> void:
	if email_field.text.empty():
		set_status("Email cannot be empty")
		return
	elif password_field.text.empty() or repeat_password_field.text.empty():
		set_status("Password cannot be empty")
		return
	elif password_field.text.similarity(repeat_password_field.text) != 1:
		set_status("Passwords do not match")
		return
		
	emit_signal("register_pressed", email_field.text, password_field.text)
	set_status("Registering...")


func _on_LoginButton_pressed():
	emit_signal("login_pressed")


func _on_RegisterForm_menu_opened():
	email_field.grab_focus()


func _on_RegisterButton_pressed():
	attempt_register()
