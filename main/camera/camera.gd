extends Node2D


func _process(_delta):
	var cursor:Vector2 = get_viewport().get_mouse_position()/3
	position.x = cursor.x 	
