package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.DiaryCmtDto;


public class DiaryCmtDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		return conn;
	}
	public ArrayList<DiaryCmtDto> getCmtDto(int dno) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT *"
				+ " FROM diary_comment c, member m"
				+ " WHERE c.idx = m.idx AND c.dno=?"
				+ " ORDER BY c.cno DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dno);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<DiaryCmtDto> cmtList = new ArrayList<DiaryCmtDto>();
		while(rs.next()) {
			int cno = rs.getInt("cno");
			int idx = rs.getInt("idx");
			String nick = rs.getString("nick_name");
			Date date = rs.getDate("cm_date");
			String cmt = rs.getString("diary_comment");
			cmtList.add(new DiaryCmtDto(cno,idx,nick,dno,date,cmt));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return cmtList;
	}
	public void addCmt(int idx ,int dno,String cmt) throws Exception{
		Connection conn = getConnection();
		String sql = "INSERT INTO diary_comment(cno,diary_comment,idx,cm_date,dno)"
				+ " VALUES (SEQ_CNO.nextval,?,?,sysdate,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmt);
		pstmt.setInt(2, idx);
		pstmt.setInt(3, dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void deleteCmt(int cno) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM diary_comment WHERE cno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void updateCmt(String ctt,int cno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE diary_comment SET diary_comment = ? WHERE cno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ctt);
		pstmt.setInt(2, cno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void deleteAllCmt(int dno) throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM diary_comment WHERE dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}












