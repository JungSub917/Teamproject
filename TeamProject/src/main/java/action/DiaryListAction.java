package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import dto.DiaryDto;

public class DiaryListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiaryDao ddao = new DiaryDao();
		ArrayList<DiaryDto> dto = null;
		try {
			dto = ddao.getDiaryListDto();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", dto);
		RequestDispatcher rd = request.getRequestDispatcher("Diary.jsp");
		rd.forward(request, response);
	}
}

