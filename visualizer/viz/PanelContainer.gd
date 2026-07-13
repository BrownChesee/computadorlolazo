extends PanelContainer
var spectrum = AudioEffectSpectrumAnalyzerInstance

const BAR_COUNT:float  =32
const FREQ_MAX = 11050
const MIN_DB = 60
var heigths: Array[heigth] = []
var bar_width = 0.0
class heigth:
	var high:float 
	var low:float
	var actual:float

func _ready():
	_on_resized()
	spectrum = AudioServer.get_bus_effect_instance(1,0)
	for i in BAR_COUNT:
		heigths.append(heigth.new())



func _draw():
	for i in BAR_COUNT:
		var l_color: Color = Color.from_hsv((BAR_COUNT * 1 + i * 0.9) / BAR_COUNT, 1, 0.9)
		var l_rect2 = Rect2(i * bar_width+size.x,size.y - heigths[i].actual,bar_width - 2,heigths[i].actual)
	

		draw_rect(l_rect2,l_color)

func _update_spectrum_data():
	var l_prev_hz = 0.0
	for i in BAR_COUNT:
		var l_hz: float = (i + 1) * FREQ_MAX / BAR_COUNT
		var l_magnitude:float = spectrum.get_magnitude_for_frequency_range(l_prev_hz, l_hz).length()
		var l_energy:float = clampf((MIN_DB + linear_to_db(l_magnitude)) / MIN_DB, 0, 1)
		var l_height:float = l_energy * size.y * 15

		if l_height > heigths[i].high:
			heigths[i].high = l_height

		else:
			heigths[i].high = lerp(heigths[i].high,l_height, 0.1)

		if l_height <= 0.0:
			heigths[i].low = lerp(heigths[i].low, l_height, 0.1)

		heigths[i].actual = lerp(heigths[i].low, heigths[i].high,0.1)
		l_prev_hz = l_hz


func _process(_delta):
	_update_spectrum_data()
	queue_redraw()



func _on_resized():
	bar_width = size.x / BAR_COUNT
