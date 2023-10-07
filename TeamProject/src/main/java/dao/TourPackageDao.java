package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dto.TourPackageDto;

public class TourPackageDao {
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
	public int getNatId(int natId) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM tour_main WHERE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		ResultSet rs = pstmt.executeQuery();
		TourPackageDto tourDto = null;
		if(rs.next()) {
		int id = rs.getInt("nat_id");
		tourDto = new TourPackageDto(id);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return natId;
	}
	public ArrayList<TourPackageDto> getNationList() throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM nation n, tour_main t"
					+" WHERE n.nat_id = t.nat_id"
					+" ORDER BY t.nat_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<TourPackageDto> natList = new ArrayList<TourPackageDto>();
		while(rs.next()) {
			String natName = rs.getString("K_name");
			String natIcon = rs.getString("icon");
			int natId = rs.getInt("nat_id");
			TourPackageDto tourDto = new TourPackageDto(natName, natIcon, natId);
			natList.add(tourDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return natList;
	};
	
	public TourPackageDto getNation(int natId) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT t.background, t.flag, t.category1, t.category2, t.category3, n.k_name"
					+" FROM tour_main t, nation n"
					+" WHERE t.nat_id = n.nat_id AND t.nat_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		ResultSet rs = pstmt.executeQuery();
		
		TourPackageDto tourDto = null;
		
		if(rs.next()) {
			String backgroundImg = rs.getString("background");
			String natName = rs.getString("k_name");
			String flag = rs.getString("flag");
			String category1 = rs.getString("category1");
			String category2 = rs.getString("category2");
			String category3 = rs.getString("category3");
			tourDto = new TourPackageDto(backgroundImg,natName, flag, category1, category2, category3);
		}
		return tourDto;
	};
	
	public ArrayList<TourPackageDto> getTourItemListA(int natId, String category) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT tour_id, hash, price, title, img"
					+" FROM tour_package"
					+" WHERE nat_id = ? AND category = ?"
					+" ORDER BY tour_id";
		ArrayList<TourPackageDto> tourItemList = new ArrayList<TourPackageDto>();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		pstmt.setString(2, category);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int tourId = rs.getInt("tour_id");
            String hash = rs.getString("hash");
            String firstHash = "";
            if (hash != null && !hash.isEmpty()) {
                Pattern pattern = Pattern.compile("＃([^＃]+)＃");
                Matcher matcher = pattern.matcher(hash);
                if (matcher.find()) {
                    firstHash = matcher.group(1);
                }
            }
            if (firstHash.isEmpty()) {
                String title = rs.getString("title");
                firstHash = title;
            }
            int price = rs.getInt("price");
            DecimalFormat dc = new DecimalFormat("###,###,###"); 
			String money = dc.format(price);
            String img = rs.getString("img");
            TourPackageDto tourDto = new TourPackageDto(tourId,firstHash,img,money);
           
