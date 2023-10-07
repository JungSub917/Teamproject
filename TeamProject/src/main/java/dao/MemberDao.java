package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberDto;


public class MemberDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		return conn;
	}
	public MemberDto getMemberDao(int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT * FROM member WHERE idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		MemberDto mdto = null;
		if(rs.next()) {
			String name=rs.getString("name");
			String email=rs.getString("email");
			String nick=rs.getString("nick_name");
			String pw=rs.getString("pw");
			mdto = new MemberDto(idx,name,email,nick,pw);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return mdto;
	}
	public void deleteMemberDao(int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM member WHERE idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
