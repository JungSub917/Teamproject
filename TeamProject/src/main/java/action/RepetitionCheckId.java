package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

public class RepetitionCheckId implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		UserDao dao = UserDao.getInstance();
		System.out.println(email);
		try {
			int check = dao.RepetitionCheckId(email);
			System.out.println(check);
			response.getWriter().write(check+"");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
