extends Area2D
var tauntlist = ["Q","W","E"]
var taunt = 0
var presionaste = false
var numero = 0
signal not_cool


func _ready():
	tauntlist.shuffle()
	taunt = tauntlist[0]


func _on_timer_timeout():
	$Timer.start()
	numero += 1
	tauntlist.shuffle()
	taunt = tauntlist[0]
	var tw = create_tween()
	tw.set_parallel().set_trans(Tween.TRANS_ELASTIC
	).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(self, "position" ,Vector2(randi_range(100,1000),randi_range(50,600)) ,0.4)
	if numero > randi_range(2,4):
		numero = 0
		$Label.text = str(taunt)
		$Taunt.start()


func _on_taunt_timeout():
	if presionaste:
		presionaste = false
		$Label.text = str("0_0")
	else:
		emit_signal("not_cool")


func _process(delta):
	var input = Input.is_action_just_pressed(taunt)
	if input:
		presionaste = true
		$Label.text = str(":)")
