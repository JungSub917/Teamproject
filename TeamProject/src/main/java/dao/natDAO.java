package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.NatDto;

public class natDAO{
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
	public ArrayList<NatDto> natList() throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT nat_id, k_name,e_name,description,currency, volt, visa, timedi, cities FROM nation";
		ArrayList<NatDto> ndto = new ArrayList<NatDto>();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String cities = rs.getString("cities");
			String[] arrCity = cities.split("___");
			int natId = rs.getInt("nat_id");
			String kname = rs.getString("k_name");
			String ename = rs.getString("e_name");
			String des = rs.getString("description");
			String cur = rs.getString("currency");
			String volt = rs.getString("volt");
			String visa = rs.getString("visa");
			String timedi = rs.getString("timedi");
			NatDto dto = new NatDto(natId,kname,ename,des,cur,volt,visa,timedi,arrCity);
			ndto.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return ndto;
	}
	public ArrayList<NatDto> natOrder(int option) throws Exception {
		Connection conn = getConnection();
		ArrayList<NatDto> natList = new ArrayList<NatDto>();
		String sql = "SELECT * FROM nation ORDER BY ";
		switch(option) {
		case 1:
			sql += "nat_id ASC"; // 추천 
			break;
		case 2:
			sql += "k_name ASC"; 	// 올림차순 z - a
			break;
		case 3:
			sql += "k_name DESC";  // 내림차순
			break;
		}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int natId = rs.getInt("nat_id");
				String natKorname = rs.getString("k_name");
				String natEngname = rs.getString("e_name");
				NatDto toto = new NatDto(natId, natKorname, natEngname);
				natList.add(toto);
			}
		rs.close();
		pstmt.close();
		conn.close();
		return natList;
	}
		public ArrayList<NatDto> natSearch(String searchNat) throws Exception {
			Connection conn = getConnection();
			ArrayList<NatDto> searchnat = new ArrayList<NatDto>();
			String sql = "SELECT * FROM nation WHERE k_name LIKE ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchNat+"%");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int natId = rs.getInt("nat_id");
					String natKorname = rs.getString("k_name");
					String natEngname = rs.getString("e_name");
					NatDto toto = new NatDto(natId, natKorname, natEngname);
					searchnat.add(toto);
				}
			rs.close();
			pstmt.close();
			conn.close();
			return searchnat;
		}
		public ArrayList<NatDto> getNatCityDto() throws Exception{
			ArrayList<NatDto> maindto = new ArrayList<NatDto>();
			Connection conn = getConnection();
			String sql = " SELECT c.name, n.k_name, c.city_id, n.nat_id FROM city c, nation n"
								 + " WHERE c.nat_id = n.nat_id ORDER BY c.name";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int natId = rs.getInt("nat_id");
				String natKorname = rs.getString("k_name");
				int cityId = rs.getInt("city_id");
				String cityName = rs.getString("name");
				NatDto dto = new NatDto(natId, natKorname, cityId, cityName);
				maindto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			return maindto;
		}
		public ArrayList<NatDto> getCityRankingDto() throws Exception {
			ArrayList<NatDto> maindto = new ArrayList<NatDto>();
			Connection conn = getConnection();
			String sql = "SELECT t2.*"
					+ " FROM(SELECT rownum, t1.*"
					+ " FROM(SELECT n.k_name, c.name, c.like_cnt, c.img, c.city_id, n.nat_id"
					+ " FROM nation n, city c"
					+ " WHERE n.nat_id = c.nat_id) t1"
					+ " ORDER BY like_cnt DESC) t2"
					+ " WHERE rownum <= 8";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int natId = rs.getInt("nat_id");
				String natKorname = rs.getString("k_name");
				int cityId = rs.getInt("city_id");
				String cityName = rs.getString("name");
				NatDto dto = new NatDto(natId, natKorname, cityId, cityName);
				maindto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
			return maindto;
		}
	}
