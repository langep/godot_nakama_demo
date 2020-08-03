# Abstract holder class for `Menu` objects. This ensures that only one `Menu`
# is visible at a time. Detects child notes of type `Menu` only so one can
# still show popups or other overlays on top of the active menu.
class_name MenuList
extends Control


var status := "" setget set_status
var is_enabled := true setget set_is_enabled
# Active menu, visible on screen when set
var menu_current: Menu setget set_menu_current

var _menus := []


func _ready() -> void:
	for child in get_children():
		if child is Menu:
			_menus.append(child)


func set_is_enabled(value: bool) -> void:
	is_enabled = value
	menu_current.is_enabled = is_enabled


func set_menu_current(value: Menu) -> void:
	menu_current = value
	if not menu_current:
		return

	for menu in _menus:
		menu.close()
	menu_current.open()
	menu_current.is_enabled = is_enabled


# Updates the status panel of the active menu.
func set_status(text: String) -> void:
	menu_current.status = text
