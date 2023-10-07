package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CityDao;

public class DeleteMyPlanAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		CityDao cdao = new CityDao();
		try {
			cdao.deleteMyPlanDao(pnum);
			cdao.deletePlanTripDao(pnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

