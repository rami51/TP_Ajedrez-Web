<%@ page import="Capa_de_Entidades.Jugador" %>
<%@ page import="Capa_de_Entidades.Partida" %>
<%@ page import="Capa_de_Entidades.ControladorAjedrez" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajedrez JF - Ganador</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="background-color:#FFFFFF">
 	<div class="row">
   		<div class="col-xs-2" style="background-color:#ffffff"></div>
   		<div class="col-xs-8"  style="background-color:#ffffff">
   			<h1 class= "text-center"><img alt="Ganador" src="trophy.png"></h1>
   			<% Partida partida = (Partida)request.getSession().getAttribute("partidaActual");
   			   String winner="";
   			   ControladorAjedrez caj = new ControladorAjedrez();
   			   if(caj.getGanador().equals("Blancas")) 
   				   winner=partida.getJ1().getNombre() + " " + partida.getJ1().getApellido() + " es el ganador!";
   			   if(caj.getGanador().equals("Negras")) 
   				   winner=partida.getJ2().getNombre() + " " + partida.getJ2().getApellido() + " es el ganador!";
   			%>
   			<h1 class="text-center"><%=winner%></h1>
   		</div>
   		<div class="col-xs-2" style="background-color:#ffffff"></div>

</body>
</html>