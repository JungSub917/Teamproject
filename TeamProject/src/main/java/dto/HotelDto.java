package dto;

public class HotelDto {
	private int hotelId;
	private String hotelName;
	private int hotelPrice;
	private Double hotelLat;
	private Double hotelLon;
	private String hotelImg;
	private	Double userRating;
	private int hotelRating;
	private int goo;
	private Double toE;
	private Double toR;
	private Double toB;
	private Double toG;
	private Double toN;
	private Double toS;
	private int cityId;
	private int countHotel;
	
	public HotelDto(int hotelId, String hotelName, int hotelPrice, Double hotelLat, Double hotelLon, String hotelImg, Double userRating,
			int hotelRating, int goo, Double toE, Double toR, Double toB, Double toG, Double toN, Double toS, int cityId, int countHotel) {
		this.hotelId = hotelId;
		this.hotelName = hotelName;
		this.hotelPrice = hotelPrice;
		this.hotelLat = hotelLat;
		this.hotelLon = hotelLon;
		this.hotelImg = hotelImg;
		this.userRating = userRating;
		this.goo = goo;
		this.toE = toE;
		this.toR = toR;
		this.toB = toB;
		this.toG = toG;
		this.toN = toN;
		this.toS = toS;
		this.cityId = cityId;
		this.countHotel = countHotel;
	}
	public HotelDto(String hotelImg, String hotelName, int hotelPrice, Double userRating) {
		this.hotelImg = hotelImg;
		this.hotelName = hotelName;
		this.hotelPrice = hotelPrice;
		this.userRating = userRating;
	}
	public HotelDto(String hotelImg, double userRating, int hotelPrice, double hotelLat, double hotelLon, String hotelName) {
		this.hotelImg = hotelImg;
		this.userRating = userRating;
		this.hotelPrice = hotelPrice;
		this.hotelLat = hotelLat;
		this.hotelLon = hotelLon;
		this.hotelName = hotelName;
	}
	public HotelDto() {
		
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public int getHotelPrice() {
		return hotelPrice;
	}
	public void setHotelPrice(int hotelPrice) {
		this.hotelPrice = hotelPrice;
	}
	public Double getHotelLat() {
		return hotelLat;
	}
	public void setHotelLat(Double hotelLat) {
		this.hotelLat = hotelLat;
	}
	public Double getHotelLon() {
		return hotelLon;
	}
	public void setHotelLon(Double hotelLon) {
		this.hotelLon = hotelLon;
	}
	public String getHotelImg() {
		return hotelImg;
	}
	public void setHotelImg(String hotelImg) {
		this.hotelImg = hotelImg;
	}
	public Double getUserRating() {
		return userRating;
	}
	public void setUserRating(Double userRating) {
		this.userRating = userRating;
	}
	public int getHotelRating() {
		return hotelRating;
	}
	public void setHotelRating(int hotelRating) {
		this.hotelRating = hotelRating;
	}
	public int getGoo() {
		return goo;
	}
	public void setGoo(int goo) {
		this.goo = goo;
	}
	public Double getToE() {
		return toE;
	}
	public void setToE(Double toE) {
		this.toE = toE;
	}
	public Double getToR() {
		return toR;
	}
	public void setToR(Double toR) {
		this.toR = toR;
	}
	public Double getToB() {
		return toB;
	}
	public void setToB(Double toB) {
		this.toB = toB;
	}
	public Double getToG() {
		return toG;
	}
	public void setToG(Double toG) {
		this.toG = toG;
	}
	public Double getToN() {
		return toN;
	}
	public void setToN(Double toN) {
		this.toN = toN;
	}
	public Double getToS() {
		return toS;
	}
	public void setToS(Double toS) {
		this.toS = toS;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getCountHotel() {
		return countHotel;
	}
	public void setCountHotel(int countHotel) {
		this.countHotel = countHotel;
	}
	
	
	
}