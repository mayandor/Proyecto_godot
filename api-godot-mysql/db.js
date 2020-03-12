// llamada al modulo mysql
const mysql = require('mysql');

// configuraciones para la conexion con mysql
const mysqlConection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123',
    database: 'gamegodot',
    multipleStatements: true
});

mysqlConection.connect(function (err) {
    if (err) {
      console.error(err);
      return;
    } else {
      console.log('base de datos conectada!!!');
    }
});

module.exports = mysqlConection;