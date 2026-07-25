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
		emit_signal("HYD")
	$SHB.start()



func _on_button_pressed():
	var sonido = randi_range(1,4)
	click -= 1
	$Area2D/Sprite2D/AnimationPlayer.stop()
	$Area2D/Sprite2D/AnimationPlayer.play("punched")

	if click <= 0:
		$Area2D/Sprite2D/AnimationPlayer.play("move")
		$Area2D/Button.set_deferred("disabled",true)
	if Loads.sfx == false:
		if sonido == 1:
			$sonidos/metal1.play()
		if sonido == 2:
			$sonidos/metal2.play()
		if sonido == 3:
			$sonidos/metal3.play()
		if sonido == 4:
			$sonidos/metal4.play()





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
