extends Node2D

#Para las vidas por defecto 3
export var vidas = 3
var offset_vida = 80
var vida = preload("res://GUI/vida.tscn")
var lista_vidas = []
# para los ataques de tambor
export var tambores = 3

var tambor = preload("res://GUI/tambor_ataque.tscn")
var lista_tambores = []
# Called when the node enters the scene tree for the first time.
func _ready():
	crear_vidas()
	crear_tambores()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().paused == false:
			get_tree().paused = true
		else:
			get_tree().paused = false
	
func crear_vidas():
	for i in vidas:
		var nueva_vida = vida.instance()
		get_tree().get_nodes_in_group("gui")[0].add_child(nueva_vida)
		nueva_vida.global_position = $barra_vidas.global_position
		nueva_vida.global_position.x += offset_vida * i
		lista_vidas.append(nueva_vida)

func quitar_vidas():
	if vidas > 1:
		vidas -= 1
		lista_vidas[vidas].queue_free()
	else:
		#get_tree().paused = true
		print("game over")
func crear_tambores():
	for i in tambores:
		var nuevo_tambor = tambor.instance()
		get_tree().get_nodes_in_group("gui")[1].add_child(nuevo_tambor)
		nuevo_tambor.global_position = $barra_tambor.global_position
		nuevo_tambor.global_position.x += offset_vida * i
		lista_tambores.append(nuevo_tambor)

func add_tambor():
	if tambores < 3:
		tambores += 1
		var nuevo_tambor = tambor.instance()
		get_tree().get_nodes_in_group("gui")[1].add_child(nuevo_tambor)
		nuevo_tambor.global_position = $barra_tambor.global_position
		nuevo_tambor.global_position.x += offset_vida * lista_tambores.size()
		lista_tambores.append(nuevo_tambor)
		
func quitar_tambores():
	if tambores > 0:
		tambores -= 1
		lista_tambores[tambores].queue_free()
		lista_tambores.resize(tambores)
	else:
		print("sin tambor")
				
func _on_jugador_fuego():
	$spawn_fireball.crearFuego()
	quitar_tambores()

func panel_pregunta():	
	$HTTPRequest.request("http://localhost:3000/api/godot")
	$pregunta/anim.play("mover")
	print("pausa")
	get_tree().paused = true

func _on_Button_pressed():
	print("sin pausa")
	$pregunta/anim.play("regresar")
	get_tree().paused = false

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	#mediante http recibe los datos de la base de datos en formato json
	var json = JSON.parse(body.get_string_from_utf8())
	var resultado = (json.result)
	print(resultado)	
	var labelimpresion:RichTextLabel = get_node("pregunta/RichTextLabel")
	labelimpresion.clear()
	for res in resultado:
		labelimpresion.text += "Id :" + var2str(res["id"]) +"\n"
		labelimpresion.text += "Pregunta :" + var2str(res["pregunta"]) +"\n"
		labelimpresion.text += "Respuesta :" + var2str(res["respuesta"]) +"\n"
		labelimpresion.text += "---------\n"
