package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CityDao;
import dto.CityDto;
import dto.CityPlanDto;

public class PlanModifyAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CityDao cDao = new CityDao();
		HttpSession session = request.getSession();
		int idx = (int)session.getAttribute("idx");
		int pno = Integer.parseInt(request.getParameter("pno"));
		ArrayList<CityDto> CityList = null;
		ArrayList<CityDto> CityLike = null;
		ArrayList<CityPlanDto> CityPlan = null;
		try {
			CityList = cDao.getCityListDto();
			CityLike = cDao.getCityLikeDto(idx);
			CityPlan = cDao.getCityPlanDto(pno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("CityList", CityList);
		request.setAttribute("CityLike", CityLike);
		request.setAttribute("CityPlan", CityPlan);
		request.setAttribute("pno", pno);
		RequestDispatcher rd = request.getRequestDispatcher("Planner.jsp");
		rd.forward(request, response);
	}
}

