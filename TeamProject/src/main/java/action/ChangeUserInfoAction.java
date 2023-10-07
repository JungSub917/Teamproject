package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;

public class ChangeUserInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			int idx = (int)session.getAttribute("idx");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String pass = request.getParameter("pass");
			System.out.println(pass);
			UserDao dao = UserDao.getInstance();
			try {
				UserDto dto = dao.getUserinfo(idx);
//				새 비밀번호 설정 안했을시
				if(pass==null) {
					pass=dto.getPw();
				}
				dao.changeUserDto(name, nickname, pass, idx);
			} catch(Exception e) {
				e.printStackTrace();
			}
			session.invalidate();
			System.out.println("세션 값 지워짐");
	}

}
