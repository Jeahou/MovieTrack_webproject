package sevlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginModel;


/**
 * Servlet implementation class LogoutCtrl
 */
@WebServlet(name = "Logout.do", urlPatterns = { "/Logout.do" })
public class LogoutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	    private LoginModel service;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public LogoutCtrl() {
	        super();
	        // TODO Auto-generated constructor stub
	        service = new LoginModel();
	    }

		/**
		 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
//			1. 요청값.

//			2. model 클래스 처리.
//			  해당 데이터가 있으면 페이지를 a03_main.jsp로 가게 하면서,
//			 session으로 처리..
//			  없으면 다시 login페이지로 가면서 인증된 계정이 아닙니다.
			String page = "MovieMain.jsp";
			HttpSession session = request.getSession();
			
			if(session.getAttribute("mem") != null) {
				session.removeAttribute("mem");
				page = "MovieMain.jsp";
			}
			
//			3. view 선택 및 처리..
			request.getRequestDispatcher(page).forward(request, response);
		}

	}