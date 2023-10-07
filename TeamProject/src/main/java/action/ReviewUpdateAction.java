package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourPackageDao;
import dto.TourPackageDto;

public class ReviewUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int tno = Integer.parseInt(request.getParameter("tno"));
		TourPackageDao tDao = new TourPackageDao();
		TourPackageDto tDto = null;
		try {
			tDto = tDao.reviewDetail(idx, tno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("tDto", tDto);
		RequestDispatcher rd = request.getRequestDispatcher("reviewUpdate.jsp");
		rd.forward(request, response);
	}
}