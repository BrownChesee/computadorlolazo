extends Area2D
signal hppy
var looking = false
var hey = Input.is_action_pressed("click")


func _ready():
	set_deferred("visible",false)


func _on_timer_timeout():
	set_deferred("visible",true)
	$AnimationPlayer.play("moving")


func _on_animation_player_animation_finished(moving):
	looking = true
	$bored.start()

func _on_bored_timeout():
	set_deferred("visible",false)
	looking = false


func _process(delta):
	if looking and hey:
		emit_signal("hppy")
		print_debug("hppy")
