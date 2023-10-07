package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import dto.TourDto;


public class TourDao {
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
	public ArrayList<TourDto> getLikeTourPackage(int idx) throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT t.*"
				+ " FROM tour_package t, tour_like l"
				+ " WHERE t.tour_id = l.tour_id AND l.idx = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<TourDto> tourList = new ArrayList<TourDto>(); 
		while(rs.next()) {
			String title = rs.getString("title");
			int price = rs.getInt("price");
			String hash = rs.getString("hash");
			int tourid = rs.getInt("tour_id");
			double rating = rs.getDouble("user_rating");
			String img = rs.getString("img");
			DecimalFormat dc = new DecimalFormat("###,###,###");
			String money = dc.format(price);
			TourDto pdto = new TourDto(title,money,hash,tourid,rating,img);
			tourList.add(pdto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return tourList;
	}
	public void deleteTourLikeDao(int idx, int cityid) throws Exception{
		Connection conn = getConnection();
		String sql = "DELETE FROM tour_like WHERE idx=? AND tour_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.setInt(2, cityid);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public ArrayList<TourDto> getTourReservation(int idx)throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT tp.tour_id, tp.img, tp.title, tp.hash, tp.price, p.pay_date"
				+ " FROM tour_package tp, tour_pay p"
				+ " WHERE tp.tour_id = p.tour_id AND p.idx = ? AND p.pay_check='결제완료'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<TourDto> tpList = new ArrayList<TourDto>();
		while(rs.next()) {
			int tourid = rs.getInt("tour_id");
			String img = rs.getString("img");
			String title = rs.getString("title");
			String hash = rs.getString("hash");
			int price = rs.getInt("price");
			Date paydate = rs.getDate("pay_date");
			DecimalFormat dc = new DecimalFormat("###,###,###");
			String money = dc.format(price);
			TourDto pdto = new TourDto(title,money,hash,tourid,img,paydate);
			tpList.add(pdto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return tpList;
	}
	public ArrayList<TourDto> getTourCancel(int idx)throws Exception{
		Connection conn = getConnection();
		String sql = "SELECT tp.tour_id, tp.img, tp.title, tp.hash, tp.price, p.pay_date"
				+ " FROM tour_package tp, tour_pay p"
				+ " WHERE tp.tour_id = p.tour_id AND p.idx = ? AND p.pay_check='결제취소'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<TourDto> tpList = new ArrayList<TourDto>();
		while(rs.next()) {
			int tourid = rs.getInt("tour_id");
			String img = rs.getString("img");
			String title = rs.getString("title");
			String hash = rs.getString("hash");
			int price = rs.getInt("price");
			Date paydate = rs.getDate("pay_date");
			DecimalFormat dc = new DecimalFormat("###,###,###");
			String money = dc.format(price);
			TourDto pdto = new TourDto(title,money,hash,tourid,img,paydate);
			tpList.add(pdto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return tpList;
	}

}


























