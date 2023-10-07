package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.CityDao;

public class SetMyPlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int pcnt=0;
		int pnum=0;
		int pno=0;
		int idx=0;
		CityDao myplan = new CityDao();
		String json = request.getParameter("list");
		JSONArray jsonArr = new JSONArray();
		JSONParser parser = new JSONParser();
		try {
			jsonArr = (JSONArray)parser.parse(json);
			for(int i=jsonArr.size()-1;i>=0;i--) {
				JSONObject Jsonobj = (JSONObject)jsonArr.get(i);
				if(i==jsonArr.size()-1) {
					pcnt = Integer.parseInt(Jsonobj.get("p_cnt").toString());
					idx = Integer.parseInt(Jsonobj.get("idx").toString());
					String start = Jsonobj.get("p_start").toString();
					String end = Jsonobj.get("p_end").toString();
					pno = Integer.parseInt(Jsonobj.get("pno").toString());
					myplan.deleteMyPlanDao(pno);
					myplan.deletePlanTripDao(pno);
					pnum = myplan.setMyPlanDao(pcnt,idx,start,end);
				} else if(i!=jsonArr.size()){
					int cityid = Integer.parseInt(Jsonobj.get("cityid").toString());
					int planday = Integer.parseInt(Jsonobj.get("plan_day").toString());
					myplan.setPlantripDao(cityid, planday, pnum, i+1);
				}
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}
