extends Control

var text := "" setget set_text
onready var status_label := $MarginContainer/Label

func _ready() -> void:
	self.text = ""


func set_text(value: String) -> void:
	text = value
	if status_label:
		status_label.text = value