            tourItemList.add(tourDto);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return tourItemList;
	};
	public ArrayList<TourPackageDto> getTourItemListB(int natId, String category) throws Exception {
		Connection conn = getConnection();
		ArrayList<TourPackageDto> tourItemList = new ArrayList<TourPackageDto>();
		String sql = "SELECT tour_id, user_rating, price, title, img"
					+" FROM tour_package"
					+" WHERE nat_id = ? AND category = ?"
					+" ORDER BY tour_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		pstmt.setString(2,category);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int tourId = rs.getInt("tour_id");
			double userRating = TourRating(tourId);
			int price = rs.getInt("price");
			DecimalFormat dc = new DecimalFormat("###,###,###"); 
			String money = dc.format(price);
			String title = rs.getString("title");
			String img = rs.getString("img");
			TourPackageDto tourDto = new TourPackageDto(tourId,userRating,money,title,img);
			tourItemList.add(tourDto);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return tourItemList;
		
	}
	public ArrayList<TourPackageDto> gettourItem(int natId) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM tour_package WHERE nat_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,natId);
		ArrayList<TourPackageDto> tourItemlist = new ArrayList<TourPackageDto>();
		TourPackageDto tourDto = null;
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int tourId = rs.getInt("tour_id");
			int price = rs.getInt("price");
			String title = rs.getString("title");
			String img = rs.getString("img");
			String hash = rs.getString("hash");
	            String firstHash = "";
	            if (hash != null && !hash.isEmpty()) {
	                Pattern pattern = Pattern.compile("＃([^＃]+)＃");
	                Matcher matcher = pattern.matcher(hash);
	                if (matcher.find()) {
	                    firstHash = matcher.group(1);
	                }
	            }
	            if (firstHash.isEmpty()) {
	                String subHash = rs.getString("title");
	                firstHash = subHash;
	            }
	            tourDto = new TourPackageDto(tourId,price,title,img,firstHash);
	            tourItemlist.add(tourDto);
		}
		return tourItemlist;
	}
	 public TourPackageDto getTourItemDetail(int tourId) throws Exception{
		 TourPackageDto tDto =null;
		 Connection conn = getConnection();
		 String sql = "SELECT NVL(ROUND(AVG(RATING),1),0) AS rating FROM TOUR_REVIEW WHERE tour_id = ?";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1,tourId);
		 ResultSet rs = pstmt.executeQuery();
		 double userRating = 0;
		 if(rs.next()) {
			 userRating = rs.getDouble("RATING");
		 }
		 sql ="SELECT *"
				    +" FROM tour_package t, nation n "
					+" WHERE t.nat_id = n.nat_id AND tour_id = ? " ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,tourId);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String img = rs.getString("img");
			String title = rs.getString("title");
			String natName = rs.getString("k_name");
			String hash = rs.getString("hash");
			String description = rs.getString("description");
			String descriptionImg = rs.getString("description_img");
			String tourTime = rs.getString("tour_time");
			String tourPoint = rs.getString("tour_point");
			String caution1 = rs.getString("caution1");
			String caution2 = rs.getString("caution2");
			String caution3 = rs.getString("caution3");
			String caution4 = rs.getString("caution4");
			int price = rs.getInt("price");
			int getTourId = rs.getInt("tour_id");
			int natId = rs.getInt("nat_Id");
			double tourLat = rs.getDouble("tour_lat");
			double tourLon = rs.getDouble("tour_lon");
			DecimalFormat dc = new DecimalFormat("###,###,###"); 
			String money = dc.format(price);
			tDto = new TourPackageDto(natName,img,price,userRating, getTourId, natId, title, hash, descriptionImg, description, tourPoint, tourTime,caution1 ,caution2,caution3, caution4, tourLat, tourLon, money);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return tDto;
	 }
	 public ArrayList<TourPackageDto> getToureview(int tourId) throws Exception {
		 ArrayList<TourPackageDto> reviewList = new ArrayList<TourPackageDto>();
		 Connection conn = getConnection();
		 String sql = "SELECT * FROM tour_review t, member m WHERE t.idx = m.idx AND tour_id = ? ORDER BY tno DESC";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, tourId);
		 ResultSet rs = pstmt.executeQuery();
		 while(rs.next()) {
			int tno = rs.getInt("tno");
			String title = rs.getString("review_title");
			String content = rs.getString("review_content");
			String trDate = rs.getString("tr_date");
			double rating = rs.getDouble("rating");
			String nickName = rs.getString("nick_name");
			int idx = rs.getInt("idx");
			TourPackageDto tDto = new TourPackageDto(tno,title,content,trDate,rating, nickName, idx);
			reviewList.add(tDto);
		 }
		 rs.close();
		 pstmt.close();
		 conn.close();
		 return reviewList;
	 };
	 public double TourRating(int tourId) throws Exception{
		 Connection conn = getConnection();
		 String sql = "SELECT NVL(ROUND(AVG(RATING),1),0) AS rating FROM TOUR_REVIEW WHERE tour_id = ?";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1,tourId);
		 double tourRating = 0;
		 ResultSet rs = pstmt.executeQuery();
		 if(rs.next()) {
			 tourRating = rs.getDouble("RATING");
		 }
		 rs.close();
		 pstmt.close();
		 conn.close();
		 return tourRating;
	 };
	 
	 public TourPackageDto getReviewTotal(int tourId) throws Exception {
		 Connection conn = getConnection();
		 String sql = "SELECT count(*) FROM tour_review WHERE tour_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,tourId);
			ResultSet rs = pstmt.executeQuery();
			TourPackageDto tDto = null;
			if(rs.next()){
				int reviewCount = rs.getInt("count(*)");
				tDto = new TourPackageDto(reviewCount);
			}
			rs.close();
			pstmt.close();
			conn.close();
			return tDto;
	 }
	 
	 public void deleteReview(int tno) throws Exception {
		 Connection conn = getConnection();
		 String sql = "DELET FROM tour_review WHERE tno = ?";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, tno);
		 pstmt.executeUpdate();
		 pstmt.close();
		 conn.close();
	 }
	 
	 public void naverPay(int idx, int tourId, int price, java.util.Date tourDate) throws Exception {
		  Connection conn = getConnection();
		  String sql = "INSERT INTO tour_pay(idx, tour_id, pay_check, pay_date, price, method, tour_date) VALUES (?, ?, 1, sysdate, ?, '네이버', ?)";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, idx);
		  pstmt.setInt(2, tourId);
		  pstmt.setInt(3, price);
		  
		  // java.util.Date를 java.sql.Date로 변환
		  java.sql.Date sqlTourDate = new java.sql.Date(tourDate.getTime());
		  pstmt.setDate(4, sqlTourDate);
		  
		  pstmt.executeUpdate();
		  
		  pstmt.close();
		  conn.close();
		}
	 public void kakaoPay(int idx, int tourId, int price, java.util.Date tourDate) throws Exception {
		  Connection conn = getConnection();
		  String sql = "INSERT INTO tour_pay(idx, tour_id, pay_check, pay_date, price, method, tour_date) VALUES (?, ?, 1, sysdate, ?, '카카오', ?)";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, idx);
		  pstmt.setInt(2, tourId);
		  pstmt.setInt(3, price);
		  
		  // java.util.Date를 java.sql.Date로 변환
		  java.sql.Date sqlTourDate = new java.sql.Date(tourDate.getTime());
		  pstmt.setDate(4, sqlTourDate);
		  
		  pstmt.executeUpdate();
		  
		  pstmt.close();
		  conn.close();
	 }
	 public void tossPay(int idx, int tourId, int price, java.util.Date tourDate) throws Exception{
		 Connection conn = getConnection();
		  String sql = "INSERT INTO tour_pay(idx, tour_id, pay_check, pay_date, price, method, tour_date) VALUES (?, ?, 1, sysdate, ?, '토스', ?)";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, idx);
		  pstmt.setInt(2, tourId);
		  pstmt.setInt(3, price);
		  
		  // java.util.Date를 java.sql.Date로 변환
		  java.sql.Date sqlTourDate = new java.sql.Date(tourDate.getTime());
		  pstmt.setDate(4, sqlTourDate);
		  
		  pstmt.executeUpdate();
		  
		  pstmt.close();
		  conn.close();
	 }
	 public ArrayList<TourPackageDto> getTourList(int tourId) throws Exception {
		  Connection conn = getConnection();
		  String sql = "SELECT nat_id FROM tour_package WHERE tour_id = ?";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, tourId);
		  int natId = 0;
		  ResultSet rs = pstmt.executeQuery();
		  if(rs.next()) {
			  natId = rs.getInt("nat_id");
		  };
		  sql = "SELECT tour_id, user_rating, price, title, img"
					  +" FROM tour_package"
					  +" WHERE nat_id = ?"
					  +" ORDER BY tour_id";
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, natId);
		  rs = pstmt.executeQuery();
		  
		  ArrayList<TourPackageDto> tourList = new ArrayList<TourPackageDto>();
		  while(rs.next()) {
			  int getTourId = rs.getInt("tour_id");
			  int price = rs.getInt("price");
			  DecimalFormat dc = new DecimalFormat("###,###,###"); 
			  String money = dc.format(price);
			  String title = rs.getString("title");
			  String img = rs.getString("img");
			  double rating = TourRating(getTourId);
			  TourPackageDto tDto = new TourPackageDto(getTourId,money,title,img,rating);
			  tourList.add(tDto);
		  };
		  rs.close();
		  pstmt.close();
		  conn.close();
		  return tourList;
	 };
	 public TourPackageDto reviewDetail(int idx, int tno) throws Exception {
		 Connection conn = getConnection();
		 String sql ="SELECT * FROM tour_review WHERE"
		 			+" tno = ? AND idx = ?";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 TourPackageDto tourDto = null;
		 pstmt.setInt(1,tno);
		 pstmt.setInt(2,idx);
		 ResultSet rs = pstmt.executeQuery();
		 if(rs.next()) {
			 int getidx = rs.getInt("idx");
			 int gettno = rs.getInt("tno");
			 String title = rs.getString("review_title");
			 String content = rs.getString("review_content");
			 double rating = rs.getDouble("rating");
			 tourDto = new TourPackageDto(title,content,rating);
		 }
		 return tourDto;
	 }
	 public void reviewUpdate(int idx, int tno, double rating, String title, String content) throws Exception {
		 Connection conn = getConnection(); 
	        String sql = "UPDATE tour_review SET review_title = ?, review_content = ?,"
	        			+" rating = ? WHERE idx = ? AND tno = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, title);
	        pstmt.setString(2, content);
	        pstmt.setDouble(3, rating);
	        pstmt.setInt(4, idx);
	        pstmt.setInt(5, tno);
	        pstmt.executeUpdate();
	        
	        pstmt.close();
	        conn.close();
	 };
	 public void tourLike(int idx, int tourId) throws Exception{
		 Connection conn = getConnection();
		 String sql = "INSERT INTO tour_like(idx, tour_id) VALUES(?, ?)";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, idx);
		 pstmt.setInt(2, tourId);
		 pstmt.executeUpdate();
		 
		 pstmt.close();
		 conn.close();
	 }
	 public int getTourLike(int idx, int tourId) throws Exception{
		 Connection conn = getConnection();
		 String sql ="SELECT * FROM tour_like WHERE tour_id = ? AND idx = ?";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, idx);
		 pstmt.setInt(2, tourId);
		 int tourLikeCheck = -1;
		 ResultSet rs = pstmt.executeQuery();
		 if(rs.next()) {
			 tourLikeCheck = 1;
		 }
		 rs.close();
		 pstmt.close();
		 conn.close();
		 return tourLikeCheck;
	 }
	 public void deleteTourLike(int idx, int tourId) throws Exception {
		 Connection conn = getConnection();
		 String sql = "DELETE FROM TOUR_LIKE WHERE tour_id = ? AND idx = ?";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, tourId);
		 pstmt.setInt(2, idx);
		 pstmt.executeUpdate();
		 pstmt.close();
		 conn.close();
	 }
}
