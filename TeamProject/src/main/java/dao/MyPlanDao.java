package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MyPlanDto;

public class MyPlanDao {
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
	public ArrayList<MyPlanDto> getMyPlanList(int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT * FROM my_plan WHERE idx=? ORDER BY pnum DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MyPlanDto> planList = new ArrayList<MyPlanDto>();
		while(rs.next()) {
			int pnum = rs.getInt("pnum");
			int pcnt = rs.getInt("p_cnt");
			Date pdate = rs.getDate("p_date");
			Date pstart = rs.getDate("p_start");
			Date pend = rs.getDate("p_end");
			String name = rs.getString("name");
			MyPlanDto pdto = new MyPlanDto(pnum, pcnt, idx, pdate, pstart, pend, name);
			planList.add(pdto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return planList;
	}
	public void setMyPlanName(String name, int pnum) throws Exception {
		Connection conn = getConnection();
		String sql = "UPDATE my_plan SET name=? WHERE pnum=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, pnum);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void deleteMyPlan(int pnum) throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM my_plan WHERE pnum=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pnum);
		pstmt.executeUpdate();
		sql = "DELETE FROM plan_trip WHERE pno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pnum);
		
		pstmt.close();
		conn.close();
	}
}







