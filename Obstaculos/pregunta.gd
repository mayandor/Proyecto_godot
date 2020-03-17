extends Area2D
var velocidad = Vector2(-300, 0)
var tiempo_vida = 5
onready var jugador = get_parent().get_node("jugador")
onready var main = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	set_position(position + velocidad * delta)
	tiempo_vida = tiempo_vida - delta
	if tiempo_vida <= 0:
		queue_free()


func _on_roca_area_entered(area):
	if area.name == "jugador":
		jugador.choca()
		main.quitar_vidas()
		hide()
		print("pregunta")
	elif area.name == "fireball":
		queue_free()


func _on_roca_area_exited(area):
	jugador.normalidad()
