package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TourPackageDao;

@WebServlet("/TourLikeUpdate")
public class TourLikeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TourPackageDao tDao = new TourPackageDao();
		HttpSession session = request.getSession();
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		int likeCheck = Integer.parseInt(request.getParameter("likeCheck")); // 오타 수정 (lickCheck -> likeCheck)
		int updateCheck = -1;
		String check = "";
		int idx;
		try{
			idx = (int)session.getAttribute("idx");
		}catch(Exception e){
			idx = 0;
		}
		try {
			if(likeCheck == 1) {
				tDao.deleteTourLike(idx, tourId);
				updateCheck = -1;
				check = "찜 목록에서 삭제 되었습니다.";
			}else {
				tDao.tourLike(idx, tourId);
				updateCheck = 1;
				check = "찜 목록에 추가 되었습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// JSON 형태로 응답하기 위해 ContentType 설정
		response.setContentType("application/json");
		// JSON 형태의 응답 데이터 생성
		String jsonResponse = "{\"updateCheck\":" + updateCheck + ", \"check\":\"" + check + "\"}";
		// 응답 데이터 전송
		response.getWriter().write(jsonResponse);
	}

}