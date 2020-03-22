extends Node2D

func _ready():
	for city in $Cities.get_children():
		city.connect("send_data",$Menu,"cities_data")
		pass
	pass