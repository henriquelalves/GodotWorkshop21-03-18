extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Label.text = "Pontos: %d" % global.points

func _input(event):
	if event is InputEventKey and event.is_pressed() and event.scancode == KEY_ENTER:
		get_tree().change_scene("res://Menu.tscn")
