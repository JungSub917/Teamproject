package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyPlanDao;
import dao.TourDao;
import dto.MyPlanDto;
import dto.TourDto;

public class MyPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyPlanDao pdao = new MyPlanDao();
		TourDao tpdao = new TourDao();
		HttpSession session = request.getSession();
		int idx = (int) session.getAttribute("idx");
		ArrayList<MyPlanDto> myplan = null;
		ArrayList<TourDto> liketour = null;
		ArrayList<TourDto> tourrsv = null;
		ArrayList<TourDto> tourcancel = null;
		try {
			myplan = pdao.getMyPlanList(idx);
			liketour = tpdao.getLikeTourPackage(idx);
			tourrsv = tpdao.getTourReservation(idx);
			tourcancel = tpdao.getTourCancel(idx);
			tpdao.getTourReservation(idx);
			tpdao.getTourCancel(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("myplan", myplan);
		request.setAttribute("liketour", liketour);
		request.setAttribute("tourrsv", tourrsv);
		request.setAttribute("tourcancel", tourcancel);
		RequestDispatcher rd = request.getRequestDispatcher("Mypage.jsp");
		rd.forward(request, response);
	}
}
