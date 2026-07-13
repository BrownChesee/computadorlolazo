extends Node
var click = 5
signal HYD



func _ready():
	$SHB.start()
	$Area2D/Sprite2D/AnimationPlayer.play("wave")



func _on_shb_timeout():
	var SHB = randi_range(-1,0)
	$Area2D.position.y = 540
	$Label.set_deferred("visible",true)
	if SHB == -1:
		$Area2D.position.x = -80 - 256
	if SHB == 0:
		$Area2D.position.x = 2000+ 256
	if SHB == 0:
		$Area2D/Sprite2D.flip_h = false
		$Label.frame = 1
	if SHB == -1:
		$Area2D/Sprite2D.flip_h = true
		$Label.frame = 0
	click = 5
	$TTK.start()
	$Area2D/Sprite2D/AnimationPlayer.play("punch")




func _on_ttk_timeout():
	if click <= 0:
		pass
	else:
		print_debug("bro")
		emit_signal("HYD")
	$SHB.start()



func _on_button_pressed():
	click -= 1
	$Area2D/Sprite2D/AnimationPlayer.stop()
	$Area2D/Sprite2D/AnimationPlayer.play("punched")

	if click <= 0:
		$Area2D/Sprite2D/AnimationPlayer.play("move")
		$Area2D/Button.set_deferred("disabled",true)


func _process(_delta):
	if click <= 0:
		$Label.set_deferred("visible",false)
	else:
		$Area2D.set_deferred("visible",true)
		$Area2D/Button.set_deferred("disabled",false)
		$Area2D/Sprite2D.set_deferred("visible",true)


func _on_animation_player_animation_finished(punched):
	$Area2D/Sprite2D/AnimationPlayer.play("wave")


func _on_animation_player_animation_finished2(move):
	$Area2D/Sprite2D.set_deferred("visible",false)


func _on_animation_player_animation_finished3(punch):
	$Area2D/Sprite2D/AnimationPlayer.play("wave")
