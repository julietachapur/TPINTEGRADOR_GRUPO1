-- drop schema bdBanco;
create schema bdBanco;
use bdBanco;

create table Paises
(
codPais INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
pais VARCHAR(50) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE
);

create table Provincias
(
codProvincia INT NOT NULL AUTO_INCREMENT,
codPais INT NOT NULL,
provincia VARCHAR(50) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE,
primary key (codProvincia, codPais),
foreign key (codPais) references Paises(codPais) 
);

create table Localidades
(
codLocalidad INT NOT NULL AUTO_INCREMENT,
codProvincia INT NOT NULL,
codPais INT NOT NULL,
localidad VARCHAR(50) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE,
primary key(codLocalidad, codProvincia, codPais),
foreign key (codProvincia, codPais) references Provincias(codProvincia, codPais) 
);

create table Clientes
(
dni VARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50), 
CUIL VARCHAR(13), 
sexo CHAR, 
nacionalidad INT NOT NULL, 
fecha_nac date,
direccion varchar(200),
codLocalidad INT,
codProvincia INT,
codPais INT,
correo_electronico varchar(200),
estado BIT NOT NULL DEFAULT TRUE,
foreign key (codLocalidad, codProvincia, codPais) references Localidades(codLocalidad, codProvincia, codPais)
);

ALTER TABLE Clientes ADD FOREIGN KEY (nacionalidad) REFERENCES Paises(codPais);

create table Telefonos_x_cliente
(
dni VARCHAR(10) NOT NULL PRIMARY KEY,
telefono VARCHAR(20) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE,
foreign key (dni) references Clientes(dni)
);

create table TiposUsuarios
(
codTipo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipoUsuario VARCHAR(50) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE
);

create table TiposMovimientos
(
codTipo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipoMovimiento VARCHAR(50) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE
);

create table TiposCuentas
(
codTipo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipoCuenta VARCHAR(50) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE
);

create table Usuarios
(
usuario VARCHAR(20) NOT NULL PRIMARY KEY,
dni VARCHAR(10),
tipoUsuario INT,  
contraseña VARCHAR(10) NOT NULL,
estado BIT NOT NULL DEFAULT TRUE,
foreign key (tipoUsuario) references TiposUsuarios(codTipo) 
);

ALTER TABLE Usuarios ADD FOREIGN KEY (dni) REFERENCES Clientes(dni);

create table Cuentas
(
nroCuenta BIGINT NOT NULL,
CBU INT NOT NULL,
dni VARCHAR(10),
fecha_creacion date NOT NULL,
tipoCuenta INT NOT NULL, 
saldo DECIMAL,
estado BIT NOT NULL DEFAULT TRUE,
primary key (nroCuenta, CBU),
foreign key (dni) references Clientes(dni) 
);

ALTER TABLE Cuentas ADD FOREIGN KEY (tipoCuenta) REFERENCES TiposCuentas(codTipo);

create table Movimientos
(
codMovimiento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nroCuenta BIGINT NOT NULL,
fecha date NOT NULL,
Detalle varchar(200),
importe decimal NOT NULL,
tipoMovimiento INT NOT NULL,
foreign key (nroCuenta) references Cuentas(nroCuenta) 
);

ALTER TABLE Movimientos ADD FOREIGN KEY (tipoMovimiento) REFERENCES TiposMovimientos(codTipo);

create table Prestamos
(
codPrestamo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
dni VARCHAR(10),
fecha date NOT NULL,
importe_a_pagar decimal NOT NULL,
importe_pedido decimal NOT NULL,
plazo_pago int NOT NULL,
monto_mensual decimal NOT NULL,
cantidad_cuotas int NOT NULL,
foreign key (dni) references Clientes(dni)
);

create table Cuotas_x_prestamo
(
idCuota INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
codPrestamo int NOT NULL,
nroCuota int NOT NULL,
fecha date not null,
importe decimal not null,
foreign key (codPrestamo) references Prestamos(codPrestamo)
);

INSERT INTO Paises (pais) VALUES ('Argentina');
INSERT INTO Paises (pais) VALUES ('Uruguay');
INSERT INTO Paises (pais) VALUES ('Brasil');
INSERT INTO Paises (pais) VALUES ('Chile');
INSERT INTO Paises (pais) VALUES ('Bolivia');

INSERT INTO Provincias(codPais,provincia) VALUES (1, 'Buenos Aires');
INSERT INTO Provincias (codPais,provincia) VALUES (1,'Cordoba');
INSERT INTO Provincias (codPais,provincia) VALUES (1,'Entre Ríos');
INSERT INTO Provincias (codPais,provincia) VALUES (1,'Santa Fe');
INSERT INTO Provincias (codPais,provincia) VALUES (1,'Capital Federal');

INSERT INTO Localidades(codPais,codProvincia,localidad) VALUES (1, 1,'La Plata');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1, 1, 'Tigre');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,1,'Quilmes');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,1,'Merlo');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,2,'Cordoba');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,2,'Villa Carlos Paz');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,3,'Paraná');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,4,'Santa Fe');
INSERT INTO Localidades (codPais,codProvincia,localidad) VALUES (1,5,'Capital Federal');

INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('12345678','Cecilia','Fernandez','27-12345678-1','F',1,'1975-05-01', 'Florida 123',9,5,1,'ceci@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('91011123','Lucas Gabriel','Fernandez','23-91011123-7','M',1,'1980-07-23', 'Mitre 2587',5,2,1,'lucas@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('14151617','Maria Julieta','Chapur','27-14151617-3','F',1,'1990-11-08', 'Rivera 3358',6,2,1,'julieta@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('18192021','Juian Ezequiel','Moruzzi','20-18192021-8','M',1,'2000-08-11', 'Cabildo 1598',9,5,1,'julian@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('22232425','Nahuel','Maquieyra ','20-22232425-1','M',1,'1993-05-01', 'Rivadavia 321',7,3,1,'nahuel@gmail.com');

INSERT INTO TiposUsuarios (tipoUsuario) VALUES ('Administrador');
INSERT INTO TiposUsuarios (tipoUsuario) VALUES ('Cliente');

INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Alta de cuenta');
INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Alta préstamo');
INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Alta préstamo');
	
INSERT INTO TiposCuentas (tipoCuenta) VALUES ('Caja de Ahorro');
INSERT INTO TiposCuentas (tipoCuenta) VALUES ('Cuenta Corriente');
