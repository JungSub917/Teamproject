package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryCmtDao;
import dao.DiaryDao;
import dao.DiaryLikeDao;
import dto.DiaryDto;



public class DiaryDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiaryDao ddao = new DiaryDao();
		DiaryCmtDao dcao = new DiaryCmtDao();
		DiaryLikeDao ldao = new DiaryLikeDao();
		int dno = Integer.parseInt(request.getParameter("dno"));
		ArrayList<DiaryDto> dto = null;
		try {
			ldao.deleteDiaryLikeDto(dno);
			dcao.deleteAllCmt(dno);
			ddao.deleteDiaryAction(dno);
			dto = ddao.getDiaryListDto();
			
			request.setAttribute("list", dto);
			request.setAttribute("delsuccess", "OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Controller?command=diary");
	}
}

