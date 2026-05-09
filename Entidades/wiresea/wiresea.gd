extends Area2D
var wires = 1152
signal ABANDONED


func _ready():
	position.y = wires


func _process(delta):
	position.y = wires
	wires -= 250 * delta
	var fix = Input.is_action_pressed("punch")
	if fix:
		wires += 7
		if wires > 1152:
			wires = 1152
	if wires < 1:
		emit_signal("ABANDONED")
