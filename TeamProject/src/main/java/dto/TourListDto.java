package dto;

public class TourListDto {
	String img;
	String hash;
	int price;
	int tourId;
	double rating;
	String title;
	String natName;
	String money;
	public TourListDto(String natName,String img, String hash, int price, int tourId) {
		this.img = img;
		this.hash = hash;
		this.price = price;
		this.tourId = tourId;
		this.natName = natName;
	}
	public TourListDto(String natName,String img, String hash, String money, int tourId) {
		this.img = img;
		this.hash = hash;
		this.money = money;
		this.tourId = tourId;
		this.natName = natName;
	}
	
	
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getNatName() {
		return natName;
	}


	public void setNatName(String natName) {
		this.natName = natName;
	}


	public TourListDto(String img, int price, int tourId, double rating, String title) {
		this.img = img;
		this.price = price;
		this.tourId = tourId;
		this.rating = rating;
		this.title = title;
	}
	public TourListDto(String img, String money, int tourId, double rating, String title) {
		this.img = img;
		this.money = money;
		this.tourId = tourId;
		this.rating = rating;
		this.title = title;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

}
