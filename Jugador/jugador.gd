extends Area2D

#varialbes para el movimiento del avatar
var pos = position
var piso = pos
var gravedad = 4000
var velocidad = Vector2()
var velocidad_salto = -1300
var modificador_gravedad = 2.3
onready var main = get_node("/root/main")
# para ataque
signal fuego

func _ready():
	set_position(pos)
	$jugador_sprite.animation = "caminando"
	
func _physics_process(delta):
	#variables para el movimiento
	var saltar = Input.is_action_pressed("ui_up")
	var atacar = Input.is_action_just_pressed("ui_right")
	var agacharse = Input.is_action_pressed("ui_down")
#funciones para el movimiento del avatar	
	if saltar:
		velocidad.y += gravedad * delta
	else:
		velocidad.y += gravedad *delta * modificador_gravedad
	if Input.is_action_just_pressed("ui_up") and position == piso:
		velocidad.y = velocidad_salto
	position += velocidad * delta
	
	if get_position().y > piso.y:
		set_position(piso)
		velocidad = Vector2()
	#para agacharse
	if agacharse and not atacar:
		$jugador_sprite.animation = "down"
		$CollisionShape2D.position.x = 74.604
		$CollisionShape2D.position.y = 514.211
	if Input.is_action_just_released("ui_down"):
		$jugador_sprite.animation = "caminando"
		$CollisionShape2D.position.x = 71.068
		$CollisionShape2D.position.y = 493.705
		$CollisionShape2D.scale.x = 0.6
		$CollisionShape2D.scale.y = 1.9
		
	
	#Para el ataque
	if atacar and not (saltar or agacharse):
		if main.tambores > 0:
			$jugador_sprite.animation = "ataque"
			emit_signal("fuego")
	if Input.is_action_just_released("ui_right") and not agacharse:
		$jugador_sprite.animation = "caminando"

func choca():
	$jugador_sprite.animation = "lastimado"

func normalidad():
	$jugador_sprite.animation = "caminando"
