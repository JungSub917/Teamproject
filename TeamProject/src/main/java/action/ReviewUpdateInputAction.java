package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourPackageDao;
import dto.TourPackageDto;

public class ReviewUpdateInputAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int tno = Integer.parseInt(request.getParameter("tno"));
			double rating;
			TourPackageDao tourDao = new TourPackageDao();
		try {
			if(request.getParameter("rating")==null) {
				TourPackageDto dto = tourDao.reviewDetail(idx, tno);
				rating = dto.getUserRating();
			} else {
				rating = Integer.parseInt(request.getParameter("rating"));
			}
			tourDao.reviewUpdate(idx,tno,rating,title,content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("reviewUpdateAction.jsp");
		rd.forward(request, response);
	}
}