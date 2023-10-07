package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QandaDao;

public class QandaDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		HttpSession session = request.getSession();
		int idx;
		try{
			idx = (int)session.getAttribute("idx");
		}catch(Exception e){
			idx = 0;
		}
		QandaDao qDao = new QandaDao();
		try {
			qDao.qandaDeleteContent(qno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=qanda_list");
		rd.forward(request, response);
	}

}