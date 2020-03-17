extends Position2D

var enemigos = [preload("res://Obstaculos/tnt.tscn"), preload ("res://Obstaculos/pregunta.tscn"), preload("res://Obstaculos/bala.tscn")]

var tiempo = 0.0
var intervalo = 3
var intervalo_min = 1
var intervalo_max = 4

func _physics_process(delta):
	tiempo += delta 
	if tiempo >= intervalo:
		tiempo = 0
		
		var c = rand_range(0, enemigos.size())
		get_parent().add_child(enemigos[c].instance())
		
		intervalo = rand_range(intervalo_min, intervalo_max)
		
