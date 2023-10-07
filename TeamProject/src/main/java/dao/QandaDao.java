package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.QandaDto;
public class QandaDao {
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
	public ArrayList<QandaDto> getQandaList(int idx, int pageNum) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "";
		if(idx==1) {
		sql = "SELECT q2.*"
					+" FROM(SELECT rownum rnum, q1.*" 
					+" FROM(SELECT * FROM qanda ORDER BY qno DESC)q1)q2"
					+" WHERE q2.rnum >= ? AND q2.rnum <= ?";
		pstmt = conn.prepareStatement(sql);
		int endNum = pageNum * 6;
		int statNum = endNum - 5;
		pstmt.setInt(1, statNum);
		pstmt.setInt(2, endNum);
		
		}else {
		sql = "SELECT q2.*"
					+" FROM(SELECT rownum rnum, q1.*" 
					+" FROM(SELECT * FROM qanda WHERE idx = ? ORDER BY qno DESC)q1)q2"
					+" WHERE q2.rnum >= ? AND q2.rnum <= ?";
		pstmt = conn.prepareStatement(sql);
		int endNum = pageNum * 6;
		int statNum = endNum - 5;
		pstmt.setInt(1, idx);
		pstmt.setInt(2, statNum);
		pstmt.setInt(3, endNum);
		}
		ResultSet rs = pstmt.executeQuery();
		ArrayList<QandaDto> qandaList = new ArrayList<QandaDto>();
		while(rs.next()) {
			int member = rs.getInt("idx");
			int qno = rs.getInt("qno");
			String category = rs.getString("category");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String status = rs.getString("status");
			String qdate = rs.getString("q_date");
			QandaDto qdto = new QandaDto(member,qno,category,title,content,status, qdate);
			qandaList.add(qdto);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return qandaList;
	};
	public QandaDto getQandaDetail(int qno) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM qanda WHERE qno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,qno);
		ResultSet rs = pstmt.executeQuery();
		QandaDto qdto = null;
		
		if(rs.next()){;
		int idx = rs.getInt("idx");
		int getqno = rs.getInt("qno");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String category = rs.getString("category");
		String qDate = rs.getString("q_date");
		String aDate = rs.getString("a_date");
		String status = rs.getString("status");
		String aContent = rs.getString("a_comment");
		qdto = new QandaDto(idx,getqno,title,category,content,qDate,aDate,status,aContent);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return qdto;
	};
	public void QandaInsert(int idx, String category, String title, String content) throws Exception {
		Connection conn = getConnection();
		String sql = "INSERT INTO Qanda(qno, idx, category, title, content, q_date, status)"
					+" VALUES(seq_qno.nextval, ?, ?, ? ,? , sysdate, '답변대기')";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setString(2,category);
		pstmt.setString(3,title);
		pstmt.setString(4,content);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public void qandaCommentInput(int qno, String comment) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE qanda SET"
					+" a_comment = ?, a_date = sysdate, status = '답변완료'"
					+" WHERE qno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, comment);
		pstmt.setInt(2, qno);
		pstmt.executeQuery();
		
		pstmt.close();
		conn.close();
	};
	public void qandaDeleteComment(int qno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE qanda SET a_comment = null, status = '답변대기', a_date = null"
					+" WHERE qno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qno);
		pstmt.executeQuery();
		
		pstmt.close();
		conn.close();
	};
	public void  qandaDeleteContent(int qno) throws Exception {
		Connection conn = getConnection();
		String sql = "DELETE qanda WHERE qno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qno);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public void qandaCommentDelete(int qno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE qanda SET a_comment = null, a_date = null, status = '답변대기'"
					+" WHERE qno = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qno);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public void qandaCommentUpdate(int qno, String comment) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE qanda SET a_comment = ?, a_date = sysdate"
					+" WHERE qno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, comment);
		pstmt.setInt(2, qno);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	};
	public int memberCheck(int idx) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT *  FROM member WHERE idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		int checkMember = 0;
		if(rs.next()) {
			checkMember = rs.getInt("idx");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return checkMember;
	}
	public void qandaContentUpdate(String title, String content, String category, int qno) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE qanda SET title = ? , content = ? , q_date = sysdate, category = ? "
					+" WHERE qno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		pstmt.setString(3,category);
		pstmt.setInt(4, qno);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
};





















