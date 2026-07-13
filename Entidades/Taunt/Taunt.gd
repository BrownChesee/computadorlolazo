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
	tw.tween_property(self, "position" ,Vector2(randi_range(100,1900),randi_range(100,1000)) ,0.4)
	if numero > randi_range(2,4):
		numero = 0
		if tauntlist[0] == "W":
			$Sprite2D.frame = 1
		if tauntlist[0] == "Q":
			$Sprite2D.frame = 2
		if tauntlist[0] == "E":
			$Sprite2D.frame = 3
		$Taunt.start()


func _on_taunt_timeout():
	if presionaste:
		presionaste = false
		$Sprite2D.frame = 0
	else:
		emit_signal("not_cool")


func _process(_delta):
	var input = Input.is_action_just_pressed(taunt)
	if input:
		presionaste = true
		$Sprite2D.frame = 4
