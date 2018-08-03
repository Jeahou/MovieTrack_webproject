package sevlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadCtrl
 */
@WebServlet("/DownloadCtrl.do")
public class DownloadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = request.getParameter("downfile");
		String filePath = "c:\\temp\\" + fileName ;
		int userPoint = Integer.parseInt(request.getParameter("userPoint"));
		int point = Integer.parseInt(request.getParameter("point"));
		String page = "MovieCate(in).jsp";
		System.out.println("파일 경로 : " + filePath);
		File file = new File(filePath);
		System.out.println(fileName);
		System.out.println(userPoint);
		System.out.println(point);
		
		if(userPoint >= point ) {
				if(file.exists() && file.isFile()) {
					try {
						long fileSize = file.length();
						System.out.println("파일 사이즈 : " + fileSize);
						response.setContentType("application/octet-stream");
						response.setContentLength((int)fileSize);
						String strClient = request.getHeader("user-agent");
						
						if(strClient.indexOf("MSIE 5.5") != -1) {
							response.setHeader("Content-Disposition", "fileName="+fileName+";");
						}else {
							fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
							response.setHeader("Content-Disposition", "attachment; fileName="+fileName+";");
						}
						response.setHeader("Content-Length", String.valueOf(fileSize));
						response.setHeader("Content-Transfer-Encoding", "binary");
						response.setHeader("Pragma", "no-cache");
						response.setHeader("Cache-Control", "private");
						
						byte b[] = new byte[(int)fileSize];
						
						BufferedInputStream ins = new BufferedInputStream(new FileInputStream(file));
						
						BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
						
						int read = 0;
						
						while((read = ins.read(b)) != -1) {
							outs.write(b, 0, read);
						}
						outs.flush();
						outs.close();
						ins.close();
					}catch(Exception e) {
						System.out.println("Exception 에러");
					}
				}
				else {
					System.out.println("파일 다운로드 에러");
				}
		}else {
			request.setAttribute("noPoint", "포인트가 부족합니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
