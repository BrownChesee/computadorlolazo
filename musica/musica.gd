extends AudioStreamPlayer
var canciones = [
	"res://musica/musica/2MUCH2BEAR - Five Nights at Frickbear's 3 OST [AmQZ6ehcfUk].mp3",
	"res://musica/musica/Fashion Overdrive (From Denshattack!) [ueeOIkBL2Pk].mp3",
	"res://musica/musica/Finger Lakes (Goldenfriedrich's Theme) - Five Nights at Friedrich's OST [bNIDRvFbS0Y].mp3",
	"res://musica/musica/Klagmar's Top VGM #4,231 - GLASS - The Rat Race [_Ws5e2ZE4sQ].mp3",
	"res://musica/musica/Untitled Tag Game OST ｜ SODA STREET [dmKRH8lY8-o].mp3"
]
var Bus = "New Bus"


func _ready():
	encontrar_cancion()
	if Loads.mutted == false:
		volume_db = -12




func _on_finished():
	encontrar_cancion() 


func encontrar_cancion():
	var cancion = randi_range(0,4)
	stream = load(canciones[cancion])
	play()


func _process(delta):
	if volume_db < 0:
		volume_db += 3 * delta
	if Loads.muffled == true:
		bus = Bus
	else:
		bus = "Master"
	if Loads.mutted == true:
		volume_db = -999
