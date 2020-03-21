extends Sprite
onready var main = get_node("/root/main")
func _ready():
	$animacion.play("entrada")
	pass # Replace with function body.

#funcion al presionar el boton volver
func _on_btn_volver_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$animacion.play("salida")

#funcion cuando terminar la animacion de salida
func _on_animacion_animation_finished(anim_name):
	if anim_name == "salida":
		queue_free()


func _on_btn_sonido_pressed():
	main.parar_musica()
