package dto;

import java.sql.Date;


public class MyPlanDto {
	private int pnum;
	private int pcnt;
	private int idx;
	private Date pdate;
	private Date pstart;
	private Date pend;
	private String name;
	
	public MyPlanDto(int pnum, int pcnt, int idx, Date pdate, Date pstart, Date pend, String name) {
		this.pnum = pnum;
		this.pcnt = pcnt;
		this.idx = idx;
		this.pdate = pdate;
		this.pstart = pstart;
		this.pend = pend;
		this.name = name;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Date getPstart() {
		return pstart;
	}
	public void setPstart(Date pstart) {
		this.pstart = pstart;
	}
	public Date getPend() {
		return pend;
	}
	public void setPend(Date pend) {
		this.pend = pend;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
