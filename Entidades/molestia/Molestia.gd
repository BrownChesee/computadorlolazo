extends Area2D
var velocidad = 0


func _on_timer_timeout():
	position.x = randi_range(100,1000)
	position.y = 648 * randi_range(0,1)
	if position.y > 1:
		velocidad = 300
	else:
		velocidad = -300


func _process(delta):
	position.y -= velocidad * delta
