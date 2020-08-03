extends Node

onready var login_and_register := $CanvasLayer/LoginAndRegister

func _on_LoginAndRegister_login_pressed(email, password):
	pass # Replace with function body.


func _on_LoginAndRegister_register_pressed(email, password):
	login_and_register.status = "Authenticating..."
	login_and_register.is_enabled = false
