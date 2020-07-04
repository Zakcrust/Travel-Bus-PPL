extends Kota

export (String) var nama_kota = ""
export (int) var value = 0
func _ready():
	var prop = {
		"nama" 		: nama_kota,
		"position"  : position,
		"value"     : value
		}
	._init_property(prop)
	._ready()


func set_marker(value : bool) -> void:
	$Image.visible = value
