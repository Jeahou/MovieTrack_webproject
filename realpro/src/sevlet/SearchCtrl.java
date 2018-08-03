package sevlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MovieSearch;
import vo.MovieJ;

/**
 * Servlet implementation class SearchCtrl
 */
@WebServlet("/SearchCtrl.do")
public class SearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private MovieSearch service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCtrl() {
        super();
        service = new MovieSearch();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = "Moviecate.jsp";
		String search = request.getParameter("s");
		HttpSession s = request.getSession();
		if(search != null) {
			ArrayList<MovieJ> mj =service.showSearch(search);
			s.setAttribute("MovieS", mj);
			page = "Moviecate.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

}
