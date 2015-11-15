<%@ page import="Capa_de_Entidades.Jugador"%>
<%@ page import="Capa_de_Entidades.Partida"%>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajedrez JF - Juegos Pendientes</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%Jugador j1 = (Jugador)request.getSession().getAttribute("j1");
	  Jugador j2 = (Jugador)request.getSession().getAttribute("j2");
	  ArrayList<Partida> partidas = (ArrayList<Partida>)request.getSession().getAttribute("partidas");
	   %>
	<div class="container" style="background-color:#FFFFFF">
		<div class="row">
			<div class="col-xs-3" style="background-color:#ffffff"></div>
			<div class="col-xs-6" style="background-color:#ffffff">
				<h3>Juegos Pendientes entre</h3>
				<h5><%= j1.getNombre()%> <%=j1.getApellido() %> y <%=j2.getNombre()%> <%=j2.getApellido() %></h5>
				<table border="1" class="table table-bordered">
					<tr>
						<th>ID-Partida</th>
					</tr>
					<%for (Partida partida : partidas){%>
						<tr>
							<td><%=partida.getIdPartida()%></td>
						</tr>
					<%}%>
				</table>
				<form role="form" action="JuegosPendientes" method="post" id="formJuegosPendientes" name="formJuegosPendientes">
					<div class="form-group">
						<label for="idPartida">Ingrese el ID de la partida a continuar:</label>
						<input class="form-control" type="text" name="idPartida" size="20" id="idPartida">
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-block" type="submit" value="Continuar Partida" id="eventoContinuar" name="eventoContinuar"/>
					</div>
				</form>
				<a href="Inicio.html">Volver</a>
			</div>
			<div class="col-xs-3" style="background-color:#ffffff"></div>
		</div>
	</div>
</body>
</html>