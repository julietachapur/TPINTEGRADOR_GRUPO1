delimiter //
 create procedure agregarCuenta(
  in p_cbu int,
  in p_dni varchar(10),
  in p_tipoCuenta int
  )
 begin
   insert into cuentas(`CBU`, `dni`, `fecha_creacion`, `tipoCuenta`, `saldo`) values (p_cbu,p_dni, current_date(),p_tipoCuenta,'10000');
  
 end //
 delimiter ;