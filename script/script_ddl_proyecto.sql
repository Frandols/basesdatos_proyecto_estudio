CREATE TABLE Clientes
(
  DNI VARCHAR(8) NOT NULL,
  nombres VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  telefono VARCHAR(12) NOT NULL,
  correo VARCHAR(256) NOT NULL,
  idCliente INT NOT NULL,
  PRIMARY KEY (idCliente),
  UNIQUE (DNI),
  UNIQUE (correo)
);

CREATE TABLE TiposDeEquipo
(
  nombre VARCHAR(50) NOT NULL,
  idTipoDeEquipo INT NOT NULL,
  PRIMARY KEY (idTipoDeEquipo)
);

CREATE TABLE Marcas
(
  nombre VARCHAR(50) NOT NULL,
  idMarca INT NOT NULL,
  PRIMARY KEY (idMarca)
);

CREATE TABLE Modelos
(
  nombre VARCHAR(50) NOT NULL,
  idModelo INT NOT NULL,
  PRIMARY KEY (idModelo)
);

CREATE TABLE TiposDeUsuario
(
  idTipoDeUsuario INT NOT NULL,
  nombre VARCHAR(13) NOT NULL,
  PRIMARY KEY (idTipoDeUsuario)
);

CREATE TABLE Equipos
(
  numeroDeSerie VARCHAR(256) NOT NULL,
  observaciones VARCHAR,
  razonDeIngreso VARCHAR NOT NULL,
  enciende INT NOT NULL,
  idEquipo INT NOT NULL,
  fechaDeIngreso DATE NOT NULL,
  idTipoDeEquipo INT NOT NULL,
  idMarca INT NOT NULL,
  idModelo INT NOT NULL,
  idCliente INT NOT NULL,
  PRIMARY KEY (idEquipo),
  FOREIGN KEY (idTipoDeEquipo) REFERENCES TiposDeEquipo(idTipoDeEquipo),
  FOREIGN KEY (idMarca) REFERENCES Marcas(idMarca),
  FOREIGN KEY (idModelo) REFERENCES Modelos(idModelo),
  FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Revisiones
(
  observaciones INT NOT NULL,
  idEquipo INT NOT NULL,
  PRIMARY KEY (idEquipo),
  FOREIGN KEY (idEquipo) REFERENCES Equipos(idEquipo)
);

CREATE TABLE Usuarios
(
  idUsuario INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  usuario VARCHAR(50) NOT NULL,
  contrasena VARCHAR(24) NOT NULL,
  idTipoDeUsuario INT NOT NULL,
  PRIMARY KEY (idUsuario),
  FOREIGN KEY (idTipoDeUsuario) REFERENCES TiposDeUsuario(idTipoDeUsuario)
);

CREATE TABLE Presupuestos
(
  idPresupuesto INT NOT NULL,
  detalles VARCHAR NOT NULL,
  monto FLOAT NOT NULL,
  aprobado INT NOT NULL,
  idRevision INT NOT NULL,
  PRIMARY KEY (idPresupuesto),
  FOREIGN KEY (idRevision) REFERENCES Revisiones(idEquipo)
);

CREATE TABLE Reparaciones
(
  reparado INT NOT NULL,
  observaciones VARCHAR NOT NULL,
  idPresupuesto INT NOT NULL,
  PRIMARY KEY (idPresupuesto),
  FOREIGN KEY (idPresupuesto) REFERENCES Presupuestos(idPresupuesto)
);

CREATE TABLE Entregas
(
  fecha DATE NOT NULL,
  idReparacion INT NOT NULL,
  PRIMARY KEY (idReparacion),
  FOREIGN KEY (idReparacion) REFERENCES Reparaciones(idPresupuesto)
);