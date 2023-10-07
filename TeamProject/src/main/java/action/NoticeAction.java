package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import dao.PageTotal;
import dto.NoticeDto;

public class NoticeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		PageTotal pt = new PageTotal();
		int pageTotal = 0;
		int pageNum = 0;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){
			pageNum = 1;
		}
		NoticeDao nDao = new NoticeDao();
		try {
			pageTotal = pt.getNoticePageTotla();
			noticeList = nDao.getNoiceList(pageNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageTotal", pageTotal);
		RequestDispatcher rd = request.getRequestDispatcher("notice.jsp");
		rd.forward(request, response);

	}

}