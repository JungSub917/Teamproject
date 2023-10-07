package dto;

public class QandaDto {
	private int idx;
	private int qno;
	private String title;    // 문의 제목 
	private String category; // 문의 카테고리
	private String content;  // 문의 내용
	private String qDate;    // 문의 시간
	private String aDate;    // 답변 시간
	private String status;   // 답변 여부
	private String comment; // 답변 내용
	public QandaDto(int idx, int qno, String category, String title, String content,String status, String qDate) {
		this.idx = idx;
		this.qno = qno;
		this.category = category;
		this.title = title;
		this.status = status;
		this.content = content;
		this.qDate = qDate;
	}
	public QandaDto(int idx, int qno, String title, String category, String content, String qDate, String aDate,
			String status, String comment) {
		this.idx = idx;
		this.qno = qno;
		this.title = title;
		this.category = category;
		this.content = content;
		this.qDate = qDate;
		this.aDate = aDate;
		this.status = status;
		this.comment = comment;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}