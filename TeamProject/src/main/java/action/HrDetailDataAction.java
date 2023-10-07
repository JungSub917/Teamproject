package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HrDao;
import dto.HrDto;

public class HrDetailDataAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hno = Integer.parseInt(request.getParameter("hno"));
		HrDao hrdao = new HrDao();
		
		HrDto hrdto = null;
		int commentCnt = 0;
		ArrayList<HrDto> commentList = null;
		try {
			hrdto = hrdao.getHotelReviewDetailList(hno);
			commentCnt = hrdao.HrCountComment(hno);
			commentList = hrdao.HrCommentList(hno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("hotelreviewdetaillist", hrdto);
		request.setAttribute("hrCommentCnt", commentCnt);
		request.setAttribute("hrCommnetList", commentList);
		
		RequestDispatcher rd = request.getRequestDispatcher("HotelReviewDe.jsp");
		rd.forward(request, response);
	}

}