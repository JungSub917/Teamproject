package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		NoticeDao nDao = new NoticeDao();
		NoticeDto nDto = null;
		try {
			nDto = nDao.getNoticeDto(nno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("nDto", nDto );
		RequestDispatcher rd = request.getRequestDispatcher("notice_update.jsp");
		rd.forward(request, response);

	}

}