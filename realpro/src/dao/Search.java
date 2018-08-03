package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MovieJ;

public class Search {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws SQLException{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		String url = "jdbc:oracle:thin:@192.168.0.68:1521:xe";
		con = DriverManager.getConnection(url,"scott","tiger");
		System.out.println("접속 성공");
	}
	
	public Object excepClose(int funIdx, Object ob) {
		Object reob = null;
		try {
			if(funIdx == 0) reob = showSearch((String) ob);
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("DB 관련 예외 : " + e.getMessage());
			try {
				con.rollback();
			} catch(Exception e1){
				e1.printStackTrace();
				System.out.println("기타 예외 발생 : " + e1.getMessage());
			}finally {
				// TODO: handle finally clause
				if(rs != null)
					try {
						rs.close();
					} catch (SQLException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
				if(pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e3) {
						// TODO Auto-generated catch block
						e3.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e4) {
						// TODO Auto-generated catch block
						e4.printStackTrace();
					}
			}
		}
		return reob;
	}
	public ArrayList<MovieJ> showSearch(String m) throws SQLException{
		setConn();
		ArrayList<MovieJ> mjl = new ArrayList<MovieJ>();
		String sql = "select a.m_num, m_nam, m_pop from movie a, movie_img b WHERE a.M_NUM = b.M_NUM "
				+ "and (a.M_type like '%'||?||'%' or a.M_NAM like '%'||?||'%')";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m);
		pstmt.setString(2, m);
		rs = pstmt.executeQuery();
		MovieJ mj = null;
		while(rs.next()) {
			mj = new MovieJ();
			mj.setNum(rs.getInt("m_num"));
			mj.setName(rs.getString("m_nam"));
			mj.setPop(rs.getString("m_pop"));
			mjl.add(mj);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return mjl;
	}
}

