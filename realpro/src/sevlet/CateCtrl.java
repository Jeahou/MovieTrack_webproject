package sevlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MoviepopModel;
import vo.MovieJ;
import vo.Movie;
import vo.MovieImg;

/**
 * Servlet implementation class CateCtrl
 */
@WebServlet("/CateCtrl.do")
public class CateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MoviepopModel service;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CateCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new MoviepopModel();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		String mov = request.getParameter("mov");
		
		String page = "MovieMain.jsp";
		HttpSession s = request.getSession();
		

		if(type.equals("4")) {
			page = "Moviecate.jsp";
			Movie m = new Movie("공포,스릴러");
			MovieImg i = new MovieImg();
			ArrayList<MovieJ> mj = service.showMovie(m, i);
			s.setAttribute("MovieS", mj);
		}else if(type.equals("2")) {
			page = "Moviecate.jsp";
			Movie m = new Movie("액션,범죄");
			MovieImg i = new MovieImg();
			ArrayList<MovieJ> mj = service.showMovie(m, i);
			s.setAttribute("MovieS", mj);
		}else if(type.equals("latest")) {
			page = "Moviecate.jsp";
			Movie m = new Movie();
			MovieImg i = new MovieImg();
			ArrayList<MovieJ> mj = service.showLatest(m, i);
			s.setAttribute("MovieS", mj);
		}else if(type.equals("ranking")) {
			page = "Moviecate.jsp";
			Movie m = new Movie();
			MovieImg i = new MovieImg();
			ArrayList<MovieJ> mj = service.showRank(m, i);
			s.setAttribute("MovieS", mj);
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
