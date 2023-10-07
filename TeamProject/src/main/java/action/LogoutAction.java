package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pageNum = Integer.parseInt(request.getParameter("page"));
		session.invalidate();
		
		switch(pageNum) {
			case 1 : response.sendRedirect("Controller?command=MainPage"); break;
			case 2 : response.sendRedirect("Controller?command=natlist"); break;
			case 3 : response.sendRedirect("Controller?command=tour_main"); break;
			case 4 : response.sendRedirect("Controller?command=HotelMain"); break;
			case 5 : response.sendRedirect("Controller?command=diary"); break;
		
		}
	}

}
