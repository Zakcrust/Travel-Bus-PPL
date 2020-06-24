extends TextureButton

var data : Dictionary

func set_data(value : Dictionary) -> void:
	data = value


func get_data() -> Dictionary:
	return data


func set_name(name):
	$Nama.text = name


func _on_BusItem_pressed():
	DataManager.set_current_bus(data)
	get_tree().change_scene("res://Scenes/Detail/DetailInfo.tscn")
