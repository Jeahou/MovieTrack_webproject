package sevlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.HttpJspPage;

import service.RegModel;
import vo.Cus;

/**
 * Servlet implementation class RegCtrl
 */
@WebServlet(name = "RegCtrl.do", urlPatterns = { "/RegCtrl.do" })
public class RegCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private RegModel service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new RegModel();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String nick = request.getParameter("nickname");
		String gender = request.getParameter("rr");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String chId = request.getParameter("RegType");
		boolean ck = false;
		
		HttpSession session = request.getSession();
		session.removeAttribute("reg");
		session.removeAttribute("cusid");
		String page = "Moviereg2.jsp";
		if(chId.equals("checkId")){
			if(id != null) {
				ck = service.checkid(new Cus(id));
					if(ck == true) {
						request.setAttribute("regout", "중복된 아이디 입니다.");
					}
					else if(ck == false) {
						request.setAttribute("checkok", "사용가능한 아이디입니다.");
						session.setAttribute("cusid", id);
						page = "Moviereg3.jsp";
					}
				}

		}else if(chId.equals("reg")) {

			if (ck == false) {
				service.reg(new Cus(id, pass, name, nick, gender, birth, phone));
				session.setAttribute("reg", "회원가입 되셧습니다. 축하합니다.");
				page = "Movielogin.jsp";
			}
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

}
