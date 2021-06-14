package like;

public class LikeDTO {

	String memberID;
	int artworkID;
	String memberIP;

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public int getArtworkID() {
		return artworkID;
	}

	public void setArtworkID(int artworkID) {
		this.artworkID = artworkID;
	}

	public String getMemberIP() {
		return memberIP;
	}

	public void setMemberIP(String memberIP) {
		this.memberIP = memberIP;
	}

	public LikeDTO(String memberID, int artworkID, String memberIP) {

		this.memberID = memberID;
		this.artworkID = artworkID;
		this.memberIP = memberIP;
	}
}
