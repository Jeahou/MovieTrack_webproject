package sevlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginModel;
import vo.Cus;


/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet(name = "login.do", urlPatterns = {"/login.do"})
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LoginModel service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new LoginModel();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		1. 요청값.
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		String contextPath = request.getContextPath();
		String reqUri = request.getRequestURI();
		
//		2. model 클래스 처리.
//		  해당 데이터가 있으면 페이지를 a03_main.jsp로 가게 하면서,
//		 session으로 처리..
//		  없으면 다시 login페이지로 가면서 인증된 계정이 아닙니다.
		String page = "Movielogin.jsp";
		HttpSession session = request.getSession();
		if(id!=null) {
			Cus login = service.login(new Cus(id,pass));
			// 인증처리된 내용..
			if(login != null) {
				session.setAttribute("mem", login);
				page="MovieMain(login).jsp";
			}else {
				request.setAttribute("msg", id+"는 인증된 계정이 아닙니다!");
			}
		}
		if(reqUri.equals(contextPath + "/logout.do")) {
			session.removeAttribute("mem");
			page = "MovieMain.jsp";
		}
		
//		3. view 선택 및 처리..
		request.getRequestDispatcher(page).forward(request, response);
	}

}
