extends Node
var cursor = 0
var tiempo:float
func _ready():
	$GameOver.set_deferred("visible",false)
	$GameOver/Label2.set_deferred("visible",false)
	$PantallaPricipal.set_deferred("Visible",true)
func perder():
	var enemigos = $Entidades.enemigos
	$PantallaPricipal.set_deferred("process_mode",PROCESS_MODE_PAUSABLE)
	$Entidades.set_deferred("process_mode",PROCESS_MODE_PAUSABLE)
	$Entidades/Node.set_deferred("process_mode",PROCESS_MODE_PAUSABLE)
	$GameOver/AnimationPlayer.play("game over")
	$AudioStreamPlayer.stop()
	$GameOver/Label2.text ="
	perdiste,sobreviviste " + str(tiempo) + " segundos 
	tuviste " + str(enemigos) + " enemigos, 
	apreta R para reiniciar"
	get_tree().paused = true
func _process(delta):
	$Sprite2D.z_index = 101
	$GameOver.z_index = 102
	$GameOver/Label2.z_index = 103
	var R = Input.is_action_just_pressed("reset")
	if R:
		get_tree().paused = false
		Loads.load_title()

func _on_timer_timeout():
	tiempo += 1
