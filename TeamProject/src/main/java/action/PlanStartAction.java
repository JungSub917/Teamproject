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

public class PlanStartAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CityDao cDao = new CityDao();
		HttpSession session = request.getSession();
		int idx = (int)session.getAttribute("idx");
		ArrayList<CityDto> CityList = null;
		ArrayList<CityDto> CityLike = null;
		try {
			CityList = cDao.getCityListDto();
			CityLike = cDao.getCityLikeDto(idx);				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("CityList", CityList);
		request.setAttribute("CityLike", CityLike);
		RequestDispatcher rd = request.getRequestDispatcher("Planner.jsp");
		rd.forward(request, response);
	}
}

