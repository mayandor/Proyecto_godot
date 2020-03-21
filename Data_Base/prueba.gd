extends Node

const SQLite = preload("res://lib/gdsqlite.gdns")

var preguntas = []

func _ready():
	#Creamos una instancia del gdsqlite
	var db = SQLite.new()
	#Abrimos nuestra base de datos
	db.open_db("res://Data_Base/db_prueba.db")
	# creamos un array de elememtos con una consulta
	var pots = db.fetch_array("SELECT p.pregunta, o.opcion FROM pregunta p, opcion  o, respuesta_correcta rp WHERE p.id_preg = rp.id_preg AND o.id_opc = rp.id_opc");
	if (not pots or pots.empty()):
		return;
	
	for pot in pots:
		# Creamos una pregunta desde la base de datos
		var pregunta = {
			'pregunta': pot['pregunta'],
			'opcion': pot['opcion']
		};
		
		# Anadimos a la lista de preguntas
		preguntas.append(pregunta);
	
	# mostramos cada pregunta con su respuesta correcta
	$Panel/Label.text=preguntas[0].pregunta
	for i in preguntas:
		$Panel/ItemList.add_item(i.opcion)
		print("Pregunta: ", i.pregunta,"\tRespuesta: ", i.opcion);
		
	
	#cerramos la base de datos
	db.close()
