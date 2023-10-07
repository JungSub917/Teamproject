package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FandaDao;
import dto.FandaDto;

public class FandaUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FandaDao fDao = new FandaDao();
		int fno = Integer.parseInt(request.getParameter("fno"));
		FandaDto fDto = null;
		try {
			fDto = fDao.fandaContentUpdate(fno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("fDto",fDto);
		RequestDispatcher rd = request.getRequestDispatcher("fanda_update.jsp");
		rd.forward(request, response);
	}

}