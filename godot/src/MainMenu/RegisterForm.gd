extends Menu

signal login_pressed

onready var status_panel := $StatusPanel

func reset() -> void:
	.reset()
	self.status = ""

func set_status(text: String) -> void:
	.set_status(text)
	status_panel.text = text



func _on_LoginButton_pressed():
	emit_signal("login_pressed")
