package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiaryDao;
import dao.natDAO;
import dto.DiaryDto;
import dto.NatDto;

public class MainPageSearchAction implements Action {

	@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		natDAO dao = new natDAO();
		DiaryDao ddao = new DiaryDao();
		ArrayList<NatDto> mainSearch = null;
		ArrayList<NatDto> cityranking = null;
		ArrayList<DiaryDto> diaryranking = null;
		
		try {
			mainSearch = dao.getNatCityDto();
			cityranking = dao.getCityRankingDto();
			diaryranking = ddao.getDiaryRanking();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("mainsearch", mainSearch);
		request.setAttribute("cityranking", cityranking);
		request.setAttribute("diaryranking", diaryranking);
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
		rd.forward(request, response);
	}

}
