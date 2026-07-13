extends Area2D
var velocidad = 0


func _on_timer_timeout():
	position.x = randi_range(200,1800)
	position.y = 1300 * randi_range(0,1)
	if position.y > 1:
		velocidad = 500
	else:
		velocidad = -500


func _process(delta):
	var blink = randi_range(1,75)
	position.y -= velocidad * delta
	if blink >= 74:
		$Sprite2D/AnimationPlayer.play("blink")
