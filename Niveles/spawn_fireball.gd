extends Position2D

var fireball_scene = preload("res://Jugador/fireball.tscn")

func _ready():
	pass # Replace with function body.

func crearFuego():
	var fireball = fireball_scene.instance()
	get_tree().get_nodes_in_group("principal")[0].add_child(fireball)
	fireball.global_position = global_position
	print("fuego")
