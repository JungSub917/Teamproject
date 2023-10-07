package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryLikeDao;

public class DiaryLikeAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		int check = Integer.parseInt(request.getParameter("check"));
		DiaryLikeDao ldao = new DiaryLikeDao();
		try {
			switch (check) {
				case 0: {
					ldao.deleteDiaryLikeDto(idx, dno);
					break;
				}
				case 1: {
					ldao.addDiaryLikeDto(idx, dno);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

