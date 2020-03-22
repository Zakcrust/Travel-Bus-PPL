extends Node2D

signal send_data(data)

var properties = {
				"nama" : "",
				"position" : position
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
		if event.pressed:
			print("clicked")
			emit_signal("send_data",properties)
	pass # Replace with function body.
