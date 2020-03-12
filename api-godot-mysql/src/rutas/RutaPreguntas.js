const express = require('express');
const ruta = express.Router();

const mysqlConnection = require('../../db.js');

// Get tabla preguntas
ruta.get('/api/godot/',(req,res) => {
    // consulta
    mysqlConnection.query('SELECT * FROM preguntas', (err, rows) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
      });
});

module.exports = ruta;