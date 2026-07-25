extends Area2D
var seing = false
var click
signal bst_frnds


func _ready():
	set_deferred("visible",false)
	$gtcha.start()


func _on_gtcha_timeout():
	set_deferred("visible",true)
	$Sprite2D.frame = 2
	$Timer.start()



func _on_timer_2_timeout():
	seing = false
	set_deferred("visible",false)
	$gtcha.start()
	$Sprite2D/AnimationPlayer.stop()
	$Sprite2D.frame = 2

func _process(_delta):
	click = Input.is_action_just_pressed("click")
	if seing and click:
		emit_signal("bst_frnds")


func _on_timer_timeout():
	seing = true
	if Loads.sfx == false:
		$Sprite2D/AnimationPlayer.play("laugh")
	else:
		$Sprite2D/AnimationPlayer.play("laugh_mute")
	$Timer2.start()


