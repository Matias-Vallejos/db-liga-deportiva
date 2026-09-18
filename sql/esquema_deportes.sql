CREATE DATABASE Deportes;
USE Deportes;
CREATE TABLE Torneo (
id_torneo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(250) NOT NULL,
edicion INT NOT NULL
);
CREATE TABLE Instancia (
id_instancia INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(250) NOT NULL,
id_torneo INT NOT NULL,
CONSTRAINT fk_instancia_torneo
FOREIGN KEY (id_torneo)
REFERENCES Torneo(id_torneo)
);
CREATE TABLE Estadio (
nombre_estadio VARCHAR(250) PRIMARY KEY,
ciudad VARCHAR(250) NOT NULL,
capacidad_maxima INT NOT NULL,
cantidad_policias INT NOT NULL
);
CREATE TABLE Arbitro (
id_arbitro INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(250) NOT NULL,
apellido VARCHAR(250) NOT NULL,
deporte VARCHAR(250) NOT NULL
);
CREATE TABLE Prensa (
id_prensa INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(250) NOT NULL,
apellido VARCHAR(250) NOT NULL,
medio VARCHAR(250) NOT NULL
);
CREATE TABLE Partido (
id_partido INT AUTO_INCREMENT PRIMARY KEY,
duracion TIME NOT NULL,
fecha DATE NOT NULL,
id_instancia INT NOT NULL,
nombre_estadio VARCHAR(250) NOT NULL,
id_arbitro INT NOT NULL,
id_prensa INT NOT NULL,
CONSTRAINT fk_partido_instancia
FOREIGN KEY (id_instancia)
REFERENCES Instancia(id_instancia),
CONSTRAINT fk_partido_estadio
FOREIGN KEY (nombre_estadio)
REFERENCES Estadio(nombre_estadio),
CONSTRAINT fk_partido_arbitro
FOREIGN KEY (id_arbitro)
REFERENCES Arbitro(id_arbitro),
CONSTRAINT fk_partido_prensa
FOREIGN KEY (id_prensa)
REFERENCES Prensa(id_prensa)
);
CREATE TABLE Hincha(
numero_ticket INT NOT NULL,
id_partido INT NOT NULL,
fila VARCHAR(250) NOT NULL,
numero_asiento INT NOT NULL,
zona VARCHAR(250) NOT NULL,
PRIMARY KEY (numero_ticket, id_partido),
CONSTRAINT fk_hincha_partido
FOREIGN KEY (id_partido)
REFERENCES Partido(id_partido)
);
CREATE TABLE Director_tecnico(
id_director_tecnico INT PRIMARY KEY,
nombre VARCHAR(250) NOT NULL,
apellido VARCHAR(250) NOT NULL
);
CREATE TABLE Equipo(
nombre_equipo VARCHAR(250) PRIMARY KEY,
id_director_tecnico INT NOT NULL,
CONSTRAINT fk_equipo_director_tecnico
FOREIGN KEY (id_director_tecnico)
REFERENCES Director_tecnico(id_director_tecnico)
);
CREATE TABLE Entrenamiento(
nombre_lugar VARCHAR(250) NOT NULL,
nombre_equipo VARCHAR(250) NOT NULL,
cantidad_horas DECIMAL(4,2) NOT NULL,
periodicidad VARCHAR(250) NOT NULL,
PRIMARY KEY (nombre_lugar, nombre_equipo),
CONSTRAINT fk_entrenamiento_equipo
FOREIGN KEY (nombre_equipo)
REFERENCES Equipo(nombre_equipo)
);
CREATE TABLE Jugador(
numero_camiseta INT NOT NULL,
nombre_equipo VARCHAR(250) NOT NULL,
nombre VARCHAR(250) NOT NULL,
apellido VARCHAR(250) NOT NULL,
dni INT NOT NULL,
posicion VARCHAR(250) NOT NULL,
PRIMARY KEY (numero_camiseta, nombre_equipo),
CONSTRAINT fk_jugador_equipo
FOREIGN KEY (nombre_equipo)
REFERENCES Equipo(nombre_equipo)
);
CREATE TABLE Cuerpo_tecnico(
rol VARCHAR(250) NOT NULL,
nombre_equipo VARCHAR(250) NOT NULL,
nombre VARCHAR(250) NOT NULL,
apellido VARCHAR(250) NOT NULL,
PRIMARY KEY (rol, nombre_equipo),
CONSTRAINT fk_cuerpo_tecnico_equipo
FOREIGN KEY (nombre_equipo)
REFERENCES Equipo(Nombre_equipo)
);
CREATE TABLE Partido_Equipo(
id_partido INT NOT NULL,
nombre_equipo VARCHAR(250) NOT NULL,
cantidad_goles INT NOT NULL,
PRIMARY KEY (id_partido, nombre_equipo),
CONSTRAINT fk_partido_equipo_partido
FOREIGN KEY (id_partido)
REFERENCES Partido(id_partido),
CONSTRAINT fk_partido_equipo_equipo
FOREIGN KEY (nombre_equipo)
REFERENCES Equipo(nombre_equipo)
);