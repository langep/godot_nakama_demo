extends Menu

signal register_pressed
signal login_pressed(email, password)

onready var status_panel := $StatusPanel
onready var email_field := $PanelContainer/MarginContainer/VBoxContainer/Email/LineEditValidate
onready var password_field := $PanelContainer/MarginContainer/VBoxContainer/Password/LineEditValidate
onready var login_button := $PanelContainer/MarginContainer/VBoxContainer/LoginButton
onready var register_button := $PanelContainer/MarginContainer/VBoxContainer/CenterContainer/RegisterButton

func _ready() -> void:
	reset()


func reset() -> void:
	.reset()
	self.status = ""
	password_field.text = ""
	email_field.text = ""


func set_status(text: String) -> void:
	.set_status(text)
	status_panel.text = text
	status_panel.visibility = text != ""


func set_is_enabled(value: bool) -> void:
	.set_is_enabled(value)
	if not email_field:
		yield(self, "ready")
	email_field.editable = is_enabled
	password_field.editable = is_enabled
	login_button.disabled = not is_enabled
	register_button.disabled = not is_enabled


func attempt_login() -> void:
	if not email_field.is_valid:
		set_status("The email address is not valid")
		return
	if password_field.text == "":
		set_status("Please enter your password to log in")
		return
	if password_field.text.length() < 8:
		set_status("The password should be at least 8 characters long")
		return

	emit_signal("login_pressed", email_field.text, password_field.text)
	set_status("Authenticating...")


func _on_LoginButton_pressed() -> void:
	attempt_login()


func _on_RegisterButton_pressed() -> void:
	emit_signal("register_pressed")


func _on_LoginForm_menu_opened() -> void:
	email_field.grab_focus()

