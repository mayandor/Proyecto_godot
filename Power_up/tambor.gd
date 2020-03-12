extends Area2D
var velocidad = Vector2(-300, 0)
var tiempo_vida = 5
onready var main = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	set_position(position + velocidad * delta)
	tiempo_vida = tiempo_vida - delta
	if tiempo_vida <= 0:
		queue_free()


func _on_tambor_area_entered(area):
	if area.name == "jugador":
		main.add_tambor()
		$tambor.animation = "tomar"
		$tambor.scale.x = 0.287
		$tambor.scale.y = 0.455
		$tambor.position.x = 0.332
		$tambor.position.y = -218.775

		
