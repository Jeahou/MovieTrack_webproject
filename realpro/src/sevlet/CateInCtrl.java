package sevlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Movie;
import vo.MovieDetail;
import vo.MovieImg;
import vo.MovieJ;
import vo.Review;

import service.ReviewModel;
import service.MovieInModel;
/**
 * Servlet implementation class CateInCtrl
 */
@WebServlet("/CateInCtrl.do")
public class CateInCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private MovieInModel service;
       private ReviewModel service2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CateInCtrl() {
        super();
        service = new MovieInModel();
        service2 = new ReviewModel();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mov = request.getParameter("mov");
		int movN = Integer.parseInt(request.getParameter("movN"));
		HttpSession s = request.getSession();
		
		String page = "MovieCate(in).jsp";
		
		if(mov.equals("1")) {
			Movie m = new Movie(movN);
			Review r = new Review(movN);
			MovieImg i = service.showImg(m);
			MovieJ j = service.show(m);
			ArrayList<Review> rl = service2.showReview(r);
			s.setAttribute("MovieReview", rl);
			s.setAttribute("MovieI", j);
			s.setAttribute("MovieImg", i);
			page = "MovieCate(in).jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

}
