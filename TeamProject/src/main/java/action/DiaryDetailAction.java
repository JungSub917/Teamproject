package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiaryCmtDao;
import dao.DiaryDao;
import dao.DiaryLikeDao;
import dto.DiaryCmtDto;
import dto.DiaryDto;


public class DiaryDetailAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dno = Integer.parseInt(request.getParameter("dno"));
		HttpSession session = request.getSession();
		DiaryDao ddao = new DiaryDao();
		DiaryCmtDao dcao = new DiaryCmtDao();
		DiaryLikeDao ldao = new DiaryLikeDao();
		DiaryDto dto = null;
		ArrayList<DiaryCmtDto> dto2 = null;
		Object obj = session.getAttribute("idx");
		int idx = 0;
		if(obj!=null) {
			idx=(int)obj;
		}
		try {
			dto = ddao.getDiaryDetail(dno);
			dto2 = dcao.getCmtDto(dno);
			ddao.updateViewCnt(dno);
			int check = ldao.checkDiaryLikeDto(idx, dno);
			request.setAttribute("check", check);
		} catch (Exception e) {
			e.printStackTrace();
		}
			request.setAttribute("diary", dto);
			request.setAttribute("cmt", dto2);
			request.setAttribute("dno", dno);
		RequestDispatcher rd = request.getRequestDispatcher("Diary_board.jsp");
		rd.forward(request, response);
	}
}

