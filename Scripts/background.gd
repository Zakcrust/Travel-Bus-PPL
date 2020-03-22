extends Sprite

func _process(delta):
	
	if position.x < -1500:
		position.x = 7342
		var rand_i = randi()%100 + 1
		if rand_i > 50:
			flip_h = !flip_h
	pass
