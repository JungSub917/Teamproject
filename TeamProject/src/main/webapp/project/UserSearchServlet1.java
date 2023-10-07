import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import dao.CityDao;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int pcnt = Integer.parseInt(request.getParameter("p_cnt"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		String start = request.getParameter("p_start");
		String end = request.getParameter("p_end");
		CityDao myplan = new CityDao();
		myplan.setMyPlanDao(pcnt, idx, start, end);
		response.getWriter().write("Success");
}

