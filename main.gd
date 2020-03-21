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
	#play_musica()
	
func _process(delta):
	var ventana = preload("res://GUI/gui_pantallas/ventana_pausa.tscn") 
	if Input.is_action_just_pressed("ui_accept"):
		if	get_tree().paused == false:
			get_tree().get_nodes_in_group("principal")[0].add_child(ventana.instance())
			get_tree().paused = true
	
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
		print("moriste")

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

#Cuando ternina la cancion
func _on_musica_principal_finished():
	$musica_principal.play()

func parar_musica():
	$musica_principal.stop()

func play_musica():
	$musica_principal.play()


func _on_ambiente_finished():
	$ambiente.play()
