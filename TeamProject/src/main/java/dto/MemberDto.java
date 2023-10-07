package dto;


public class MemberDto {
	private int idx;
	private String name;
	private String email;
	private String nickname;
	private String pw;
	public MemberDto(int idx, String name, String email, String nickname, String pw) {
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.nickname = nickname;
		this.pw = pw;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
}
