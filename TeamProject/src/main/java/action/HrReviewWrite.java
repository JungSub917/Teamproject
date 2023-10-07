package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HrDao;

public class HrReviewWrite implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		String review = request.getParameter("review");
		
		HrDao dao = new HrDao();
		try {
			dao.HrWrite(title, hotelId, idx, review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("HotelReview.jsp");
		rd.forward(request, response);
	}

}