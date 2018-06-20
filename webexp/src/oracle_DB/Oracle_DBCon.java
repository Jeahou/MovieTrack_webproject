package oracle_DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
/*
Database
1. 자바와 데이터베이스 연결은 다음과 같은 code 절차로 진행 된다.
	1) 메모리에 jdbc 드라이버 로드.(서버와 연결할 수 있게끔)
	   - 만들어진 socket 통신을 통한 서버접속 lib 가져와서 처리..
	   - DriverManger
	2) 데이터베이스 정보와 이를 연결시켜주는 객체 통해서 DB server와 연결.
	   - host(ip), port(1521), sid(DB식별정보), 계정명, 패스워드
	   - Connection
	3) sql문을 실행
		select * from emp, insert into emp values(..... )
	   - Statement, 
	     결과값을 가져오는 객체
	   - ResultSet
	4) 예외 처리와 자원의 해제..io, close()
	   - try{}catch(SQLExpceion){}finally{ db.close();}
*/
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
