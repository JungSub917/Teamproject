package dto;

public class FandaDto {
	int fno;
	String fa;
	String fq;
	
	public FandaDto(int fno, String fa, String fq) {
		this.fno = fno;
		this.fa = fa;
		this.fq = fq;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFa() {
		return fa;
	}
	public void setFa(String fa) {
		this.fa = fa;
	}
	public String getFq() {
		return fq;
	}
	public void setFq(String fq) {
		this.fq = fq;
	}
	
}