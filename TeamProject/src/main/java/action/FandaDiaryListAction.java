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

public class FandaDiaryListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<FandaDto> fandalist = new ArrayList<FandaDto>();
		FandaDao fDao = new FandaDao();
		PageTotal pt = new PageTotal();
		int pageNum = 0;
		int totalPage = 0;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){
			pageNum = 1;
		}
		
		try {
			fandalist = fDao.getFandaDiaryList(pageNum);
			totalPage = pt.getFandaDiaryPageTotal();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("fandalist",fandalist);
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("totalPage",totalPage);
		RequestDispatcher rd = request.getRequestDispatcher("fanda_diary.jsp");
		rd.forward(request, response);
		
	}
}