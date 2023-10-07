package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryCmtDao;

public class AddCmtAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String cmt = request.getParameter("cmt");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		DiaryCmtDao dao = new DiaryCmtDao();
		try {
			dao.addCmt(idx, dno, cmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

