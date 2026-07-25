extends Area2D
var virus = 0
signal perdiste

 
func _process(delta):
	virus += 1 * delta
	var abajo = Input.is_action_just_pressed("punch")
	if abajo:
		if Loads.sfx == false:
			$punch.play()
		position.y += 100
	if virus > 3:
		virus = 0
		emit_signal("perdiste")
func _on_visible_on_screen_notifier_2d_screen_exited():
	virus = 0
	queue_free()


func _ready():
	$skull/AnimationPlayer.play("cry")
