CREATE DATABASE gamegodot
CREATE TABLE preguntas (
    id INT(11) NOT NULL AUTO_INCREMENT,
    pregunta VARCHAR(250) DEFAULT NULL,
    respuesta VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY(id)
);
INSERT INTO preguntas values(1, 'Eel año de la fundacion de Bolivia fue en 1825?', 'si'),
                            (2, 'La guerra del pacifico fue en 1955?', 'no'),
                            (3, 'EL nombre de Bolivia es en honor de Bolivar', 'si');
