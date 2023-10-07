package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.HrDao;
import dto.HrDto;


public class HrInfiniteScrollAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		HrDao hdao = new HrDao();
		ArrayList<HrDto> listHotelRe = null;
		
		try {
			listHotelRe = hdao.getHotelReviewList(pageNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		for(HrDto hdto : listHotelRe) {
			JSONObject obj = new JSONObject();
			obj.put("hno", hdto.getHno());
			obj.put("hotelId", hdto.getHotelId());
			obj.put("hrDate", hdto.getHrDate());
			obj.put("hotelName", hdto.getHotelName());
			obj.put("title", hdto.getTitle());
			obj.put("nickName", hdto.getNickName());
			obj.put("hotelImg", hdto.getHotelImg()); 
			array.add(obj);
		}
		out.println(array);
		System.out.println(array);
	}
}