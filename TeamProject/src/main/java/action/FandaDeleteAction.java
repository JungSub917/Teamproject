package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FandaDao;

public class FandaDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FandaDao fDao = new FandaDao();
		int fno = Integer.parseInt(request.getParameter("fno"));
		String category = "";
		try {
			category = fDao.fandacategory(fno);
			fDao.fandaContentDelete(fno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = null;
		if(category.equals("회원가입")) {
			rd = request.getRequestDispatcher("Controller?command=fanda_signup_list");
		}else if(category.equals("여행기 작성")) {
			rd = request.getRequestDispatcher("Controller?command=fanda_diary_list");
		}else if(category.equals("여행 일정 작성")) {
			rd = request.getRequestDispatcher("Controller?command=fanda_plan_list");
		}else if(category.equals("기타")) {
			rd = request.getRequestDispatcher("Controller?command=fanda_except_list");
		}
		rd.forward(request, response);
	}
}