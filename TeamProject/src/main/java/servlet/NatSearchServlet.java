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

@WebServlet("/natSearch")
public class NatSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String searchNat = request.getParameter("dodbogi");
		response.getWriter().write(searchJSON(searchNat));
	}
	@SuppressWarnings("unchecked")
	public String searchJSON(String searchNat) {
		StringBuffer result = new StringBuffer("");
		JSONArray jsonArray1 = new JSONArray();
		natDAO natDao = new natDAO();
		ArrayList<NatDto> searchnat = null;
		try {
			searchnat = natDao.natSearch(searchNat);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		for(NatDto dto : searchnat) {
			JSONObject jsonObject1 = new JSONObject();
			jsonObject1.put("natId", dto.getNatId());
			jsonObject1.put("korName", dto.getNatKorname());
			jsonObject1.put("engName", dto.getNatEngname());
			jsonArray1.add(jsonObject1);
		}
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("result1", jsonArray1);
		result.append(jsonResult.toJSONString());
		return result.toString();
	}

}
