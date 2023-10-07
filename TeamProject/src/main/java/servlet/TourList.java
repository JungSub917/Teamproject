package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.TourListDto;

/**
 * Servlet implementation class TourList
 */
@WebServlet("/TourList")
public class TourList extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int natId = Integer.parseInt(request.getParameter("natId"));
		  try {
	        	ArrayList<TourListDto> toruList = getTourList(natId);
	            String json = new Gson().toJson(toruList);

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
		String sql = "SELECT * FROM tour_main t, nation n WHERE t.nat_id = n.nat_id AND t.nat_Id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		ResultSet rs = pstmt.executeQuery();
		String category = "";
		String natName = "";
		if(rs.next()) {
			category = rs.getString("category1");
			natName = rs.getString("k_name");
		}
		sql = "SELECT tour_id, hash, price, title, img"
					+" FROM tour_package"
					+" WHERE nat_id = ? AND category = ?"
					+" ORDER BY tour_id";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, natId);
		pstmt.setString(2, category);
		rs = pstmt.executeQuery(); 
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
            String img = rs.getString("img");
            int price = rs.getInt("price");
			DecimalFormat dc = new DecimalFormat("###,###,###"); 
			String money = dc.format(price);
            TourListDto tourDto = new TourListDto(natName,img,firstHash,money,tourId);
            tourList.add(tourDto);
		};
		rs.close();
		pstmt.close();
		conn.close();
		return tourList;
		
	};
	
}
