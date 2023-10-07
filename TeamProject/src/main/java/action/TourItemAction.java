package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TourPackageDao;
import dto.TourPackageDto;

public class TourItemAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		TourPackageDao touritem = new TourPackageDao();
		int score = 0;
		double userRating = 0;
		int idx=0;
		HttpSession session = request.getSession();
		if(session.getAttribute("idx")!=null) {
			idx = (int)session.getAttribute("idx");
		}
		int likeCheck = 0;
		try {
			likeCheck = touritem.getTourLike(idx,tourId);
		}catch(Exception e) {
			likeCheck = -1;
		}
		TourPackageDto tourDetail = null;
		ArrayList<TourPackageDto> review = null;
		ArrayList<TourPackageDto> tourList = null;
		TourPackageDto reviewTotal = null;
		
		try {
			
			tourDetail = touritem.getTourItemDetail(tourId);
			review = touritem.getToureview(tourId);
			tourList = touritem.getTourList(tourId);
			reviewTotal = touritem.getReviewTotal(tourId);
			userRating = tourDetail.getUserRating();
			
			if(userRating <= 5.0 && userRating >= 4.6){score = 100;}
			else if(userRating <= 4.5 && userRating >= 4.1){score = 90;}
			else if(userRating <= 4.0 && userRating >= 3.6){score = 80;}
			else if(userRating <= 3.5 && userRating >= 3.1){score = 70;}
			else if(userRating <= 3.0 && userRating >= 2.6){score = 60;}
			else if(userRating <= 2.5 && userRating >= 2.1){score = 50;}
			else if(userRating <= 2.0 && userRating >= 1.6){score = 40;}
			else if(userRating <= 1.5 && userRating >= 1.1){score = 30;}
			else if(userRating <= 1.0 && userRating >= 0.6){score = 20;}
			else if(userRating <= 0.5 && userRating >= 0.1){score = 10;}
			else{score = 0;}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("tourDetail", tourDetail);
		request.setAttribute("tourId", tourId);
		request.setAttribute("reviewList", review);
		request.setAttribute("tourList", tourList);
		request.setAttribute("reviewTotal", reviewTotal);
		request.setAttribute("score", score);
		request.setAttribute("likeCheck", likeCheck);
		RequestDispatcher rd = request.getRequestDispatcher("touritem.jsp");
		rd.forward(request, response);
	}
}