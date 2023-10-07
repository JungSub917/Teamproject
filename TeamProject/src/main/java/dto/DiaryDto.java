package dto;

import java.sql.Date;

public class DiaryDto {
	private int dno;	//
	private String title;	//
	private String mainImg;	//
	private String content;	//
	private int idx;	//
	private Date diaryDate;	//
	private int viewCnt;	//
	private String nickName;	
	private int likeCnt;
	private int cmtCnt;
	public DiaryDto(int dno, String title, String mainImg, String content, int idx, Date diaryDate, int viewCnt) {
		this.dno = dno;
		this.title = title;
		this.mainImg = mainImg;
		this.content = content;
		this.idx = idx;
		this.diaryDate = diaryDate;
		this.viewCnt = viewCnt;
	}
	public DiaryDto(int dno, int idx, String nickName, String title, String content,Date diaryDate, int cmtCnt, int likeCnt, int viewCnt) {
		this.dno=dno;
		this.idx=idx;
		this.nickName=nickName;
		this.title=title;
		this.content=content;
		this.diaryDate=diaryDate;
		this.cmtCnt=cmtCnt;
		this.likeCnt=likeCnt;
		this.viewCnt=viewCnt;
	}
	public DiaryDto(int dno, String title, String img) {
		this.dno=dno;
		this.title=title;
		this.mainImg = img;
	}
	public DiaryDto() {
	}
	public int getCmtCnt() {
		return cmtCnt;
	}
	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getDiaryDate() {
		return diaryDate;
	}
	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
}
