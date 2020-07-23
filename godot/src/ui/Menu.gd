# Abstract class for UI menus. 
class_name Menu
extends Control

signal menu_opened
signal menu_closed

var is_enabled := true setget set_is_enabled

var status := "" setget set_status

func open() -> void:
	show()
	emit_signal("menu_opened")


func close() -> void:
	hide()
	emit_signal("menu_closed")


func reset() -> void:
	pass


func set_is_enabled(value: bool) -> void:
	is_enabled = value


func set_status(value: String) -> void:
	status = value
