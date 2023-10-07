package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

public class SignUpUser implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String name = request.getParameter("inputName");
		String nickname = request.getParameter("inputNick");
		String pw = request.getParameter("inputPass");
		UserDao dao = UserDao.getInstance();
		try {
			dao.SignUpUser(name, email, nickname, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Login.jsp");
			
	}

}
