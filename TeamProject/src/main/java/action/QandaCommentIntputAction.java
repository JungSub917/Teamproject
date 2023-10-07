package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QandaDao;

public class QandaCommentIntputAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment = request.getParameter("comment");
		int qno = Integer.parseInt(request.getParameter("qno"));
		QandaDao qDao = new QandaDao();
		try {
			qDao.qandaCommentInput(qno, comment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=qanda_detail&qno="+qno);
		rd.forward(request, response);
	}
}