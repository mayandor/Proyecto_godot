extends Area2D
var velocidad = Vector2(-300, 0)
var tiempo_vida = 5
onready var jugador = get_parent().get_node("jugador")
onready var main = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	$tnt.animation = "sin_explotar"
	print("sin explo")
	$tnt.position.x = -2.555
	$tnt.position.y = 8.068
	$tnt.scale.x = 0.234
	$tnt.scale.y = 0.266
		
func _process(delta):
	set_position(position + velocidad * delta)
	tiempo_vida = tiempo_vida - delta
	if tiempo_vida <= 0:
		queue_free()


func _on_tnt_area_entered(area):
	if area.name == "jugador":
		$tnt.animation = "explosion"
		print("xp explo")
		$tnt.position.x = 24.901
		$tnt.position.y = -37.087
		$tnt.scale.x = 0.14
		$tnt.scale.y = 0.15
		jugador.choca()
		main.quitar_vidas()
		#hide()
		print("tnt")
	elif area.name == "fireball":
		queue_free()


func _on_tnt_area_exited(area):
	jugador.normalidad()
