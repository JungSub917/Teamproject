package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.DiaryDto;

public class DiaryDao {
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
	public ArrayList<DiaryDto> getDiaryRanking() throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT *"
				+ " FROM (SELECT *"
				+ " FROM diary"
				+ " ORDER BY view_cnt)"
				+ " WHERE ROWNUM <= 6";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<DiaryDto> diaryList = new ArrayList<DiaryDto>();
		while(rs.next()) {
			int dno = rs.getInt("dno");
			String title = rs.getString("title");
			String img = rs.getString("main_img");
			DiaryDto ddto = new DiaryDto(dno,title,img);
			diaryList.add(ddto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return diaryList;
	}
	public ArrayList<DiaryDto> getDiaryListDto() throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT d.diary_date,d.main_img,d.title,d.dno,d.idx,m.nick_name,d.view_cnt,(SELECT COUNT(*) FROM diary_like WHERE dno=d.dno) AS \"like\",(SELECT COUNT(*) FROM diary_comment WHERE dno=d.dno) AS \"cnt\""
				+" FROM diary d, member m"
				+" WHERE d.idx=m.idx"
				+" ORDER BY d.dno DESC" ;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs  = pstmt.executeQuery();
		
		ArrayList<DiaryDto> diaryList = new ArrayList<DiaryDto>();
		while(rs.next()) {
			DiaryDto ddto = new DiaryDto();
//			int dno = rs.getInt("dno");
			ddto.setDno(rs.getInt("dno"));
			ddto.setTitle(rs.getString("title"));
			ddto.setDiaryDate(rs.getDate("diary_date"));
			ddto.setNickName(rs.getString("nick_name"));
			ddto.setLikeCnt(rs.getInt("like"));
			ddto.setMainImg(rs.getString("main_img"));
			ddto.setCmtCnt(rs.getInt("cnt"));
			ddto.setViewCnt(rs.getInt("view_cnt"));
			diaryList.add(ddto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return diaryList;
	}
	public DiaryDto getDiaryDetail(int dno) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT d.*,m.*,(SELECT COUNT(*) FROM diary_comment WHERE dno=?) AS \"cmt_cnt\" ,(SELECT COUNT(*) FROM diary_like WHERE dno=d.dno) AS \"like\""
				+" FROM diary d, member m"
				+" WHERE d.idx=m.idx AND d.dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dno);
		pstmt.setInt(2, dno);
		ResultSet rs  = pstmt.executeQuery();
		DiaryDto diary=null;
		if(rs.next()) {
			String title=rs.getString("title");
			String nick=rs.getString("nick_name");
			Date date=rs.getDate("diary_date");
			String content = rs.getString("content");
			int idx=rs.getInt("idx");
			int cmtcnt=rs.getInt("cmt_cnt");
			int like=rs.getInt("like");
			int view=rs.getInt("view_cnt");
			diary=new DiaryDto(dno,idx,nick,title,content,date,cmtcnt,like,view);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return diary;
	}
	public void updateViewCnt(int dno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE diary SET view_cnt=view_cnt+1 WHERE dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public int getLikecnt(int dno) throws Exception {
		int like;
		Connection conn = getConnection();
		String sql = "SELECT COUNT(*) AS \"like\""
				+ " FROM diary_like"
				+ " WHERE dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dno);
		ResultSet rs  = pstmt.executeQuery();
		if(rs.next()){}
		like = rs.getInt("like");
		rs.close();
		pstmt.close();
		conn.close();
		
		return like;
	}
	public void deleteDiaryAction(int dno) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE FROM diary WHERE dno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,dno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void addDiaryDao(String title, String ctt, int idx, String img) throws Exception{
		Connection conn = getConnection();
		String sql = "INSERT INTO diary(dno,title,content,idx,main_img) VALUES(SEQ_DNO.nextval,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, ctt);
		pstmt.setInt(3, idx);
		pstmt.setString(4, img);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
 






