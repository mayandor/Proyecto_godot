extends Node

func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	#ruta para obtener con un get los datos de la base de datos mediante la api-godot-mysql
	$HTTPRequest.request("http://localhost:3000/api/godot")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	#mediante http recibe los datos de la base de datos en formato json
	var json = JSON.parse(body.get_string_from_utf8())
	var resultado = (json.result)
	#imprime el resultado
	print(resultado)
	
	var labelimpresion:RichTextLabel = get_node("RichTextLabel")
	labelimpresion.clear()
	for res in resultado:
		labelimpresion.text += "Id :" + var2str(res["id"]) +"\n"
		labelimpresion.text += "Pregunta :" + var2str(res["pregunta"]) +"\n"
		labelimpresion.text += "Respuesta :" + var2str(res["respuesta"]) +"\n"
		labelimpresion.text += "---------\n"
	
	

