package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class PageTotal {
	public Connection getConnetion() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		
		return conn;
	};
	
	public int getNoticePageTotla() throws Exception {
		int totalpage = 1;
		Connection conn = getConnetion();
		String sql = "SELECT count(*)/6+0.9 count FROM notice";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			totalpage = rs.getInt("count");
		};
		
		rs.close();
		pstmt.close();
		conn.close();
		return totalpage;
	};
	
	public int getFandaSignUpPageTotal()throws Exception {
		Connection conn = getConnetion();
		int totalpage = 1;
		String sql = "SELECT count(*)/6+0.9 count FROM fanda WHERE category = '회원가입'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			totalpage = rs.getInt("count");
		};
	
		rs.close();
		pstmt.close();
		conn.close();
		return totalpage;
	};
	public int getFandaDiaryPageTotal() throws Exception {
		Connection conn = getConnetion();
		int totalpage = 1;
		String sql = "SELECT count(*)/6+0.9 count FROM fanda WHERE category = '여행기 작성'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			totalpage = rs.getInt("count");
		};
	
		rs.close();
		pstmt.close();
		conn.close();
		return totalpage;	
	};
	public int getFandaPlanPageTotal() throws Exception{
		Connection conn = getConnetion();
		int totalpage = 1;
		String sql = "SELECT count(*)/6+0.9 count FROM fanda WHERE category = '여행 일정 작성'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			totalpage = rs.getInt("count");
		};
	
		rs.close();
		pstmt.close();
		conn.close();
		return totalpage;	
	};
	
	public int getFandaExceptPageTotal() throws Exception{
		Connection conn = getConnetion();
		int totalpage = 1;
		String sql = "SELECT count(*)/6+0.9 count FROM fanda WHERE category = '기타'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			totalpage = rs.getInt("count");
		};
	
		rs.close();
		pstmt.close();
		conn.close();
		return totalpage;	
	};
	public int getQandaPageTotal(int idx) throws Exception {
		Connection conn = getConnetion();
		PreparedStatement pstmt = null;
		String sql = "";
		int totalpage = 1;
		if(idx==0) {
		sql = "SELECT count(*)/6+0.9 count FROM qanda";
		pstmt = conn.prepareStatement(sql);
		}else {
		sql = "SELECT count(*)/6+0.9 count FROM qanda WHERE idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		}
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			totalpage = rs.getInt("count");
		};
		rs.close();
		pstmt.close();
		conn.close();
		return totalpage;
	};
}












