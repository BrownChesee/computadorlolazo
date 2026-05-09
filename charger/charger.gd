extends Button
signal presionado


func _on_pressed():
	position.x = randi_range(0,1000)
	position.y = randi_range(0,550)
	emit_signal("presionado")
