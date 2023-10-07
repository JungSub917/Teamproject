package dto;

public class NoticeDto {
	private int nno;
	private String title;
	private String content;
	private String noticedate;
	
	public NoticeDto(int nno, String title, String content, String noticedate) {
		this.nno = nno;
		this.title = title;
		this.content = content;
		this.noticedate = noticedate;
	};

	public int getNno() {
		return nno;
	};

	public void setNno(int nno) {
		this.nno = nno;
	};

	public String getTitle() {
		return title;
	};

	public void setTitle(String title) {
		this.title = title;
	};

	public String getContent() {
		return content;
	};

	public void setContent(String content) {
		this.content = content;
	};

	public String getNoticedate() {
		return noticedate;
	};

	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	};
}