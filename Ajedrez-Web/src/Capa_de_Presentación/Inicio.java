package Capa_de_Presentación;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Capa_de_Entidades.ControladorAjedrez;
import Capa_de_Entidades.Jugador;
import Capa_de_Entidades.Partida;

/**
 * Servlet implementation class Inicio
 */
@WebServlet("/Inicio")
public class Inicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inicio() {
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
		Jugador j1 = new Jugador();
		Jugador j2 = new Jugador();
		ControladorAjedrez caj = new ControladorAjedrez();
		j1 = caj.buscarJugador(Integer.parseInt(request.getParameter("dni1")));
		j2 = caj.buscarJugador(Integer.parseInt(request.getParameter("dni2")));
		request.getSession().setAttribute("j1", j1);
		request.getSession().setAttribute("j2", j2);
		if(request.getParameter("eventoVerJuegosPend")!=null){
			ArrayList<Partida> partidas = caj.buscarPartidas(j1.getDni(), j2.getDni());
			request.getSession().setAttribute("partidas", partidas);
			request.getRequestDispatcher("JuegosPendientes.jsp").forward(request, response);
		}
		if(request.getParameter("eventoNuevaPartida")!=null){
			caj.nuevaPartida(j1.getDni(), j2.getDni());
			Partida partida = caj.getPartidaActual();
			request.getSession().setAttribute("partidaActual", partida);
			
			request.getRequestDispatcher("JuegoActual.jsp").forward(request, response);
		}
	}

}
