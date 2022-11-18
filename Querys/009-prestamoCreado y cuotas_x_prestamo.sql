#drop trigger PrestamoAutorizado;
#drop trigger PrestamoCreado;
delimiter //
 CREATE TRIGGER PrestamoAutorizado AFTER  update ON `prestamos_x_autorizar`
  FOR EACH ROW 
  BEGIN
 

   IF new.estado > 1 THEN
   INSERT INTO prestamos
(
`dni`,
`fecha`,
`importe_a_pagar`,
`importe_pedido`,
`plazo_pago`,
`monto_mensual`,
`cantidad_cuotas`
)
VALUES
(
(SELECT dni FROM cuentas WHERE nroCuenta = new.nroCuenta ),
current_date(),
 cast(new.importe_pedido*1.15 as decimal(10,0)),
 cast(new.importe_pedido as decimal(10,0)),
'30',
CAST((new.importe_pedido*1.15)/new.cantidad_cuotas AS decimal(10,0)),
new.cantidad_cuotas
);
  END IF;
  END //
 delimiter ;




 delimiter //
 CREATE TRIGGER PrestamoCreado AFTER  INSERT ON `prestamos`
  FOR EACH ROW 
  BEGIN
   declare x INT default 0;
   SET x=1;
   WHILE x <= new.cantidad_cuotas DO
    INSERT INTO cuotas_x_prestamo
(

`codPrestamo`,
`nroCuota`,
`fecha_venc`,
`importe`
)
VALUES
(
new.codPrestamo,
x,
DATE_ADD(new.fecha, INTERVAL 30*x DAY),
CAST((new.importe_pedido*1.15)/new.cantidad_cuotas AS decimal(10,0))
);
 SET x = x + 1;
 END WHILE;
  END //
 delimiter ;