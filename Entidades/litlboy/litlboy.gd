extends Area2D
var seing = false
var click
signal bst_frnds


func _ready():
	set_deferred("visible",false)
	$gtcha.start()


func _on_gtcha_timeout():
	set_deferred("visible",true)
	$AnimatedSprite2D.play("new_animation")
	$Timer.start()



func _on_timer_2_timeout():
	seing = false
	set_deferred("visible",false)
	$gtcha.start()
	$AnimatedSprite2D.play("new_animation")

func _process(_delta):
	click = Input.is_action_just_pressed("click")
	if seing and click:
		print_debug("no")
		emit_signal("bst_frnds")


func _on_timer_timeout():
	seing = true
	$Timer2.start()
	$AnimatedSprite2D.play("laugh")

