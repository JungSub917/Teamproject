package dto;

public class TourMainDto {
	String backImg;
	String flag;
	String name;
	String category1;
	String category2;
	String category3;
	
	String hash;
	String title;
	String img;
	int tourId;
	int price;
	double rating;
	
	public TourMainDto(String hash, String img, int price, int tourId) {
		this.tourId = tourId;
		this.hash = hash;
		this.img = img;
		this.price = price;
	}
	public TourMainDto(String title,String img, int price, int tourId, double rating) {
		this.tourId = tourId;
		this.title = title;
		this.img = img;
		this.rating = rating;
		this.price = price;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
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
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public TourMainDto(String backImg, String flag, String name, String category1, String category2, String category3) {
		this.backImg = backImg;
		this.flag = flag;
		this.name = name;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
	}
	public String getBackImg() {
		return backImg;
	}
	public void setBackImg(String backImg) {
		this.backImg = backImg;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category) {
		this.category3 = category;
	}
}