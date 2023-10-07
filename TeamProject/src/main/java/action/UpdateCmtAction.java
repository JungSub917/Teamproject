package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryCmtDao;

public class UpdateCmtAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String ctt= request.getParameter("ctt");
		int cno = Integer.parseInt(request.getParameter("cno"));
		DiaryCmtDao dao = new DiaryCmtDao();
		try {
			dao.updateCmt(ctt, cno);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

