extends Node2D

var current_bus = DataManager.get_current_bus()

var current_cites = DataManager.get_current_cities()

func _ready():
	init_data()

func init_data():
	var deskripsi = "Ini adalah Bis %s dengan harga tiket Rp %s. Bis ini berangkat dari %s menuju ke %s melalui %s." % [current_bus["nama"], 
					current_bus["harga"],
					current_cites["source"],
					current_cites["destination"],
					[current_bus["via"]]]
	var image = Image.new()
	var raw_image = Marshalls.base64_to_raw(current_bus["foto"])
	image.load_jpg_from_buffer(raw_image)
	var img_texture = ImageTexture.new()
	img_texture.create_from_image(image)
	$"box-300x300/HargaText".text 		= "Rp. %s" % current_bus["harga"]
	$Via/ViaText.text 					= current_bus["via"]
	$Via/AreaTujuan/TujuanText.text 	= current_cites["destination"]
	$Via/Asal/AsalText.text				= current_cites["source"]
	$Deskripsi/DeskripsiText.text 	= current_bus["deskripsi"]
	$"box-300x300/Image".texture	= img_texture

func _on_DetailInfo_pressed():
	var bus_detail = preload("res://Scenes/Bus/BusDetail.tscn")
	add_child(bus_detail.instance())


func _on_FasilitasButton_pressed():
	var fasilitas_detail = preload("res://Scenes/Fasilitas/FasilitemDetail.tscn")
#	add_child(fasilitas_detail.instance())
	get_tree().change_scene("res://Scenes/Fasilitas/FasilitemDetail.tscn")


func _on_RestartButton_pressed():
	DataManager.reset_data()
	get_tree().change_scene("res://Scenes/Map.tscn")
