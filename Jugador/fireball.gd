extends Area2D

var piso = position
var velocidad = Vector2(700,0)
var tiempo_vida = 1

func _ready():
	set_position(piso)

func _physics_process(delta):
	set_position(position + velocidad * delta)
	tiempo_vida = tiempo_vida - delta
	if tiempo_vida <= 0:
		queue_free()
