extends Control


var init_position = Vector2(392, 96)

var bus_item = preload("res://Scenes/Bus/BusItem.tscn")

var pages = []

var current_page_id = 0

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
	if counter == 0:
		pages.append(current_page)
		add_child(current_page)
	show_page(0)


func check_page_id(id : int) -> void:
	$Left.show()
	$Right.show()
	if id == 0:
		$Left.hide()
	if id == pages.size() - 1:
		$Right.hide()

func show_page(id : int) -> void:
	for page in pages:
		page.hide()
	pages[id].show()
	check_page_id(id)


func _on_Left_pressed():
	current_page_id -= 1
	show_page(current_page_id)


func _on_Right_pressed():
	current_page_id += 1
	show_page(current_page_id)
