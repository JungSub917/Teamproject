package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.HotelDao;
import dto.HotelDto;

public class HotelOrderAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			int cityCode = Integer.parseInt(request.getParameter("cityId"));
			int hotelOrder = Integer.parseInt(request.getParameter("order"));
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
			
			try {
				response.getWriter().write(getJSON(pageNum, cityCode, hotelOrder, filter3, filter4, filter5, filter6));
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	}
	
	public String getJSON(int pageNum, int cityCode, int hotelOrder, int filter3, int filter4, int filter5, ArrayList<Integer> filter6)
			throws SQLException {

		StringBuffer result = new StringBuffer("");
		JSONArray jsonArray = new JSONArray();

		HotelDao dao = new HotelDao();
		ArrayList<HotelDto> hdto = null;
		 
		try {
			hdto = dao.hotelFO(pageNum, cityCode, hotelOrder, filter3, filter4, filter5, filter6);
		} catch (Exception e) {
			e.printStackTrace();
		}

		for (HotelDto dto : hdto) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("hotelImg", dto.getHotelImg());
			jsonObject.put("hotelName", dto.getHotelName());
			jsonObject.put("hotelPrice", dto.getHotelPrice());
			jsonObject.put("userRating", dto.getUserRating());
			jsonObject.put("countHotel", dto.getCountHotel());
			jsonArray.add(jsonObject);
		}
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("result", jsonArray);

		result.append(jsonResult.toJSONString());
		return result.toString();

	}

}