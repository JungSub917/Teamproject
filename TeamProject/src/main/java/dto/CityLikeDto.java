package dto;

public class CityLikeDto {
	private int idx;
	private int cityid;
	
	public CityLikeDto(int idx, int cityid) {
		this.idx = idx;
		this.cityid = cityid;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCityid() {
		return cityid;
	}

	public void setCityid(int cityid) {
		this.cityid = cityid;
	}
}
