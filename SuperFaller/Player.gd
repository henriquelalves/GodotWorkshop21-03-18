extends KinematicBody2D

var gravity = 900.0
var linear_vel = Vector2()
var jumping = false

func _ready():
	pass

# Nosso game loop!
func _physics_process(delta):
	
	# Calcula velocidades (valores iniciais)
	linear_vel.y = linear_vel.y + gravity*delta
	
	# Move jogador
	linear_vel = move_and_slide(linear_vel, Vector2(0,-1))
	
	# Testa input do jogador, e joga nos valores de velocidade
	linear_vel.x = 0.0
	if (Input.is_action_pressed("ui_left")):
		linear_vel.x = -400.0
	if (Input.is_action_pressed("ui_right")):
		linear_vel.x = 400.0
	if (Input.is_action_just_pressed("ui_up") and is_on_floor()):
		linear_vel.y = -500.0
		jumping = true
	
	# Jogador precisa de uma velocidade y mesmo enquanto está
	# no chao para não haver "gittering"; experimente comentar
	# as próximas linhas e veja o que acontece com a imagem do
	# jogador
	if(is_on_floor() and not jumping):
		linear_vel.y = max(linear_vel.y, gravity*0.1)
	elif (not is_on_floor()):
		jumping = false