insert into usuarios(usuario, dni, tipoUsuario, contraseña, estado) 
	select 	nombre as usuario, 
			dni, 
            2 as tipoUsuario,
            'clave' as clave, 
            true as estado
	from clientes
	union all
    select concat(nombre,'Adm') as usuario, 
			dni, 
            1 as tipoUsuario, 
            'clave' as clave, 
            true as estado
    from clientes
;
    

