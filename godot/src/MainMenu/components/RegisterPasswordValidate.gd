extends LineEditValidate

func _validate(_text: String) -> bool:
	return _text.length() > 8
