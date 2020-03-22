extends Control

enum state {
	ASAL,
	TUJUAN,
	CONFIRM
	}

var action_state = state.ASAL

func _ready():
	action_process()
	$Button.hide()

func action_process():
	if action_state == state.ASAL:
		_set_text("Pilih Kota asal")
	elif action_state == state.TUJUAN:
		_set_text("Pilih Kota tujuan")
	elif action_state == state.CONFIRM:
		_set_text("Tekan tombol OK")
		$Button.show()

func change_state(st):
	action_state = st
	action_process()

func _set_text(text):
	$Label.text = str(text)
	$Label.rect_position.x = 512 - ($Label.rect_size.x / 2)

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/DetailInfo.tscn")
