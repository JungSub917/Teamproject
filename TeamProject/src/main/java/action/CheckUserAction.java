package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

public class CheckUserAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			UserDao udao = UserDao.getInstance(); 
			int idx = Integer.parseInt(request.getParameter("idx"));
			String pw = request.getParameter("pw");
			String check = udao.getUserPw(idx);
			PrintWriter out = response.getWriter();
			if(pw.equals(check)) {
				out.write("success");
			} else {
				out.write("mismatch");
			}
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

