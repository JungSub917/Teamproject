package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotelDao;
import dto.NatDto;

public class HotelMainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HotelDao dao = new HotelDao();
		ArrayList<NatDto> hotelsearchdto = null;
		try {
			hotelsearchdto = dao.getHotelSearch();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("hotelsearch", hotelsearchdto);
		RequestDispatcher rd = request.getRequestDispatcher("HotelMain.jsp");
		rd.forward(request, response);
	}
}