package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HrDao;

public class HrCommentUpdate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hrno = Integer.parseInt(request.getParameter("hrno"));
		String comment = request.getParameter("comment");
		
		HrDao dao = new HrDao();
		try {
			dao.HrCommentUpdate(hrno, comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}