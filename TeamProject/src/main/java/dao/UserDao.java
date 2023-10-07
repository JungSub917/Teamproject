package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.UserDto;


public class UserDao {
	private static UserDao instance = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return instance;
	}
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
	public void changePw(String email, String idcode, String pass)throws Exception {
		Connection conn = getConnection();
		
		String sql = "UPDATE member set pw = ? WHERE email = ? and idcode = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pass);
		pstmt.setString(2, email);
		pstmt.setString(3, idcode);
		pstmt.executeUpdate();
	}
	public UserDto NaverUserDto(String email)throws Exception{

		UserDto dto = new UserDto();
		String sql  = "SELECT * FROM member WHERE email = ? ";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
	
		ResultSet	rs = pstmt.executeQuery();
			 
		if(rs.next()) {
			dto.setEmail(rs.getString("email")); 
			dto.setNickname(rs.getString("nick_name"));
			dto.setIdx(rs.getInt("idx"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	}
	public int naverSignInUp(String name, String email, String nickname, String token)throws Exception{
		
	    String sql = "SELECT email, token FROM member WHERE email = ?";
	    Connection conn = getConnection();
	   
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, email);
	    ResultSet rs = pstmt.executeQuery();
	      if (rs.next()) {
	      	String naverEmail = rs.getString("email");
	        String naverToken = rs.getString("token");

	        if (naverEmail.equals(email)) {
	        	// 이미 동일한 이메일을 가진 회원이 존재하는 경우
	          if (naverToken.equals(token)) {
	          	// 이미 동일한 토큰을 가진 회원인 경우
	            return 1; // 로그인 성공
	          } else {
	          	// 동일한 이메일을 가진 회원이 있지만 토큰이 일치하지 않는 경우
	          	sql = "UPDATE member SET token = ? WHERE email = ?";
	          	pstmt = conn.prepareStatement(sql);
	          	pstmt.setString(1, token);
	     	      pstmt.setString(2, email);
	     	      pstmt.executeUpdate();
	            return 1; // 토큰 불일치
	          }
	        }
	      }else if(!rs.next()) {
		      // 동일한 이메일을 가진 회원이 없는 경우, 회원 가입 처리
		      sql = "INSERT INTO member(idx, name, email, nick_name, token) VALUES(seq_idx.nextval, ?, ?, ?, ?)";
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, name);
		      pstmt.setString(2, email);
		      pstmt.setString(3, nickname);
		      pstmt.setString(4, token);
		      pstmt.executeUpdate();
		      return 2; // 회원 가입 및 로그인 성공
	      }
	    
	    pstmt.close();
	    rs.close();
	    conn.close();
	    return -2; // 데이터베이스 오류
		}
	public void SignUpUser(String name, String email, String nickname, String pw) throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO member(idx, name, email, nick_name, pw)"
					+ " VALUES(seq_idx.nextVal,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, nickname);
		pstmt.setString(4, pw);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public int RepetitionCheckId(String email) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM member WHERE email=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			return 1;
		} 
		rs.close();
		pstmt.close();
		conn.close();
		return 0;
	}
	public void changeUserDto(String name, String nickname, String pass, int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "UPDATE member SET name=?, nick_name=?, pw=? WHERE idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, nickname);
		pstmt.setString(3, pass);
		pstmt.setInt(4, idx);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void changeUserDto(String name, String nickname, int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "UPDATE member SET name=?, nick_name=?, pw=? WHERE idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, nickname);
		pstmt.setInt(3, idx);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public UserDto getCheckUserDto(String email, String pw) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT * FROM member WHERE email=? AND pw=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String nickname = rs.getString("nick_name");
			return new UserDto(idx,name,email,nickname,pw);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return null;
	}
	public String getUserPw(int idx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT pw FROM member WHERE idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String pw = rs.getString("pw");
			return pw;
		}
		rs.close();
		pstmt.close();
		conn.close();
		return "";
	}
	public UserDto getUserinfo(int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT * FROM member WHERE idx=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		UserDto udto = null;
		if(rs.next()) {
			String name=rs.getString("name");
			String email=rs.getString("email");
			String nick=rs.getString("nick_name");
			String pw=rs.getString("pw");
			udto = new UserDto(idx,name,email,nick,pw);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return udto;
	}
}
