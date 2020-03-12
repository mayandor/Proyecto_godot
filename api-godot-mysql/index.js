const express = require('express');
const app = express();

//configuracion
app.set('port', process.env.PORT || 3000);

//Middlewares recibe y envia formato json
app.use(express.json());

//Rutas
app.use(require('./src/rutas/RutaPreguntas'));

// Levantando el servidor
app.listen(app.get('port'),() => {
    console.log('Servidor en puerto',app.get('port'));
});