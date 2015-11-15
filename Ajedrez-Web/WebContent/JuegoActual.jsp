<%@ page import="Capa_de_Entidades.Jugador"%>
<%@ page import="Capa_de_Entidades.Partida"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Capa_de_Entidades.Pieza"%>
<%@ page import="Capa_de_Entidades.ControladorAjedrez"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajedrez JF - Partida Actual</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<%	ControladorAjedrez caj = new ControladorAjedrez();
	if(caj.getGanador()!=null) request.getRequestDispatcher("Ganador.jsp").forward(request, response); %>
<body>
	<%
	  Partida partidaActual = (Partida)request.getSession().getAttribute("partidaActual");
	  Pieza[] piezas = partidaActual.getPiezas();
	  
	%>
	<div class="container" style="background-color:#FFFFFF">
		<div>
			<h1 class="text-center">Ajedrez-JF</h1>		
		</div>
		<div class="row">
			<div class="col-xs-4" style="background-color:#ffffff">
				<div class="form-group">
					<label><%=partidaActual.getJ1().getNombre()%> <%=partidaActual.getJ1().getApellido()%></label>
				</div>
				<table border="1" class="table table-bordered table-condensed">
					<tr colspan="4">
						<th>Blancas</th>
					</tr>
					<tr>
						<th>ID-Pieza</th><th>Pieza</th><th>Letra</th><th>Número</th>
					</tr>
					<%for(Pieza p : piezas){
						if(p.getColor().equals("b")&&p.isEstado()){ %>
						<tr>
							<td><%=p.getIdPieza()%></td><td><%=p.getNombre()%></td><td><%=p.getPosicion().getLetra()%></td><td><%=p.getPosicion().getNumero() %></td>
						</tr>
					<%}} %>
				</table>
			</div>
			<div class="col-xs-4" style="background-color:#ffffff">
				<div class="form-group">
					<br>
					<br>
					<h3 class="text-center">Turno: <%if(partidaActual.getTurno()=='b'){ %><%="Blancas"%><%} %><%
									if(partidaActual.getTurno()=='n'){ %><%="Negras"%><%} %></h3>
				</div>
				<br><br>
				<form role="form" action="JuegoActual" method="post" id="formJA" name="formJA">
					<div class="form-group">
						<label for = "numero">ID de Pieza:</label>
						<input class="form-control" type="text" name="IdPieza" size="20" id="IdPieza">
					</div>
					<div class="form-group">
					<label>Mover a...</label>
						<div class="row">
							<div class="col-xs-6" style="background-color:#ffffff">
								<label for = "letra">Letra:</label>
								<input class="form-control" type="text" name="letra" size="10" id="letra">
							</div>
							<div class="col-xs-6" style="background-color:#ffffff">
								<label for = "numero">Número:</label>
								<input class="form-control" type="text" name="numero" size="10" id="numero">
							</div>
						</div>					
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-block" type="submit" value="Mover" id="eventoMover" name="eventoMover"/>
					</div>
				</form>
				<h4 class="text-center">Mensaje:</h4>
				<p><%=request.getSession().getAttribute("mensaje")%></p>
			</div>
			<div class="col-xs-4" style="background-color:#ffffff">
				<div class="form-group">
					<label><%=partidaActual.getJ2().getNombre()%> <%=partidaActual.getJ2().getApellido()%></label>
				</div>
				<table border="1" class="table table-bordered table-condensed">
					<tr colspan="4">
						<th>Negras</th>
					</tr>
					<tr>
						<th>ID-Pieza</th><th>Pieza</th><th>Letra</th><th>Número</th>
					</tr>
					<%for(Pieza p : piezas){
						if(p.getColor().equals("n")&&p.isEstado()){ %>
						<tr>
							<td><%=p.getIdPieza()%></td><td><%=p.getNombre()%></td><td><%=p.getPosicion().getLetra()%></td><td><%=p.getPosicion().getNumero() %></td>
						</tr>
					<%}} %>
				</table>			
			</div>
</body>
</html>