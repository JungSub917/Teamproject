package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PageTotal;
import dao.QandaDao;
import dto.QandaDto;

public class QandaListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<QandaDto> qandaList = new ArrayList<QandaDto>();
		HttpSession session = request.getSession();
		int idx;
		try{
			idx = (int)session.getAttribute("idx");
		}catch(Exception e){
			idx = 0;
		}
		PageTotal pt = new PageTotal();
		int pageTotal = 0;
		int pageNum = 0;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){
			pageNum = 1;
		}
		QandaDao qDao = new QandaDao();
		try {
			qandaList = qDao.getQandaList(idx, pageNum);
			pageTotal = pt.getQandaPageTotal(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("qandaList", qandaList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageTotal", pageTotal);
		RequestDispatcher rd = request.getRequestDispatcher("qanda.jsp");
		rd.forward(request, response);
	}
	
}