package dto;

public class HrDto {
	private int hno;
	private String title;
	private String review;
	private String hrDate;
	private int idx;
	private int hotelId;
	private int visitCount;
	private String nickName;
	private String hotelImg;
	private String hotelName;
	private int hrno;
	private String hrComment;
	private String hrcDate;
	
	public HrDto(int hno, String hrDate, String hotelName, String title, String nickName, String hotelImg) {
		this.hno = hno;
		this.hrDate = hrDate;
		this.hotelName = hotelName;
		this.title = title;
		this.nickName = nickName;
		this.hotelImg = hotelImg;
	}
	
	public HrDto(String hotelName, String title, String nickName, String hrDate, String review) {
		this.hotelName = hotelName;
		this.title = title;
		this.nickName = nickName;
		this.hrDate = hrDate;
		this.review = review;
	}
	
	public HrDto(int hrno, String nickName, String hrComment, String hrcDate) {
		this.hrno = hrno;
		this.nickName = nickName;
		this.hrComment = hrComment;
		this.hrcDate = hrcDate;
	}
	public HrDto() {
		
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	public int getVisitcount() {
		return visitCount;
	}
	public void setVisitcount(int visitCount) {
		this.visitCount = visitCount;
	}
	
	public String getHrDate() {
		return hrDate;
	}
	public void setHrDate(String hrDate) {
		this.hrDate = hrDate;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHotelImg() {
		return hotelImg;
	}
	public void setHotelImg(String hotelImg) {
		this.hotelImg = hotelImg;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public int getHrno() {
		return hrno;
	}

	public void setHrno(int hrno) {
		this.hrno = hrno;
	}

	public String getHrComment() {
		return hrComment;
	}

	public void setHrComment(String hrComment) {
		this.hrComment = hrComment;
	}

	public String getHrcDate() {
		return hrcDate;
	}

	public void setHrcDate(String hrcDate) {
		this.hrcDate = hrcDate;
	}
	
	
}