package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CityLikeDao {
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
	public int getCityLike(int idx, int cityid) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT * FROM city_like WHERE idx=? AND city_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setInt(2, cityid);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			return 1;
		}
		rs.close();
		pstmt.close();
		conn.close();
		return 0;
	}
public void citylikeBtn(int idx, int cityId) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM city_like WHERE idx = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			
			boolean cityLiked = false;
			
			while(rs.next()) {
				int cityid = rs.getInt("city_id");
				if(cityid == cityId) {
					cityLiked = true;
				}
			}
			
			if(cityLiked) {
				String sql1 = "DELETE FROM city_like WHERE city_id = ? AND idx = ?";
				PreparedStatement pstmt1 = conn.prepareStatement(sql1);
				pstmt1.setInt(1, cityId);
				pstmt1.setInt(2, idx);
				pstmt1.executeUpdate();
				pstmt1.close();
				
				String sql2 = "UPDATE city SET like_cnt = like_cnt - 1 WHERE city_id = ?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, cityId);
				pstmt2.executeUpdate();
				pstmt2.close();
				
			}else {
				String sql3 = "INSERT INTO city_like(city_id, idx) VALUES (?, ?)";
				PreparedStatement pstmt3 = conn.prepareStatement(sql3);
				pstmt3.setInt(1, cityId);
				pstmt3.setInt(2, idx);
				pstmt3.executeUpdate();
				pstmt3.close();
				
				String sql4 = "UPDATE city SET like_cnt = like_cnt + 1 WHERE city_id = ?";
				PreparedStatement pstmt4 = conn.prepareStatement(sql4);
				pstmt4 = conn.prepareStatement(sql4);
				pstmt4.setInt(1, cityId);
				pstmt4.executeUpdate();
				pstmt4.close();
			}
       rs.close();
       pstmt.close();
       conn.close();
   
	}
}
