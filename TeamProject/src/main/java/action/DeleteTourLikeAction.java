package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TourDao;



public class DeleteTourLikeAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idx = (int)session.getAttribute("idx");
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		TourDao tpdao = new TourDao();
		try {
			tpdao.deleteTourLikeDao(idx, tourid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

