extends Control

func _ready():
	var current_bus = DataManager.get_current_bus()
	$Text.text = current_bus["detail_deskripsi"]

func _on_BackButton_pressed():
	queue_free()
