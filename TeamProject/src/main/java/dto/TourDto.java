package dto;

import java.sql.Date;


public class TourDto {
	private String title;
	private String price;
	private String hash;
	private int tourid;
	private double userrating;
	private String img;
	private Date paydate;
	public TourDto(String title, String price, String hash, int tourid, String img, Date paydate) {
		this.title = title;
		this.price = price;
		this.hash = hash;
		this.tourid = tourid;
		this.img = img;
		this.paydate = paydate;
	}
	public TourDto(String title, String price, String hash, int tourid, double userrating, String img) {
		this.title = title;
		this.price = price;
		this.hash = hash;
		this.tourid = tourid;
		this.userrating = userrating;
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public int getTourid() {
		return tourid;
	}
	public void setTourid(int tourid) {
		this.tourid = tourid;
	}
	public double getUserrating() {
		return userrating;
	}
	public void setUserrating(double userrating) {
		this.userrating = userrating;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
}
