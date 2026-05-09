extends Node
var cursor = 0


func _ready():
	$Label.text = str("")
	$PantallaPricipal.set_deferred("Visible",true)


func perder():
	$Label.text = str("perdiste")
	$PantallaPricipal.set_deferred("Visible",false)


func _process(delta):
	var a = Input.is_action_pressed("A")
	var d = Input.is_action_pressed("D")
	if a:
		$Camera2D.position.x -= 300 * delta 
	if d:
		$Camera2D.position.x += 300 * delta
	if $Camera2D.position.x > 500:
		$Camera2D.position.x = 500
	if $Camera2D.position.x < -500:
		$Camera2D.position.x = -500
