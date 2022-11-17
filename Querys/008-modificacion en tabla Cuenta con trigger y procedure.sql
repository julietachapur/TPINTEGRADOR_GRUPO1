/*drop procedure agregarCuenta;*/

delimiter //
 create procedure agregarCuenta(
  in p_cbu int,
  in p_dni varchar(10),
  in p_tipoCuenta int,
  in p_saldo int
  )
 begin
   insert into cuentas(`CBU`, `dni`, `fecha_creacion`, `tipoCuenta`, `saldo`) values (p_cbu,p_dni, current_date(),p_tipoCuenta,p_saldo);
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
 