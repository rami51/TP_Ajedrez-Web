package Capa_de_Presentación;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Capa_de_Entidades.ControladorAjedrez;
import Capa_de_Entidades.Jugador;

/**
 * Servlet implementation class RegistrarJugador
 */
@WebServlet("/RegistrarJugador")
public class RegistrarJugador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarJugador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ControladorAjedrez caj = new ControladorAjedrez();
		Jugador j = new Jugador();
		j.setApellido(request.getParameter("apellido"));
		j.setNombre(request.getParameter("nombre"));
		j.setDni(Integer.parseInt(request.getParameter("dni")));
		caj.registrarJugador(j);
		response.sendRedirect("Inicio.html");
		response.getWriter().println("Nuevo jugador registrado con éxito.");
	}

}
