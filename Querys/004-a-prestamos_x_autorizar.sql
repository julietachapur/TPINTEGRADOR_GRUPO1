/*drop table Prestamos_x_Autorizar*/
create table Prestamos_x_Autorizar
(
codPrestamoPendinte INT NOT NULL AUTO_INCREMENT,
nroCuenta int NOT NULL,
fecha_creacion date NOT NULL,
importe_pedido DECIMAL(20,6) NOT NULL,
cantidad_cuotas INT NOT NULL ,
estado tinyint NOT NULL,
primary key (codPrestamoPendinte),
foreign key (nroCuenta) references cuentas(nroCuenta) 
);