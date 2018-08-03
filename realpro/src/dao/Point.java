package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import vo.Cus;

public class Point {
	private Connection con;
	private Statement stmt;
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
			if(funIdx == 0) UpdatePoint((Cus) ob);
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
	public void UpdatePoint(Cus point2) throws SQLException {
	    setConn();
	    String sql = "Update cus set point = (point + ?) where id = ? ";
	    pstmt = con.prepareStatement(sql);
	    con.setAutoCommit(false);
	    pstmt.setInt(1, point2.getPoint());
	    pstmt.setString(2, point2.getId());
	    pstmt.executeUpdate();
	    con.commit();
	}
}
