package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.HrDto;

public class HrDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		
		Class.forName(driver);  
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
							
		return conn;
	}

	public ArrayList<HrDto> getHotelReviewList(int pageNum)throws Exception{
		int endRnum = pageNum * 5;
		int startRnum = endRnum - 4;
		ArrayList<HrDto> listHotelRe = new ArrayList<HrDto>();
		
		Connection conn = getConnection();
		String sql = " SELECT *" 
							 + " FROM (SELECT rownum rnum, t1.*"  
							 + " FROM (SELECT hr.* , h.name, h.img, m.nick_name FROM hotel_review hr, hotel h, member m WHERE hr.hotel_id = h.hotel_id AND hr.idx = m.idx ORDER BY hno DESC) t1) t2" 
							 + " WHERE t2.rnum>=? AND t2.rnum<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRnum);
		pstmt.setInt(2, endRnum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int hno = rs.getInt("hno");
			String hrDate = rs.getString("hr_date");
			String name = rs.getString("name");
			String title = rs.getString("title");
			String nickName = rs.getString("nick_name");
			String hotelImg = rs.getString("img");
			HrDto dto = new HrDto(hno, hrDate, name, title, nickName, hotelImg);
			listHotelRe.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return listHotelRe;
	}
	
	public HrDto getHotelReviewDetailList(int hno)throws Exception{
		
		HrDto HrDto = new HrDto();
		Connection conn = getConnection();
		String sql = " SELECT hr.*,h.name, m.nick_name"  
							 + " FROM hotel_review hr, hotel h, member m"  
							 + " WHERE hr.hotel_id = h.hotel_id AND hr.idx = m.idx AND hno = ?";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hno);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			HrDto.setHno(rs.getInt("hno"));
			HrDto.setHotelName(rs.getString("name"));
			HrDto.setTitle(rs.getString("title"));
			HrDto.setNickName(rs.getString("nick_name"));
			HrDto.setHrDate(rs.getString("hr_date"));
			HrDto.setReview(rs.getString("review"));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		return HrDto;
		
	}
	
	public void HrWrite(String title, int hotelId, int idx, String review)throws Exception {
		Connection conn = getConnection();
		String sql = " INSERT INTO hotel_review(hno, title, review, idx, hr_date, hotel_id)"
							 + " VALUES(seq_hno.nextval, ?, ?, ?, sysdate, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, review);
		pstmt.setInt(3, idx);
		pstmt.setInt(4, hotelId);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public void HrDelete(int hno)throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM hotel_review WHERE hno = ? ";
			
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
				
	}

	public void HrReform(String title, String review, int hno)throws Exception{
		Connection conn = getConnection();
		String sql = "UPDATE hotel_review SET title=?, review=? WHERE hno = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, review);
		pstmt.setInt(3, hno);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public int HrCountComment(int hno)throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT count(*) AS \"cnt\" FROM hr_comment WHERE hno = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hno);
		ResultSet rs = pstmt.executeQuery();
		int commentCnt = 0;
		if(rs.next()) {
			commentCnt = rs.getInt("cnt");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return commentCnt;
	}
	public ArrayList<HrDto> HrCommentList(int hno)throws Exception{
		ArrayList<HrDto> hrcommentdto = new ArrayList<HrDto>();
		Connection conn = getConnection();
		String sql = "SELECT hrc.*, m.nick_name FROM hr_comment hrc, member m WHERE hrc.idx = m.idx AND hno = ? ORDER BY hrno DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hno);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int hrno = rs.getInt("hrno");
			String nickName = rs.getString("nick_name");
			String hrComment = rs.getString("hr_comment");
			String hrcDate = rs.getString("hrc_date");
			HrDto dto = new HrDto(hrno, nickName, hrComment, hrcDate);		
			hrcommentdto.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return hrcommentdto;
	}
	public void HrCommentWrite(String hrComment, int idx, int hno)throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO hr_comment(hrno, hr_comment, idx, hno) VALUES(seq_hrno.nextval, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hrComment);
		pstmt.setInt(2, idx);
		pstmt.setInt(3, hno);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	public void HrCommentDelete(int hrno)throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM hr_comment WHERE hrno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hrno);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	public void HrCommentUpdate(int hrno, String comment)throws Exception{
		Connection conn = getConnection();
		String sql = "UPDATE hr_comment SET hr_comment = ? WHERE hrno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, comment);
		pstmt.setInt(2, hrno);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
}