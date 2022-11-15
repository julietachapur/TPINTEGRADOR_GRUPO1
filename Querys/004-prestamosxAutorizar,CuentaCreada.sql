DROP trigger `bdbanco`.`CuentaCreada`;
 
 delimiter //
 CREATE TRIGGER CuentaCreada AFTER  INSERT ON `cuentas`
  FOR EACH ROW 
  BEGIN
    insert into movimientos(`nroCuenta`, `fecha`, `detalle`, `importe`, `tipomovimiento`) values (NEW.nroCuenta , current_date(),'Cuenta Agregada', '10000','1');
  END //
 delimiter ;
 
#para ver como funciona
  call agregarCuenta('11111111', '91011123', '1');
 

DROP PROCEDURE `bdbanco`.`Prestamos_x_Autorizar`;
delimiter //
  create procedure prestamos_x_autorizar
(
in nroCuenta bigint(20) ,
in importe_pedido DECIMAL(20,6),
in cantidad_cuotas INT
)
begin
     insert into prestamos_x_autorizar(`nroCuenta`, `fecha_creacion`, `importe_pedido`, `cantidad_cuotas`) values (nroCuenta, current_date(),importe_pedido,cantidad_cuotas);
 end //
   delimiter //;
   
call prestamos_x_autorizar('71', '10000.50', '12');
  
