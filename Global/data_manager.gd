extends Node

func _ready():
	$HTTPRequest.request("http://127.0.0.1:80/caribis/api/bis")
	
var current_cities : Dictionary = {
	"source" : "",
	"destionation" : ""
}

var current_route : Dictionary
var bus_list
var current_bus_ids : Array
var current_bus : Dictionary

func set_bus_list() -> void:
	print(current_route.size())
	if current_route.size() > 4:
		for route in current_route:
			if route.has("id_bis"):
				current_bus_ids.append(current_route[route]["id_bis"])
				print("Bus ids : %s " % current_bus_ids)
	else:
		if current_route.has("id_bis"):
			current_bus_ids.append(current_route["id_bis"])
			print("Bus ids : %s " % current_bus_ids)

func set_current_route(route : Dictionary) -> void:
	current_route = route
	set_bus_list()

func get_bus_ids() -> Array:
	return current_bus_ids

func find_bus(bus_id) -> Dictionary:
	if bus_list.size() > 8:
		for bus in bus_list:
			if bus.has("id"):
				if bus_list[bus]["id"] == bus_id:
					return bus_list[bus]
	else:
		if bus_list.has("id"):
			if bus_list["id"] == bus_id:
				return bus_list
				
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

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	bus_list = json.result[0]
