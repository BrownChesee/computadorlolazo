extends Node
var supervivencia = 100
signal perdiste


func _on_button_presionado():
	supervivencia += 5
	$supervivencia.text = str(supervivencia)


func _on_timer_timeout():
	supervivencia -= 1
	$supervivencia.text = str(supervivencia)
	if supervivencia < 0:
		emit_signal("perdiste")


func _process(delta):
	if Loads.sfx == false:
		if supervivencia < 30 and $Heartbeat.playing == false:
			$Heartbeat.play()
