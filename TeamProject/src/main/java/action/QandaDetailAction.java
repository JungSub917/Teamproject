package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QandaDao;
import dto.QandaDto;

public class QandaDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		String status = "";
		QandaDao qDao = new QandaDao();
		QandaDto qDto =	null;
		try {
			qDto = qDao.getQandaDetail(qno);
			status = qDto.getStatus();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("qDto", qDto);
		request.setAttribute("qno",qno);
		request.setAttribute("status",status);
		RequestDispatcher rd = request.getRequestDispatcher("qandaDetail.jsp");
		rd.forward(request, response);
	}
}