package oracle_DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Oracle_DBCon {
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	
	public void setCon() {
		try {
			// 로드
			Class.forName(driverName);
			// 연결
			con = DriverManager.getConnection(url,user,password);
			System.out.println("연결 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
