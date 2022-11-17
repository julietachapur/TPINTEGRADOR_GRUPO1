create table Cuentas
(
nroCuenta INT NOT NULL AUTO_INCREMENT ,
CBU BIGINT NOT NULL,
dni VARCHAR(10),
fecha_creacion date NOT NULL,
tipoCuenta INT NOT NULL, 
estado BIT NOT NULL DEFAULT TRUE,
primary key (nroCuenta, CBU),
foreign key (dni) references Clientes(dni) 
);
ALTER TABLE Cuentas AUTO_INCREMENT = 5230;
ALTER TABLE Cuentas ADD FOREIGN KEY (tipoCuenta) REFERENCES TiposCuentas(codTipo);


delimiter //
 create procedure agregarCuenta(
  in p_cbu int,
  in p_dni varchar(10),
  in p_tipoCuenta int
  )
 begin
   insert into cuentas(`CBU`, `dni`, `fecha_creacion`, `tipoCuenta`) values (p_cbu,p_dni, current_date(),p_tipoCuenta);
 end //
 delimiter ;
 
 
  
 delimiter //
 CREATE TRIGGER CuentaCreada AFTER  INSERT ON `cuentas`
  FOR EACH ROW 
  BEGIN
    insert into movimientos(`nroCuenta`, `fecha`, `detalle`, `importe`,`saldo`, `tipomovimiento`) values (NEW.nroCuenta , current_date(),'Cuenta Agregada', '10000', '10000','1');
  END //
 delimiter ;
 
 #para probar
 #call agregarCuenta('11111111', '91011123', '1');
 