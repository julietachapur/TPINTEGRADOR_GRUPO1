/*drop schema bdBanco;*/
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


