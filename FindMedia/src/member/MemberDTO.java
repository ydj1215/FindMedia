package member;

public class MemberDTO {
	
	private String id;
	private String password;
	private String nickname;
	private String email;
	private String name;
	
	public MemberDTO() {} 
	
	public MemberDTO(String tid, String tPassword, String tNickname, String tEmail, String tName)
	{
		this.id=tid;
		this.password=tPassword;
		this.nickname = tNickname;
		this.email = tEmail;
		this.name = tName;
	}
	
	public MemberDTO(String tid, String tEmail)
	{
		this.id=tid;
		this.email = tEmail;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
