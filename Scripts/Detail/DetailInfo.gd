extends Node2D

var current_bus = DataManager.get_current_bus()

var current_cites = DataManager.get_current_cities()

func _ready():
	init_data()

func init_data():
	$"box-300x300/HargaText".text 		= "Rp. %s" % current_bus["harga"]
	$Via/ViaText.text 					= current_bus["via"]
	$Via/AreaTujuan/TujuanText.text 	= current_cites["destination"]
	$Via/Asal/AsalText.text				= current_cites["source"]
	$"box-800x300/DeskripsiText".text 	= current_bus["deskripsi"]


func _on_DetailInfo_pressed():
	var bus_detail = preload("res://Scenes/Bus/BusDetail.tscn")
	add_child(bus_detail.instance())
	pass
