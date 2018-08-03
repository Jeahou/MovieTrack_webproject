package sevlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewModel;
import vo.Review;

/**
 * Servlet implementation class ReviewCtrl
 */
@WebServlet("/ReviewCtrl.do")
public class ReviewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private ReviewModel service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCtrl() {
        super();
        service = new ReviewModel();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("id");
		int star = Integer.parseInt(request.getParameter("star"));
		String title = request.getParameter("boardTitle");
		String content = request.getParameter("boardContent");
		int movieNum = Integer.parseInt(request.getParameter("movie_num"));
		
		String page = "CateInCtrl.do?mov=1&movN="+movieNum ;
		
		service.insertReview(new Review(name, movieNum, title, content, star));
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
