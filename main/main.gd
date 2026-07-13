extends Node
var cursor = 0
signal camara_izquierda 
signal camara_derecha


func _ready():
	$Label.text = str("")
	$PantallaPricipal.set_deferred("Visible",true)


func perder():
	$Label.text = str("perdiste")
	$PantallaPricipal.set_deferred("Visible",false)


func _process(delta):
	$Sprite2D.z_index = 101
