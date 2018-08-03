package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.Cus;

public class Login {
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
			if(funIdx == 0) reob = setinfo((Cus) ob);
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
	public Cus setinfo(Cus ind) throws SQLException {
			setConn();
			String sql1 = "select * from cus where id = ? and pass = ?";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1,ind.getId());
			pstmt.setString(2,ind.getPass());
			rs=pstmt.executeQuery();
			Cus rd= null;
			if(rs.next()){
				rd = new Cus();
				rd.setId(rs.getString("id"));
				rd.setPass(rs.getString("pass"));
				rd.setNikname(rs.getString("nikname"));
				rd.setPoint(rs.getInt("point"));
			}
			rs.close();
			pstmt.close();
			con.close();
		return rd;
	}
	/*public Cus checkinfo(Cus ind) throws SQLException {
		setConn();
		String sql2 = "select * from cus where id = ?";
		return ;
	}*/
	
/*    public static void main(String[] args) {
    	Cus c = new Cus("acon1","1111");
    	Login l = new Login();
    	Cus k = (Cus) l.excepClose(0, c);
    	System.out.println(k.getId());
  
    }*/
	
}
