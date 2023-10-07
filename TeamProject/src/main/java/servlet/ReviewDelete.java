package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReviewDelete")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		 	
		 boolean reviewDeletedSuccessfully = false;
	        try {
	            reviewDeletedSuccessfully = deleteReview(reviewId);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 
		 if (reviewDeletedSuccessfully) {
	            response.setStatus(HttpServletResponse.SC_OK);
	        } else {
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	}
	
	private Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "stubbypublic";
		String dbPw = "pass1234";
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		
		return conn;
	}
	private boolean deleteReview(int reviewId) throws Exception {
		Connection conn = getConnection(); 
	        String sql = "DELETE FROM tour_review WHERE tno = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, reviewId);
	        
	        int affectedRows = pstmt.executeUpdate();  // 리뷰 삭제 실행
	        
	        if (affectedRows == 1) {
	            return true;
	        }
	    pstmt.close();
	    conn.close();
	    return false;  // 삭제 실패
	}
}