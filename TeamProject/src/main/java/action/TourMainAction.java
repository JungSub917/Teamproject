package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourPackageDao;
import dto.TourPackageDto;

public class TourMainAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			TourPackageDao tourDao = new TourPackageDao();
			int natId = 11101;
			ArrayList<TourPackageDto> natList = new ArrayList<TourPackageDto>();
			TourPackageDto nation = null;
			try {
				nation = tourDao.getNation(natId);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			String category1 = nation.getCategory1();
		   	String category2 = nation.getCategory2();
		   	String category3 = nation.getCategory3();
		   	
		   	ArrayList<TourPackageDto> tourItemList1 = new ArrayList<TourPackageDto>();
		   	ArrayList<TourPackageDto> tourItemList2 = new ArrayList<TourPackageDto>();
		   	ArrayList<TourPackageDto> tourItemList3 = new ArrayList<TourPackageDto>();
		   	try {
				natList = tourDao.getNationList();
				tourItemList1 = tourDao.getTourItemListA(natId, category1);
				tourItemList2 = tourDao.getTourItemListB(natId, category2);
				tourItemList3 = tourDao.getTourItemListB(natId, category3);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   	request.setAttribute("nation", nation);
		   	request.setAttribute("natList", natList);
		   	
		   	request.setAttribute("tourItemList1", tourItemList1);
		   	request.setAttribute("tourItemList2", tourItemList2);
		   	request.setAttribute("tourItemList3", tourItemList3);
		   	RequestDispatcher rd = request.getRequestDispatcher("tourMain.jsp");
		   	rd.forward(request, response);
	}
}