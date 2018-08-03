package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Review;



public class MovieReview {

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
			if(funIdx == 0 ) reob = showReview((Review) ob);
			if(funIdx == 1)  insertReview((Review) ob);
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
	public ArrayList<Review> showReview(Review r) throws SQLException{
		setConn();
		ArrayList<Review> rl = new ArrayList<Review>();
		String sql = "select b.nikname, a.c_num, m_num, r_num, r_title, r_content, r_date, r_star "
				+ "from movie_review a, cus b where a.c_num = b.c_num and m_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, r.getM_num());
		rs = pstmt.executeQuery();
		Review rw = null;
		while(rs.next()) {
			rw = new Review();
			rw.setName(rs.getString("nikname"));
			rw.setC_num(rs.getInt("c_num"));
			rw.setM_num(rs.getInt("m_num"));
			rw.setR_num(rs.getInt("r_num"));
			rw.setTitle(rs.getString("r_title"));
			rw.setContent(rs.getString("r_content"));
			rw.setDate(rs.getString("r_date").substring(0, 10));
			rw.setStar(rs.getInt("r_star"));
			rl.add(rw);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return rl;
	}
	
	public void insertReview(Review r) throws SQLException {
		setConn();
		String sql = "insert into movie_review "
				+ "values((select c_num from cus where nikname = ?), ?, review_seq.nextval, ?, ?, sysdate, ?)";
		con.setAutoCommit(false);
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,r.getName());
		pstmt.setInt(2, r.getM_num());
		pstmt.setString(3, r.getTitle());
		pstmt.setString(4, r.getContent());
		pstmt.setInt(5, r.getStar());
		pstmt.executeUpdate();
		con.commit();
		System.out.println("등록 성공");
	}
	
	/*public static void main(String[] args) {
		MovieReview mr = new MovieReview();
		Review r = new Review("도깨비", 2, "지린다", "지렷다", 5);
		mr.excepClose(1, r);
	}*/
}


