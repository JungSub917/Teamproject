package dto;

public class NatDto {
	private int natId;
	private String natKorname;
	private String natEngname;
	private String description;
	private String currency;
	private String volt;
	private String visa;
	private String timedi;
	private String arrcity[];
	private int cityId;
	private String cityName;
	
	
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public NatDto(int natId, String natKorname, String natEngname, String description, String currency, String volt,
			String visa, String timedi, String arrcity[]) {
		this.natId = natId;
		this.natKorname = natKorname;
		this.natEngname = natEngname;
		this.description = description;
		this.currency = currency;
		this.volt = volt;
		this.visa = visa;
		this.timedi = timedi;
		this.arrcity = arrcity;
	}
	public NatDto(int natId, String natKorname, int cityId, String cityName) {
		this.natId = natId;
		this.natKorname = natKorname;
		this.cityId = cityId;
		this.cityName = cityName;
	}
	public NatDto(int natId, String natKorname, String natEngname) {
		this.natId = natId;
		this.natKorname = natKorname;
		this.natEngname = natEngname;
	}
	public int getNatId() {
		return natId;
	}
	public void setNatId(int natId) {
		this.natId = natId;
	}
	public String getNatKorname() {
		return natKorname;
	}
	public void setNatKorname(String natKorname) {
		this.natKorname = natKorname;
	}
	public String getNatEngname() {
		return natEngname;
	}
	public void setNatEngname(String natEngname) {
		this.natEngname = natEngname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getVolt() {
		return volt;
	}
	public void setVolt(String volt) {
		this.volt = volt;
	}
	public String getVisa() {
		return visa;
	}
	public void setVisa(String visa) {
		this.visa = visa;
	}
	public String getTimedi() {
		return timedi;
	}
	public void setTimedi(String timedi) {
		this.timedi = timedi;
	}
	
	public String[] getArrcity() {
		return arrcity;
	}
	public void setArrcity(String[] arrcity) {
		this.arrcity = arrcity;
	}
	
}
