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
// get id
ruta.get('/api/godot/:id', (req,res) => {
  const { id } = req.params;
  console.log(id);
  mysqlConnection.query('SELECT * FROM preguntas WHERE id = ?', [id], (err, rows) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

module.exports = ruta;
