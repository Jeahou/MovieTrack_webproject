package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.Cus;

public class Reg {
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
			if(funIdx == 0) reob = checkid((Cus) ob);
			if(funIdx == 1) reg((Cus) ob);
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
	public boolean checkid(Cus ind) throws SQLException {
		boolean check = false;
		setConn();
		String sql2 = "select * from cus where id = ?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setString(1, ind.getId());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			check = true;
		}
		return check;
	}
	public void reg(Cus ind) throws SQLException {
		setConn();
		String sql3 = "insert into cus(c_num, id, pass, name, nikname, gender, birth, phonenum) values(CUS_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		con.setAutoCommit(false);
		pstmt = con.prepareStatement(sql3);
		pstmt.setString(1, ind.getId());
		pstmt.setString(2, ind.getPass());
		pstmt.setString(3, ind.getName());
		pstmt.setString(4, ind.getNikname());
		pstmt.setString(5, ind.getGender());
		pstmt.setString(6, ind.getBirth());
		pstmt.setString(7, ind.getPhonenum());
		pstmt.executeUpdate();
		con.commit();
	}
}
