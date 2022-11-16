delimiter //
 create procedure agregarPrestamoxAutorizar(
  in p_nroCuenta int,
  in p_Importe decimal(20,6),
  in p_cantCuotas int
  )
 begin
   insert into cuentas(`nroCuenta`, `fecha_creacion`, `importe_pedido`, `cantidad_cuotas`, `estado`) values (p_nroCuenta, current_date(),p_Importe,p_cantCuotas,0);
  
 end //
 delimiter ;