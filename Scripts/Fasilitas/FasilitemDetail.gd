extends Control


var fasilitas_list = DataManager.get_fasilitas_list()
var fasilitas_item = preload("res://Scenes/Fasilitas/FasilitasItem.tscn")

var fasilitas_container : Array
var fasilitas_container_id = 0

func _ready():
	_generate_fasilitas(fasilitas_list)

func _generate_fasilitas(list : Array) -> void:
	for id in list:
		var fasilitas = DataManager.find_and_get_fasilitas(id)
		var new_fasilitas = fasilitas_item.instance()
		new_fasilitas.set_name(fasilitas["name"])
		new_fasilitas.set_img(fasilitas["image"])
		fasilitas_container.append(new_fasilitas)
		add_child(new_fasilitas)
	show_container(0)


func show_container(id : int) -> void:
	for container in fasilitas_container:
		container.hide()
	fasilitas_container[id].show()
	check_shown_container()


func check_shown_container() -> void:
	$Left.show()
	$Right.show()
	if fasilitas_container_id == 0:
		$Left.hide()
	elif fasilitas_container_id == fasilitas_container.size() - 1:
		$Right.hide()


func _on_Left_pressed():
	fasilitas_container_id -= 1
	show_container(fasilitas_container_id)


func _on_Right_pressed():
	fasilitas_container_id += 1
	show_container(fasilitas_container_id)


func _on_Kembali_pressed():
	get_tree().change_scene("res://Scenes/Detail/DetailInfo.tscn")
