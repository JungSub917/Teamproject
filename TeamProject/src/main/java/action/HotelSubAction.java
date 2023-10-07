package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotelDao;
import dto.HotelDto;

public class HotelSubAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cityCode = Integer.parseInt(request.getParameter("cityCode"));
		
		HotelDao dao = new HotelDao();
		ArrayList<HotelDto> hotelmapsinfo = null;
		try {
			hotelmapsinfo = dao.hotelmapinfo(cityCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("mapinfolist", hotelmapsinfo);
		
		RequestDispatcher rd = request.getRequestDispatcher("HotelSub.jsp");
		rd.forward(request, response);
	}
}