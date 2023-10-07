package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HrDao;

public class HrCommentDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int hrno = Integer.parseInt(request.getParameter("hrno"));
		
		HrDao dao = new HrDao();
		try {
			dao.HrCommentDelete(hrno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}