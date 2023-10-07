package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.natDAO;
import dto.NatDto;

@WebServlet("/natOrder")
public class NatOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int option = Integer.parseInt(request.getParameter("option"));
		response.getWriter().write(getJSON(option));
	}
	@SuppressWarnings("unchecked")
	public String getJSON(int option) {
		StringBuffer result = new StringBuffer("");
		JSONArray jsonArray = new JSONArray();
		natDAO natDao = new natDAO();
		ArrayList<NatDto> natList = null;
		try {
			natList = natDao.natOrder(option);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(NatDto dto : natList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("natId", dto.getNatId());
			jsonObject.put("korName", dto.getNatKorname());
			jsonObject.put("engName", dto.getNatEngname());
			jsonArray.add(jsonObject);
		}
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("result", jsonArray);
		result.append(jsonResult.toJSONString());
		return result.toString();
	}
}
