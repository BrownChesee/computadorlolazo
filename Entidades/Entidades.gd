extends Node
var numero = -10
var enemigos = 0
@export var anuncio_scene:PackedScene
@export var skull_scene:PackedScene
@export var taunt_scene:PackedScene
@export var wiresea_scene:PackedScene
@export var litlboy_scene:PackedScene
@export var PCM_scene:PackedScene
signal perdiste2
signal taunt


func _on_anuncio_timeout():
	var a = anuncio_scene.instantiate()
	add_child(a)


func _on_skull_timeout():
	var s := skull_scene.instantiate()
	s.connect("perdiste", Callable(self, "peldite"))
	add_child(s)
	$skull.start(randi_range(8,11))



func _on_node_anuncio():
	$anuncio.start()
	enemigos += 1


func _on_node_molestia():
	$Molestia.set_deferred("visible",true)
	enemigos += 1


func _ready():
	$Molestia.set_deferred("visible",false)


func _on_node_skull():
	$skull.start()
	enemigos += 1


func peldite():
	emit_signal("perdiste2")



func _on_node_taunt():
	var t = taunt_scene.instantiate()
	add_child(t)
	t.connect("not_cool",Callable(self,"peldite"))
	enemigos += 1


func _on_node_wiresea():
	var w = wiresea_scene.instantiate()
	add_child(w)
	w.connect("ABANDONED",Callable(self, "peldite"))
	w.z_index = 100
	enemigos += 1


func _on_node_litlboy():
	var l = litlboy_scene.instantiate()
	add_child(l)
	l.connect("bst_frnds",Callable(self,"peldite"))
	enemigos += 1


func _on_node_pcm():
	var p = PCM_scene.instantiate()
	add_child(p)
	p.connect("HYD",Callable(self,"peldite"))
	enemigos += 1
