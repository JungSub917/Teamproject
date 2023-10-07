package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyPlanDao;

public class SetMyPlanNameAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		MyPlanDao pdao = new MyPlanDao();
		try {
			pdao.setMyPlanName(name, pnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

