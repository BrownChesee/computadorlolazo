extends Control
var boton_mut = "res://title/Sprite-music2.png"
var boton_mus = "res://title/Sprite-music1.png"
var boton_sfxs = "res://title/Sprite-sound1.png"
var boton_sfxm = "res://title/Sprite-sound2.png"


func _on_timer_timeout():
	$Sprite2D/FrameChanger.start()
	$Sprite2D/AnimationPlayer.play("fade_out")
func _on_frame_changer_timeout():
	$Sprite2D.frame = randi_range(0,2)
func _on_animation_player_animation_finished(_fade_out):
	$Timer.start()
func _on_button_pressed():
	Loads.load_main()
func _on_musica_pressed():
	if Loads.mutted == false:
		Loads.mutted = true
		$musica.icon = load(boton_mut)
	else:
		Loads.mutted = false
		$musica.icon = load(boton_mus)
func _on_ready():
	if Loads.mutted == false:
		$musica.icon = load(boton_mus)
	else:
		$musica.icon = load(boton_mut)
	if Loads.sfx == false:
		$sonido.icon = load(boton_sfxs)
	else:
		$sonido.icon = load(boton_sfxm)
func _on_sonido_pressed():
	if Loads.sfx == false:
		Loads.sfx = true
		$sonido.icon = load(boton_sfxm)
	else:
		Loads.sfx = false
		$sonido.icon = load(boton_sfxs)
func _on_static_timeout():
	$static.texture.noise.seed = randi_range(1,8)
func _process(delta):
	if Loads.mutted == true:
		$musica2.volume_db = -999
	else:
		$musica2.volume_db = 0

	if $musica2.playing == false:
		$musica2.play()
