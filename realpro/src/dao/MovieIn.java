package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Movie;
import vo.MovieImg;
import vo.MovieJ;
import vo.Review;

public class MovieIn {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws SQLException {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "scott", "tiger");
			System.out.println("정상 접속 성공!!!");		
	}
	public Object excepClose(int funIdx, Object ob) {
		Object reob = null;
		try {
			if(funIdx == 0) reob = show((Movie) ob);
			if(funIdx == 1) reob = showImg((Movie) ob);
			if(funIdx == 2) reob = showStar((Movie) ob);
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("DB 관련 예외 발생 : " + e.getMessage() );
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("기타 예외 발생시 : " + e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return reob;
	}
	
	public MovieJ show(Movie m) throws SQLException {
		setConn();
		String sql = "select a.m_num, m_nam,m_preshow, m_pop, m_day, M_TYPE, M_dir, M_ACT1, m_act2, m_act3, m_grd, m_pri, m_rt "
				+ "from movie a, MOVIE_DETAIL b, MOVIE_IMG c where a.M_NUM = b.M_NUM and b.M_num = c.M_NUM and a.M_num =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,m.getM_num());
		rs=pstmt.executeQuery();
		MovieJ M = null;
		if(rs.next()){
			M = new MovieJ();
			M.setNum(rs.getInt("m_num"));
			M.setName(rs.getString("m_nam"));
			M.setAvi(rs.getString("m_preshow"));
			M.setPop(rs.getString("m_pop"));
			M.setDate(rs.getString("m_day").substring(0, 10));
			M.setType(rs.getString("m_type"));
			M.setDir(rs.getString("m_dir"));
			M.setAct1(rs.getString("m_act1"));
			M.setAct2(rs.getString("m_act2"));
			M.setAct3(rs.getString("m_act3"));
			M.setGrd(rs.getString("m_grd"));
			M.setPri(rs.getInt("m_pri"));
			M.setRt(rs.getString("m_rt"));
		}
		rs.close();
		pstmt.close();
		con.close();
	return M;
	}
	
	public MovieImg showImg(Movie m) throws SQLException {
		setConn();
		String sql = "select M_IMG1, m_img2, m_img3, M_IMG4, m_img5 from movie_img where m_num = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, m.getM_num());
		rs = pstmt.executeQuery();
		MovieImg mi = null;
		if(rs.next()) {
			mi = new MovieImg();
			mi.setImg1(rs.getString("m_img1"));
			mi.setImg2(rs.getString("m_img2"));
			mi.setImg3(rs.getString("m_img3"));
			mi.setImg4(rs.getString("m_img4"));
			mi.setImg5(rs.getString("m_img5"));
		}
		rs.close();
		pstmt.close();
		con.close();
		return mi;
	}
	public Review showStar(Movie m) throws SQLException {
		setConn();
		String sql = "select a.m_num ,round(AVG(r_star), 1) from movie a, movie_review b where a.M_NUM = b.M_NUM and a.M_NUM =? group by a.m_num";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, m.getM_num());
		rs = pstmt.executeQuery();
		Review r = null;
		if(rs.next()) {
			r = new Review();
			r.setStar(rs.getDouble("round(AVG(r_star),1)"));
		}
		rs.close();
		pstmt.close();
		con.close();
		return r;
		}
	}
/*public static void main (String[] args) {
		Movie m = new Movie(1);
		MovieIn k = new MovieIn();
		MovieJ t = (MovieJ) k.excepClose(0, m);
		System.out.println(t.getName());
		System.out.println(t.getAct1());
		System.out.println(t.getPop());
		System.out.println(t.getDate());
	}
*/

