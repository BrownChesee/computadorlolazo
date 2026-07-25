extends Button
signal presionado


func _on_pressed():
	position.x = randi_range(0,1800)
	position.y = randi_range(0,1000)
	emit_signal("presionado")
	if Loads.sfx == false:
		$sound.play()



func _ready():
	position.x = randi_range(0,1800)
	position.y = randi_range(0,1000)
