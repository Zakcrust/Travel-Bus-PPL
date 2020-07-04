extends Node2D

class_name Kota

signal send_data(data)

var selected : bool = false

var properties = {
				"nama" : "",
				"position" : position,
				"value" : 0
	}

func _init_property(prop):
	properties = prop
	$Label.text = properties.nama
	$Label.rect_position.x = -($Label.rect_size.x / 2)
	$Label.hide()
	pass

func _ready():
	update()
	print(properties)

func _on_Kota_draw():
	draw_circle(Vector2(),6, Color.coral)
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	$Label.show()
	print("mouse entered")
	pass # Replace with function body.
	
func _on_Area2D_mouse_exited():
	$Label.hide()
	print("mouse exited")
	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and not selected:
			print("clicked")
			emit_signal("send_data",properties)
			selected = true
			$Image.hide()
		
func get_name_by_value(value : int) -> String:
	if properties["value"] == value:
		return properties["nama"]
	return ""

func is_selected() -> bool:
	return selected


func set_selected(value : bool) -> void:
	selected = false
