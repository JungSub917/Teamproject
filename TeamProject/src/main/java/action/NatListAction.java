package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CityDao;
import dao.natDAO;
import dto.CityDto;
import dto.NatDto;

public class NatListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		natDAO dao = new natDAO();
		CityDao cdao = new CityDao();
		ArrayList<NatDto> natlist = null;
		ArrayList<CityDto> citylist = null;
		try {
			citylist = cdao.getCityListDto();
			natlist = dao.natList();
		} catch(Exception e) {
		}
		request.setAttribute("natlist", natlist);
		request.setAttribute("citylist", citylist);
		RequestDispatcher rd = request.getRequestDispatcher("SearchMain.jsp");
		rd.forward(request, response);
	}
}
