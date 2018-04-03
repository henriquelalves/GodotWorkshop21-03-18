extends KinematicBody2D

func _ready():
	pass

# A cada frame, movemos a plataforma para cima um pouquinho
func _physics_process(delta):
	position.y -= 100*delta