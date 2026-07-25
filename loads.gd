extends Node
var main = "res://main/main.tscn"
var menu = "res://title/title.tscn"
var muffled = false
var mutted = false
var sfx = false


func load_main():
	get_tree().change_scene_to_file(main)
func load_title():
	get_tree().change_scene_to_file(menu)
