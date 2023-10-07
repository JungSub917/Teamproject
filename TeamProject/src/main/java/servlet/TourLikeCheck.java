package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.TourPackageDao;
import dto.TourMainDto;

@WebServlet("/TourLikeCheck")
public class TourLikeCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TourPackageDao tDao = new TourPackageDao();
		HttpSession session = request.getSession();
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		int idx;
		try{
			idx = (int)session.getAttribute("idx");
		}catch(Exception e){
			idx = 0;
		}
		int tourlikeCheck = 0;
		try {
			tourlikeCheck =	tDao.getTourLike(idx, tourId);
		} catch (Exception e) {
			e.printStackTrace();
		}
        String json = new Gson().toJson(tourlikeCheck);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}
}
