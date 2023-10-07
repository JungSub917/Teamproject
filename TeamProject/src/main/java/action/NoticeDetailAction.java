package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		NoticeDao nDao = new NoticeDao();
		NoticeDto noticeContent = null;
		try {
			noticeContent = nDao.getNoticeDto(nno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("noticeContent", noticeContent);
		RequestDispatcher rd = request.getRequestDispatcher("notice_detail.jsp");
		rd.forward(request, response);
	}

}