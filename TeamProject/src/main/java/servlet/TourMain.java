package servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.TourMainDto;

@WebServlet("/TourMain")
public class TourMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int natId = Integer.parseInt(request.getParameter("natId"));

	        try {
	        	TourMainDto tDto = getImages(natId);
	            String json = new Gson().toJson(tDto);

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
    }
	public TourMainDto getImages(int natId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TourMainDto TourMainDto = null;
        conn = getConnection();
        String sql = "SELECT * FROM tour_main t, nation n "
        			+" WHERE t.nat_id = n.nat_id AND t.nat_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, natId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String backgroundImg = rs.getString("background");
            String flag = rs.getString("flag");
            String name = rs.getString("k_name");
            String category1 = rs.getString("category1");
            String category2 = rs.getString("category2");
            String category3 = rs.getString("category3");
            TourMainDto = new TourMainDto(backgroundImg, flag, name, category1, category2, category3);
        }
        rs.close();
        pstmt.close();
        conn.close();
        return TourMainDto;
	}
	public ArrayList<TourMainDto> getItemListA(int natId) throws Exception {
		Connection conn = getConnection();
		String sql = "SELECT * FROM tour_main WHERE nat_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		ResultSet rs = pstmt.executeQuery();
		String category = "";
		if(rs.next()) {
			category = rs.getString("category1");
		}
			
		sql = "SELECT tour_id, hash, price, title, img"
					+" FROM tour_package"
					+" WHERE nat_id = ? AND category = ?"
					+" ORDER BY tour_id";
		ArrayList<TourMainDto> tourItemList = new ArrayList<TourMainDto>();
		pstmt.setInt(1, natId);
		pstmt.setString(2, category);
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
            String img = rs.getString("img");
            TourMainDto tourDto = new TourMainDto(firstHash,img,tourId,price);
           
            tourItemList.add(tourDto);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return tourItemList;
	};
}
