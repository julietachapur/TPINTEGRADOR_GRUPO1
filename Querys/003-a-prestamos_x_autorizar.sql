create table Prestamos_x_Autorizar
(
codPrestamoPendinte INT NOT NULL AUTO_INCREMENT,
nroCuenta bigint(20) NOT NULL,
fecha_creacion date NOT NULL,
importe_pedido DECIMAL(20,6) NOT NULL,
cantidad_cuotas INT NOT NULL ,
estado INT NOT NULL,
primary key (codPrestamoPendinte),
foreign key (nroCuenta) references cuentas(nroCuenta) 
);