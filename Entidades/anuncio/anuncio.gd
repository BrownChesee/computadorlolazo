extends Button                 
signal muerto


func _ready():
	position.x = randi_range(0,1000)
	position.y = randi_range(0,600)
	$Sprite2D.frame = randi_range(0,12)


func _on_pressed():
	set_deferred("visible",false)
	if Loads.sfx == false:
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
	queue_free()
	emit_signal("muerto")
