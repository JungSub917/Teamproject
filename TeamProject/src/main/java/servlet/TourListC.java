package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.TourPackageDao;
import dto.TourListDto;

/**
 * Servlet implementation class TourListC
 */
@WebServlet("/TourListC")
public class TourListC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int natId = Integer.parseInt(request.getParameter("natId"));
		
		try {
	        	ArrayList<TourListDto> tourList = getTourList(natId);
	            String json = new Gson().toJson(tourList);

	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write(json);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	}
	public Connection getConnection() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "stubbypublic";
        String dbPw = "pass1234";

        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, dbId, dbPw);
        return conn;
	};
	public ArrayList<TourListDto> getTourList(int natId) throws Exception {
	    ArrayList<TourListDto> tourList = new ArrayList<TourListDto>();
	    Connection conn = getConnection();
	    TourListDto tourlist = null;
	    TourPackageDao tourDao = new TourPackageDao();
	    String sql = "SELECT * FROM tour_main WHERE nat_Id = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, natId);
	    ResultSet rs = pstmt.executeQuery();
	    String category = "";
	    if (rs.next()) {
	        category = rs.getString("category3");
	    }
	    
	    sql = "SELECT * FROM tour_package WHERE nat_id = ? AND category = ? ORDER BY tour_id";
	    pstmt = conn.prepareStatement(sql); // 수정된 부분
	    pstmt.setInt(1, natId);
	    pstmt.setString(2, category);
	    rs = pstmt.executeQuery();
	    while (rs.next()) {
	        String title = rs.getString("title");
	        String img = rs.getString("img");
	        int tourId = rs.getInt("tour_id");
	        int price = rs.getInt("price");
	        DecimalFormat dc = new DecimalFormat("###,###,###"); 
			String money = dc.format(price);
	        double rating = tourDao.TourRating(tourId);
	        tourlist = new TourListDto(img, money, tourId, rating, title);
	        tourList.add(tourlist);
	    }
	    rs.close();
	    pstmt.close();
	    conn.close();
	    return tourList;
	};

}
