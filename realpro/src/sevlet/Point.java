package sevlet;

import vo.Cus;
import service.PointModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Point", urlPatterns = {"/charge.do"})
public class Point extends HttpServlet {
    private PointModel service;

    public Point(){
        super();
        service = new PointModel();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        int point = Integer.parseInt(request.getParameter("money"));

        HttpSession session = request.getSession();

        String page = "login.jsp";

        if(id!=null){
            Cus UpdatePoint = service.UpdatePoint(new Cus(id, point));

            if(UpdatePoint!=null){
                session.setAttribute("point", point + " 충전이 완료되었습니다");
                page = "login.jsp";
            }

            else{
                request.setAttribute("point", "충전할 금액을 선택해주세요");
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
