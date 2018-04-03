extends Node2D

onready var tempo_limite = 2.0 # Cria uma nova plataforma a cada dois segundos
onready var timer = 0.0 

onready var plataforma = preload("res://Platform.tscn") # Carrega cena que queremos usar

func _ready():
	randomize() # Inicializa funcao para gerar numeros aleatorios
	global.points = 0 # Seta variavel global de pontos para 0

func _process(delta):
	timer += delta # Soma o tempo que passou desde o ultimo frame
	
	if timer > tempo_limite:
		# Instancia nova plataforma e adiciona ela na cena
		var nova_plataforma = plataforma.instance()
		nova_plataforma.position.y = 650 # coloca ela abaixo da cena
		nova_plataforma.position.x = randi() % 1024 # posicao X aleatoria
		add_child(nova_plataforma)
		
		# Adiciona um ponto ao jogador
		global.points += 1
		$Label.text = "Pontos: " + str(global.points)
		
		# Reseta o tempo
		timer -= tempo_limite
	
	# Testa gameover
	if $Player.position.y > 630 or $Player.position.y < -30:
		get_tree().change_scene("res://Gameover.tscn")
