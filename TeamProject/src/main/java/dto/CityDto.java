package dto;

public class CityDto {
	
	private int Cityid;
	private int natid;
	private int rank;
	private double lat;
	private double lon;
	private String name;
	private String why;
	private String tip;
	private String sum;

	public CityDto(int natid, int cityid, int rank, double lat, double lon, String name, String why, String tip, String sum) {
		this.natid = natid;
		this.Cityid = cityid;
		this.rank = rank;
		this.lat = lat;
		this.lon = lon;
		this.name = name;
		this.why = why;
		this.tip = tip;
		this.sum = sum;
	}

	public CityDto() {
	}

	public int getNatid() {
		return natid;
	}

	public void setNatid(int natid) {
		this.natid = natid;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public int getCityid() {
		return Cityid;
	}

	public void setCityid(int cityid) {
		Cityid = cityid;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
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

}
