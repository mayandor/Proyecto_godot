extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ItemList.add_item("Opcion 1")
	$ItemList.add_item("Opcion 2")
	$ItemList.add_item("Opcion 3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_anim_pregunta_animation_finished(anim_name):
#	anim_name == "salida"
#	queue_free()
