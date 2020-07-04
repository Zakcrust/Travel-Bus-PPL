extends Control

func set_name(value : String) -> void:
	$Text.text = value
	$Text.rect_position.x = (1280 - $Text.rect_size.x)/2
	$Text.rect_position.y = (680 - $Text.rect_size.y)/2 + 50

func set_img(value : String) -> void:
	$Image.texture = load(value)
	$Image.rect_position.x = (1280 - ($Image.rect_size.x * 2))/2
	$Image.rect_position.y = (680 - ($Image.rect_size.y * 2))/2 - 50
