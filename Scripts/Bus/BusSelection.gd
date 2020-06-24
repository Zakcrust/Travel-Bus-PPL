extends Control


var init_position = Vector2(256, 96)

var bus_item = preload("res://Scenes/Bus/BusItem.tscn")

var pages = []

func _ready():
	create_kota_list(DataManager.get_bus_ids())

func create_kota_list(data):
	var current_position = init_position
	var counter = 0
	var current_page = Control.new()
	var current_bus
	for bus in data:
		current_bus  = bus_item.instance()
		current_bus.rect_position = current_position
		var bus_data = DataManager.find_bus(bus)
		current_bus.set_data(bus_data)
		current_bus.set_name(bus_data["nama"])
		current_page.add_child(current_bus)
		current_position += Vector2(0, 96)
		counter += 1
		if counter == 4:
			pages.append(current_page)
			add_child(current_page)
			current_page = Control.new()
			current_position = init_position
			counter = 0
	if counter != 4:
		pages.append(current_page)
		add_child(current_page)
