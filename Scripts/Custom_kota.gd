extends "res://Scenes/Kota.gd"

export (String) var nama_kota = ""

func _ready():
	var prop = {
		"nama" : nama_kota,
		"position" : position
		}
	._init_property(prop)
	._ready()
