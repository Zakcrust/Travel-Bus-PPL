extends Node

func _ready():
	get_tree().paused = true
	$HTTPRequest.request("https://balahu.space/caribis/api/bis")
	
var current_cities : Dictionary = {
	"source" : "",
	"destionation" : ""
}

var fasilitas : Dictionary = {
	"1" : {
		"name" : "Stop Kontak",
		"image" : "res://Assets/Logo/Stopkontak.png"
	},
	"2" : {
		"name" : "Makanan dan Minuman",
		"image" : "res://Assets/Logo/Makanan.png"
	},
	"3" : {
		"name" : "AC",
		"image" : "res://Assets/Logo/AC.png"
	},
	"4" : {
		"name" : "Hiburan",
		"image" : "res://Assets/Logo/Hiburan Personal.png"
	},
	"5" : {
		"name" : "Bantal dan Selimut",
		"image" : "res://Assets/Logo/Selimut.png"
	},
	"6" : {
		"name" : "Bagasi",
		"image" : "res://Assets/Logo/Bagasi.png"
	},
	"7" : {
		"name" : "Kursi Recliner",
		"image" : "res://Assets/Logo/Kursi Recliner.png"
	},
	"8" : {
		"name" : "Ruang Merokok",
		"image" : "res://Assets/Logo/Ruang Merokok.png"
	},
	"9" : {
		"name" : "Sandaran Kaki",
		"image" : "res://Assets/Logo/Sandaran Kaki.png"
	},
	"10" : {
		"name" : "Toilet",
		"image" : "res://Assets/Logo/Toilet.png"
	},
	"11" : {
		"name" : "Tempat Istirahat",
		"image" : "res://Assets/Logo/Tempat Istirahat.png"
	}
}

var current_route : Array
var bus_list
var current_bus_ids : Array
var current_bus : Dictionary

func reset_data() -> void:
	current_cities = {
		"source" : "",
		"destionation" : ""
	}
	current_bus_ids = []
	current_bus = {}
	current_route = []

func set_bus_list() -> void:
	print(current_route.size())
#	if current_route.size() > 4:
#		for route in current_route:
#			if route.has("id_bis"):
#				current_bus_ids.append(current_route[route]["id_bis"])
#				print("Bus ids : %s " % current_bus_ids)
#	else:
#		if current_route.has("id_bis"):
#			current_bus_ids.append(current_route["id_bis"])
#			print("Bus ids : %s " % current_bus_ids)
	for route in current_route:
		if route.has("id_bis"):
			current_bus_ids.append(route["id_bis"])
			print("Bus ids : %s " % current_bus_ids.size())
			

func set_current_route(route : Array) -> void:
	current_route = route
	set_bus_list()

func get_bus_ids() -> Array:
	return current_bus_ids

func find_bus(bus_id) -> Dictionary:
		for bus in bus_list:
			if bus.has("id"):
				if bus["id"] == bus_id:
					return bus
		
		return {}

func get_current_route():
	return current_route
	
func set_current_cities(source : String, destination : String) -> void:
	current_cities["source"] = source
	current_cities["destination"] = destination

func get_current_cities():
	return current_cities

func set_current_bus(value : Dictionary) -> void:
	current_bus = value

func get_current_bus() -> Dictionary:
	return current_bus

func get_fasilitas_list() -> Array:
	return current_bus["fasilitas"].split(",", true)

func find_and_get_fasilitas(id : String) -> Dictionary:
	if fasilitas.has(id):
		return fasilitas[id]
	return {}

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	get_tree().paused = false
	bus_list = json.result
