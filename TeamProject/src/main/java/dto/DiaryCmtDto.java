package dto;

import java.sql.Date;

public class DiaryCmtDto {
	private int cno;
	private int idx;
	private int dno;
	private Date date;
	private String cmt;
	private String nick;
	
	public DiaryCmtDto(int cno, int idx, String nick,int dno, Date date, String cmt) {
		this.cno = cno;
		this.idx = idx;
		this.nick = nick;
		this.dno = dno;
		this.date = date;
		this.cmt = cmt;
	}
	public DiaryCmtDto(){
		
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick=nick;
	}
	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCmt() {
		return cmt;
	}

	public void setCmt(String cmt) {
		this.cmt = cmt;
	}

}
