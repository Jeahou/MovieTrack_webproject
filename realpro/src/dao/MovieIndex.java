package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.Cus;
import vo.Movie;
import vo.MovieDetail;
import vo.MovieImg;
import vo.MovieJ;

public class MovieIndex {
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
	public Object excepClose(int funIdx, Object ob, Object ob2) {
		Object reob = null;
		try {
			if(funIdx == 0) reob = show((Movie) ob, (MovieImg) ob2);
			if(funIdx == 1) reob = showMovie((Movie) ob, (MovieImg) ob2);
			if(funIdx == 2) reob = showLatest((Movie) ob);
			if(funIdx == 3) reob = showRank();
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
	
	public MovieJ show(Movie m, MovieImg i) throws SQLException {
		setConn();
		String sql = "select m_nam, m_pop from movie a, movie_img b WHERE a.m_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,m.getM_num());
		rs=pstmt.executeQuery();
		MovieJ M = null;
		if(rs.next()){
			M = new MovieJ();
			M.setName(rs.getString("m_nam"));
			M.setPop(rs.getString("m_pop"));
		}
		rs.close();
		pstmt.close();
		con.close();
	return M;

	}
	
	public ArrayList<MovieJ> showMovie(Movie m, MovieImg i) throws SQLException {
		ArrayList<MovieJ> mlist = new ArrayList<MovieJ>();
		setConn();
		String sql = "select a.m_num, m_nam, m_pop from movie a, movie_img b "
				+ "where a.M_NUM = b.M_NUM and a.M_type = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m.getType());
		rs = pstmt.executeQuery();
		MovieJ mj = null;
		while(rs.next()) {
			mj = new MovieJ();
			mj.setNum(rs.getInt("m_num"));
			mj.setName(rs.getString("m_nam"));
			mj.setPop(rs.getString("m_pop"));
			mlist.add(mj);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return mlist;
	}
	
	public ArrayList<MovieJ> showLatest(Movie m) throws SQLException {
		ArrayList<MovieJ> mlist = new ArrayList<MovieJ>();
		setConn();
		String sql = "select a.m_num, m_nam, m_pop from movie a, movie_img b WHERE a.M_NUM = b.M_NUM order by m_day desc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		MovieJ mj = null;
		while(rs.next()) {
			mj = new MovieJ();
			mj.setNum(rs.getInt("m_num"));
			mj.setName(rs.getString("m_nam"));
			mj.setPop(rs.getString("m_pop"));
			mlist.add(mj);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return mlist;
	}
	
	public ArrayList<MovieJ> showRank() throws SQLException {
		ArrayList<MovieJ> rlist = new ArrayList<MovieJ>();	
		setConn();
		String sql = "select a.m_num, m_nam, m_pop " 
				+ "from movie a, (select m_num, AVG(r_star) avgStar "
				+ "from (select a.*, b.r_star  from movie a, movie_review b where a.M_NUM = b.M_NUM) GROUP by m_num) b, movie_img c " 
				+ "where a.m_num = b.m_num and a.m_num = c.m_num order by avgstar desc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		MovieJ rj = null;
		while(rs.next()) {
			rj = new MovieJ();
			rj.setNum(rs.getInt("m_num"));
			rj.setName(rs.getString("m_nam"));
			rj.setPop(rs.getString("m_pop"));
			rlist.add(rj);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return rlist;
	}
	/*public MovieJ showIn(Movie m,)*/
	/*public static void main(String[] args) {
		Movie k = new Movie("액션,범죄");
		MovieImg i = new MovieImg(1);
		MovieIndex i1 = new MovieIndex();
		ArrayList<MovieJ> t = (ArrayList<MovieJ>)i1.excepClose(1, k, i);
		System.out.println(t.get(0).getName());
		System.out.println(t.get(1).getName());
	}
	*/
/*	public static void main(String[] args) {
		Movie k = new Movie(1);
		MovieImg i = new MovieImg(1);
		MovieIndex i1 = new MovieIndex();
		MovieJ m = (MovieJ)i1.excepClose(0, k, i);
		System.out.println(m.getName());
		System.out.println(m.getPop());
	}*/
/*	public static void main(String[] args) {
		Movie k = new Movie();
		MovieImg i = new MovieImg();
		MovieIndex i1 = new MovieIndex();
		ArrayList<MovieJ> m = (ArrayList<MovieJ>)i1.excepClose(3, k, i);
		System.out.println(m.get(0).getName());
		System.out.println(m.get(0).getNum());
	}*/
}
