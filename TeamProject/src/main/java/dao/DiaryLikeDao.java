package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DiaryLikeDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		return conn;
	}
	public void addDiaryLikeDto(int idx, int dno) throws Exception{
		Connection conn = getConnection();
		String sql = "INSERT INTO diary_like(idx, dno) VALUES(?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setInt(2, dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void deleteDiaryLikeDto(int idx, int dno)throws Exception{
		Connection conn = getConnection();
		String sql="DELETE FROM diary_like WHERE idx=? AND dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setInt(2, dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void deleteDiaryLikeDto(int dno)throws Exception{
		Connection conn = getConnection();
		String sql="DELETE FROM diary_like WHERE dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public int checkDiaryLikeDto(int idx, int dno) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT * FROM diary_like WHERE idx=? AND dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,idx);
		pstmt.setInt(2, dno);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {}
		int check = rs.getRow();
		return check;
	}
}
