extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_btnJugar_pressed():
	print("presionado")
func _on_btnTutorial_pressed():
	pass # Replace with function body.
func _on_btnSalir_pressed():
	get_tree().quit()
