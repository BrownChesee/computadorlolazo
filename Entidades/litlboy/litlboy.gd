extends Area2D
var screensize = Vector2(1152,648)
signal hppy


func _on_mouse_entered():
	emit_signal("hppy")


func _on_timer_timeout():
	var tw = create_tween()
	tw.set_parallel()
	$AnimationPlayer.play("moving")
	$CollisionShape2D.set_deferred("disabled",true)
	tw.tween_property(self, "position" ,Vector2(randi_range(100,1000),randi_range(50,600)) ,0.4)
	$CollisionShape2D.set_deferred("disabled",false)


