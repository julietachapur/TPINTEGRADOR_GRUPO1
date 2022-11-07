INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('12345678','Cecilia','Fernandez','27-12345678-1','F',1,'1975-05-01', 'Florida 123',9,1,12,'ceci@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('91011123','Lucas Gabriel','Fernandez','23-91011123-7','M',1,'1980-07-23', 'Mitre 2587',5,1,12,'lucas@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('14151617','Maria Julieta','Chapur','27-14151617-3','F',1,'1990-11-08', 'Rivera 3358',6,1,12,'julieta@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('18192021','Juian Ezequiel','Moruzzi','20-18192021-8','M',1,'2000-08-11', 'Cabildo 1598',9,1,12,'julian@gmail.com');
INSERT INTO Clientes (dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES ('22232425','Nahuel','Maquieyra ','20-22232425-1','M',1,'1993-05-01', 'Rivadavia 321',7,1,12,'nahuel@gmail.com');

INSERT INTO TiposUsuarios (tipoUsuario) VALUES ('Administrador');
INSERT INTO TiposUsuarios (tipoUsuario) VALUES ('Cliente');

INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Alta de cuenta');
INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Alta préstamo');
INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Pago préstamo');
INSERT INTO TiposMovimientos (tipoMovimiento) VALUES ('Transferencia');
	
INSERT INTO TiposCuentas (tipoCuenta) VALUES ('Caja de Ahorro');
INSERT INTO TiposCuentas (tipoCuenta) VALUES ('Cuenta Corriente');