package sevlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MenuCtrl
 */
@WebServlet("/MenuCtrl")
public class MenuCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청
		String proc = request.getParameter("proc");
		// 2. 모델
		// 3. view 단 호출..
		String page = "practice_mvc/main.jsp";
		System.out.print("proc : " +proc);
		if(proc != null && proc.equals("main")) page = "practice_mvc/main.jsp";
		// detail 상세화면
		// sch 조회화면
		// insForm 입력 화면
		if(proc != null && proc.equals("insForm")) page = "practice_mvc/insForm.jsp";
		// detail 상세화면
		if(proc != null && proc.equals("detail")) page = "practice_mvc/detail.jsp";
		// insProc 입력 처리
		// uptProc 수정 처리
		// delProc 삭제 처리
		request.getRequestDispatcher(page).forward(request, response);
	}

}
