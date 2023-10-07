package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		UserDao dao = UserDao.getInstance();
		UserDto dto = null;
		HttpSession session = request.getSession();
		try {
			dto = dao.getCheckUserDto(id, pw);
			if(dto != null) {
				session.setAttribute("userEmail",dto.getEmail());
				session.setAttribute("userNickname", dto.getNickname());
				session.setAttribute("idx", dto.getIdx());
				response.sendRedirect("Controller?command=MainPage");
			} else{
				request.setAttribute("LoginErrMsg", "<script>alert('로그인 오류')</script>"); 
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
