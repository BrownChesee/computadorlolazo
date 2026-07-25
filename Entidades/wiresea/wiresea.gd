extends Area2D
var wires = 551
signal ABANDONED


func _ready():
	wires = 960
	position.y = wires


func _process(delta):
	position.y = wires
	wires -= 250 * delta
	var fix = Input.is_action_pressed("punch")
	if fix:
		wires += 360 * delta
	if wires < 1 or wires > 1075:
		emit_signal("ABANDONED")
		wires = 500
		print_debug("j")
