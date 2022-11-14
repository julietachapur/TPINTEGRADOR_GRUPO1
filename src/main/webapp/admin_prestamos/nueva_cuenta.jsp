<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2></h2>
<div style="float:right">
Usuario Loggeado<br>
<a href="index.jsp"> Inicio </a><br>
<a href="index.jsp"> Hacete Cliente </a><br>
<a href="index.jsp"> Clientes </a><br>
</div>


<form>
    DNI:      <input type="text" name="DNI"><br>
    CUIL:     <input type="text" name="CUIL"><br>
    Nombre:   <input type="text" name="Nombre"><br>
    Apellido: <input type="text" name="Apellido"><br>
    Sexo:
    <input type="radio" name="sex" value="masculino"> Masculino
    <input type="radio" name="sex" value="femenino"> Femenino
    <br>
    Nacionalidad:
        <select name="pais">
        <option value="AR">Argentina</option>
        <option value="CL">Chile</option>
        <option value="UR">Uruguay</option>
        <option value="PY">Paraguay</option>
        <option value="BR">Brasil</option>
    </select> <br>
    provincia:
        <select name="prov">
        <option value="sydney">Buenos Aires</option>
        <option value="melbourne">Córdoba</option>
        <option value="cromwell">Santa Fe</option>
        <option value="queenstown">Ciudad Autónoma de Buenos Aires</option>
        <option value="queenstown">Mendoza</option>
        <option value="queenstown">Tucumán</option>
        <option value="queenstown">Entre Ríos</option>
        <option value="queenstown">Salta</option>
        <option value="queenstown">Misiones</option>
        <option value="queenstown">Chaco</option>
        <option value="queenstown">Corrientes</option>
        <option value="queenstown">Santiago del Estero</option>
        <option value="queenstown">San Juan</option>
        <option value="queenstown">Jujuy</option>
        <option value="queenstown">Río Negro</option>
        <option value="queenstown">Neuquén</option>
        <option value="queenstown">Formosa</option>
        <option value="queenstown">Chubut</option>
        <option value="queenstown">San Luis</option>
        <option value="queenstown">Catamarca</option>
        <option value="queenstown">La Rioja</option>
        <option value="queenstown">La Pampa</option>
        <option value="queenstown">Santa Cruz</option>
        <option value="queenstown">Tierra del Fuego, Antártida e Islas del Atlántico Sur</option>
        
        

        
    </select>
</form>
</body>
</html>