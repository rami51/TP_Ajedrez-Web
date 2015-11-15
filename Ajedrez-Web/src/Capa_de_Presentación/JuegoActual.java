package Capa_de_Presentación;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Capa_de_Entidades.ControladorAjedrez;
import Capa_de_Entidades.Partida;
import Capa_de_Entidades.Posicion;

/**
 * Servlet implementation class JuegoActual
 */
@WebServlet("/JuegoActual")
public class JuegoActual extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControladorAjedrez caj = new ControladorAjedrez();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JuegoActual() {
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
		int idPieza = Integer.parseInt(request.getParameter("IdPieza"));
		char letra = request.getParameter("letra").toCharArray()[0];
		int numero = Integer.parseInt(request.getParameter("numero"));
		Posicion p = new Posicion();
		p.setLetra(letra);
		p.setNumero(numero);
		//ControladorAjedrez.setPartidaActual((Partida)request.getSession().getAttribute("partidaActual"));
		if(caj.moverPieza(idPieza, p)){
			request.getSession().setAttribute("mensaje", "Movimiento realizado correctamente.");
		}
		else{
			request.getSession().setAttribute("mensaje", "Movimiento inválido, vuelva a intentar.");
		}
		request.getSession().setAttribute("partidaActual", caj.getPartidaActual());
		request.getSession().setAttribute("ganador", caj.getGanador());
		if(request.getSession().getAttribute("ganador")!=null){
			request.getRequestDispatcher("Ganador.jsp").forward(request, response);
		}
		else
		request.getRequestDispatcher("JuegoActual.jsp").forward(request, response);
		}
	}

