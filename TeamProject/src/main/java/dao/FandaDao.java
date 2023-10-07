package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.FandaDto;

public class FandaDao {
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
	public ArrayList<FandaDto> getFandaSignUpList(int pageNum) throws Exception {
		ArrayList<FandaDto> singlist = new ArrayList<FandaDto>();
		Connection conn = getConnection();
		String sql = "SELECT b2.*"
					+" FROM(SELECT rownum rnum, b1.*" 
					+" FROM(SELECT * FROM fanda WHERE category = '회원가입' ORDER BY fno DESC)b1)b2"
					+" WHERE b2.rnum >= ? AND b2.rnum <= ?";
		int	endNum = pageNum * 6;
		int	statNum = endNum -5;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,statNum);
		pstmt.setInt(2,endNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int fno = rs.getInt("fno");
			String fa = rs.getString("FA");
			String fq = rs.getString("FQ");
			FandaDto fDto = new FandaDto(fno, fa, fq);
			singlist.add(fDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return singlist;
	};
	public ArrayList<FandaDto> getFandaDiaryList(int pageNum) throws Exception {
		ArrayList<FandaDto> singlist = new ArrayList<FandaDto>();
		Connection conn = getConnection();
		String sql = "SELECT b2.*"
					+" FROM(SELECT rownum rnum, b1.*" 
					+" FROM(SELECT * FROM fanda WHERE category = '여행기 작성' ORDER BY fno DESC)b1)b2"
					+" WHERE b2.rnum >= ? AND b2.rnum <= ?";
		int	endNum = pageNum * 6;
		int	statNum = endNum -5;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,statNum);
		pstmt.setInt(2,endNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int fno = rs.getInt("fno");
			String fa = rs.getString("FA");
			String fq = rs.getString("FQ");
			FandaDto fDto = new FandaDto(fno, fa, fq);
			singlist.add(fDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return singlist;
	};
	public ArrayList<FandaDto> getFandaPlanList(int pageNum) throws Exception {
		ArrayList<FandaDto> singlist = new ArrayList<FandaDto>();
		Connection conn = getConnection();
		String sql = "SELECT b2.*"
					+" FROM(SELECT rownum rnum, b1.*" 
					+" FROM(SELECT * FROM fanda WHERE category = '여행 일정 작성' ORDER BY fno DESC)b1)b2"
					+" WHERE b2.rnum >= ? AND b2.rnum <= ?";
		int	endNum = pageNum * 6;
		int	statNum = endNum -5;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,statNum);
		pstmt.setInt(2,endNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int fno = rs.getInt("fno");
			String fa = rs.getString("FA");
			String fq = rs.getString("FQ");
			FandaDto fDto = new FandaDto(fno, fa, fq);
			singlist.add(fDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return singlist;
	};
	public ArrayList<FandaDto> getFandaExceptList(int pageNum) throws Exception {
		ArrayList<FandaDto> singlist = new ArrayList<FandaDto>();
		Connection conn = getConnection();
		String sql = "SELECT b2.*"
					+" FROM(SELECT rownum rnum, b1.*" 
					+" FROM(SELECT * FROM fanda WHERE category = '기타' ORDER BY fno DESC)b1)b2"
					+" WHERE b2.rnum >= ? AND b2.rnum <= ?";
		int	endNum = pageNum * 6;
		int	statNum = endNum -5;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,statNum);
		pstmt.setInt(2,endNum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int fno = rs.getInt("fno");
			String fa = rs.getString("FA");
			String fq = rs.getString("FQ");
			FandaDto fDto = new FandaDto(fno, fa, fq);
			singlist.add(fDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return singlist;
	};
	
	public FandaDto fandaContentUpdate(int fno) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM fanda WHERE fno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, fno);
		ResultSet rs = pstmt.executeQuery();
		FandaDto fDto = null;
		String fa = "";
		String fq = "";
		if(rs.next()) {
			fa = rs.getString("fa");
			fq = rs.getString("fq");
			fDto = new FandaDto(fno,fa,fq);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return fDto;
	};
	public void fandaContentDelete(int fno) throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE fanda WHERE fno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,fno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public void fandaContentUpdate(String fa, String fq, int fno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE fanda SET fa = ?, fq = ? WHERE fno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, fa);
		pstmt.setString(2, fq);
		pstmt.setInt(3, fno);
		pstmt.executeUpdate();
	};
	
	public void fandaWrite(String category, String fa, String fq) throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO fanda(fno,category, fa, fq)"
					+" VALUES(seq_fno.nextVal, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, category);
		pstmt.setString(2, fa);
		pstmt.setString(3, fq);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public String fandacategory(int fno) throws Exception {
		String category = "";
		Connection conn = getConnection();
		String sql = "SELECT category FROM fanda WHERE fno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, fno);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			category = rs.getString("category");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return category;
	}
}










