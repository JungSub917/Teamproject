package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.NoticeDto;

public class NoticeDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		
		return conn;
	};
	public NoticeDto getNoticeDto(int nno) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM notice WHERE nno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nno);
		ResultSet rs = pstmt.executeQuery();
		
		NoticeDto dto = null;
		if(rs.next()) {
			String title = rs.getString("title");
			String content = rs.getString("content");
			String date = rs.getString("notice_date");
			dto = new NoticeDto(nno, title, content, date);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	};
	public void noticeWrite(String title, String content) throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO notice(nno,title, content) VALUES(seq_nno.nextVal,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void noticeUpdate(String title, String content, int nno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE notice SET title = ?, content = ? WHERE nno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, nno);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public void qandaDelete(int nno) throws Exception {
		Connection conn = getConnection();
		String sql ="DELETE notice WHERE nno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,nno);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public ArrayList<NoticeDto> getNoiceList(int pageNum) throws Exception {
		ArrayList<NoticeDto> noticelist = new ArrayList<NoticeDto>();
		Connection conn = getConnection();
		
		String sql = "SELECT b2.*" +" FROM(SELECT rownum rnum, b1.*"
					+" FROM(SELECT * FROM notice ORDER BY nno DESC)b1)b2"
					+" WHERE b2.rnum >= ? AND b2.rnum <= ?"; 
		int endNum = pageNum * 6; 
		int statNum = endNum - 5;
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,statNum); 
		pstmt.setInt(2,endNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int nno = rs.getInt("nno");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String date = rs.getString("notice_date");
			NoticeDto dto = new NoticeDto(nno, title, content, date);
			noticelist.add(dto);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return noticelist;
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}