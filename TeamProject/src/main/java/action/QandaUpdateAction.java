package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QandaDao;
import dto.QandaDto;

public class QandaUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		QandaDao qDao = new QandaDao();
		QandaDto qDto = null;
		try {
			qDto = qDao.getQandaDetail(qno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("qDto", qDto);
		request.setAttribute("qno", qno);
		RequestDispatcher rd = request.getRequestDispatcher("qanda_contentUpdate.jsp");
		rd.forward(request, response);
	}
}