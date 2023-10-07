package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import dao.HotelDao;

public class HotelCountAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json");
		
		int cityCode = Integer.parseInt(request.getParameter("cityId"));
		int filter3 = Integer.parseInt(request.getParameter("filter3"));
		int filter4 = Integer.parseInt(request.getParameter("filter4"));
		int filter5 = Integer.parseInt(request.getParameter("filter5"));
		String check = request.getParameter("check");
		JSONParser parser = new JSONParser();
		JSONArray jsonarr= null;

		try {
			jsonarr = (JSONArray) parser.parse(check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<Integer> filter6 = new ArrayList<Integer>();

		for (Object num : jsonarr) {
			filter6.add(Integer.parseInt(num.toString()));
		}
		
		HotelDao dao = new HotelDao();
		try {
			int cnt = dao.hotelCount(cityCode, filter3, filter4, filter5, filter6);
			String json = "{\"count\": " + cnt + "}";
			response.getWriter().write(json);
			System.out.println(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}