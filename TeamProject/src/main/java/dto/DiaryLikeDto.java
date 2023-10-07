package dto;

public class DiaryLikeDto {
	private int idx;
	private int dno;
DiaryLikeDto(int idx, int dno){
	this.idx=idx;
	this.dno=dno;
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

}
