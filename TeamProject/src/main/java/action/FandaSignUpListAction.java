package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FandaDao;
import dao.PageTotal;
import dto.FandaDto;

public class FandaSignUpListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<FandaDto> fandaList = new ArrayList<FandaDto>();
		PageTotal pt = new PageTotal();
		int pageTotal = 0;
		int pageNum = 0;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){
			pageNum = 1;
		}
		FandaDao fDao = new FandaDao();
		try {
			fandaList = fDao.getFandaSignUpList(pageNum);
			pageTotal = pt.getFandaSignUpPageTotal();
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("fandaList", fandaList);
		request.setAttribute("pageTotal", pageTotal);
		RequestDispatcher rd = request.getRequestDispatcher("fanda_signup.jsp");
		rd.forward(request, response);
	}

}