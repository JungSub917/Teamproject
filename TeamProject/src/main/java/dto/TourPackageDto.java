package dto;

public class TourPackageDto {
	private String natName;
	private String category1;
	private String category2;
	private String category3;
	private String natIcon;
	private String img;
	private int price;
	private String money;
	private double userRating;
	private int tourId;
	private int natId;
	private String tourTitle;
	private String hash;
	private String backgroundImg;
	private String flag;
	
	private String descriptionImg;
	private String description;
	private String tourPoint;
	private String tourTime;
	private String caution1;
	private String caution2;
	private String caution3;
	private String caution4;
	private double tourLat;
	private double tourLon;
	
	private String reviewTitle;
	private String reviewContent;
	private String trDate;
	private String nickName;
	private int tno;
	private int idx;
	private int reviewTotal;
	
	
	public TourPackageDto(int reviewTotal) {
		this.reviewTotal = reviewTotal;
	}
	public int getReviewTotal() {
		return reviewTotal;
	}

	public void setReviewTotal(int reviewTotal) {
		this.reviewTotal = reviewTotal;
	}
	public TourPackageDto(int tourId, int price, String title, String img, double rating) {
		this.tourId = tourId;
		this.price = price;
		this.tourTitle = title;
		this.img = img;
		this.userRating = rating;
	}
	public TourPackageDto(int tourId, String money, String title, String img, double rating) {
		this.tourId = tourId;
		this.money = money;
		this.tourTitle = title;
		this.img = img;
		this.userRating = rating;
	}
	public TourPackageDto(int tno, String reviewTitle, String reviewContent, String trDate, double userRating
			 , String nickName, int idx) {
		this.tno = tno;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.trDate = trDate;
		this.userRating = userRating;
		this.nickName = nickName;
		this.idx = idx;
	}
	public TourPackageDto(String title, String content, double rating) {
		this.reviewTitle = title;
		this.reviewContent = content;
		this.userRating = rating;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getTrDate() {
		return trDate;
	}

	public void setTrDate(String trDate) {
		this.trDate = trDate;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public TourPackageDto(String natName, String img, int price, double userRating, int tourId, int natId,
			String tourTitle, String hash, String descriptionImg, String description, String tourPoint, String tourTime,
			String caution1, String caution2, String caution3, String caution4, double tourLat, double tourLon, String money) {
		this.natName = natName;
		this.img = img;
		this.price = price;
		this.userRating = userRating;
		this.tourId = tourId;
		this.natId = natId;
		this.tourTitle = tourTitle;
		this.hash = hash;
		this.descriptionImg = descriptionImg;
		this.description = description;
		this.tourPoint = tourPoint;
		this.tourTime = tourTime;
		this.caution1 = caution1;
		this.caution2 = caution2;
		this.caution3 = caution3;
		this.caution4 = caution4;
		this.tourLat = tourLat;
		this.tourLon = tourLon;
		this.money = money;
	}
	public String getDescriptionImg() {
		return descriptionImg;
	}
	public void setDescriptionImg(String descriptionImg) {
		this.descriptionImg = descriptionImg;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTourPoint() {
		return tourPoint;
	}
	public void setTourPoint(String tourPoint) {
		this.tourPoint = tourPoint;
	}
	public String getTourTime() {
		return tourTime;
	}
	public void setTourTime(String tourTime) {
		this.tourTime = tourTime;
	}
	public String getCaution1() {
		return caution1;
	}
	public void setCaution1(String caution1) {
		this.caution1 = caution1;
	}
	public String getCaution2() {
		return caution2;
	}
	public void setCaution2(String caution2) {
		this.caution2 = caution2;
	}
	public String getCaution3() {
		return caution3;
	}
	public void setCaution3(String caution3) {
		this.caution3 = caution3;
	}
	public String getCaution4() {
		return caution4;
	}
	public void setCaution4(String caution4) {
		this.caution4 = caution4;
	}
	public double getTourLat() {
		return tourLat;
	}
	public void setTourLat(double tourLat) {
		this.tourLat = tourLat;
	}
	public double getTourLon() {
		return tourLon;
	}
	public void setTourLon(double tourLon) {
		this.tourLon = tourLon;
	}
	public TourPackageDto(String natName, String category1, String category2, String category3, String natIcon, String img,
			int parice, int userRating, int tourId, int natId, String tourTitle, String hash) {
		this.natName = natName;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.natIcon = natIcon;
		this.img = img;
		this.price = parice;
		this.userRating = userRating;
		this.tourId = tourId;
		this.natId = natId;
		this.tourTitle = tourTitle;
		this.hash = hash;
	}
	public TourPackageDto(String natName, String naticon, int natId) {
		this.natId = natId;
		this.natName = natName;
		this.natIcon = naticon;
	}
	public TourPackageDto(int tourId, int price, String title, String img, String hash) {
		this.tourId = tourId;
		this.price = price;
		this.tourTitle = title;
		this.img = img;
		this.hash = hash;
	}
	public TourPackageDto(String backgroundImg, String natName, String flag, String category1, String category2, String category3) {
		this.backgroundImg = backgroundImg;
		this.natName = natName;
		this.flag = flag;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
	}
	public TourPackageDto(int tourId, String firstHash, String img, int price) {
		this.tourId = tourId;
		this.hash = firstHash;
		this.img = img;
		this.price = price;
	}
	public TourPackageDto(int tourId, String firstHash, String img, String money) {
		this.tourId = tourId;
		this.hash = firstHash;
		this.img = img;
		this.money = money;
	}
	public TourPackageDto(int tourId, double userRating, int price, String title, String img) {
		this.tourId = tourId;
		this.userRating = userRating;
		this.price = price;
		this.tourTitle = title;
		this.img = img;
	}
	public TourPackageDto(int tourId, double userRating, String money, String title, String img) {
		this.tourId = tourId;
		this.userRating = userRating;
		this.money = money;
		this.tourTitle = title;
		this.img = img;
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
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getNatIcon() {
		return natIcon;
	}
	public void setNatIcon(String natIcon) {
		this.natIcon = natIcon;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getUserRating() {
		return userRating;
	}
	public void setUserRating(double userRating) {
		this.userRating = userRating;
	}
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}
	public int getNatId() {
		return natId;
	}
	public void setNatId(int natId) {
		this.natId = natId;
	}
	public String getTourTitle() {
		return tourTitle;
	}
	public void setTourTitle(String tourTitle) {
		this.tourTitle = tourTitle;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public String getBackgroundImg() {
		return backgroundImg;
	}
	public void setBackgroundImg(String backgroundImg) {
		this.backgroundImg = backgroundImg;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}

}