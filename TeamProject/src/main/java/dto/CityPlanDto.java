package dto;


public class CityPlanDto {
	private String name, why, tip;
	private int PlanDay,CityId,PlanOrder;
	private double lat, lon;
	public CityPlanDto(String name, String why, String tip, int planDay, int cityId, int planOrder, double lat,
			double lon) {
		this.name = name;
		this.why = why;
		this.tip = tip;
		this.PlanDay = planDay;
		this.CityId = cityId;
		this.PlanOrder = planOrder;
		this.lat = lat;
		this.lon = lon;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWhy() {
		return why;
	}
	public void setWhy(String why) {
		this.why = why;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public int getPlanDay() {
		return PlanDay;
	}
	public void setPlanDay(int planDay) {
		PlanDay = planDay;
	}
	public int getCityId() {
		return CityId;
	}
	public void setCityId(int cityId) {
		CityId = cityId;
	}
	public int getPlanOrder() {
		return PlanOrder;
	}
	public void setPlanOrder(int planOrder) {
		PlanOrder = planOrder;
	}
}
