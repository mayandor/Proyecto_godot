extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$btn_sonido.DRAW_HOVER
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_volver_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		queue_free()
