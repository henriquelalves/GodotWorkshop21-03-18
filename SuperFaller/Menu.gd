extends Node2D

# Primeira função que toda quando cena é carregada
func _ready():
	print("Comecou o jogo!")

# Função para pegar o input do usuário
func _input(event):
	if event is InputEventKey and event.is_pressed() and event.scancode == KEY_ENTER:
		get_tree().change_scene("res://Game.tscn")
