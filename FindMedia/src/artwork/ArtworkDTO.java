package artwork;



public class ArtworkDTO {

	int artworkID;
	String memberID;
	String title;
	String author;
	int year;
	String kind;
	String content;
	String score;
	int likeCount;
	
	public int getArtworkID() {
		return artworkID;
	}
	
	public void setArtworkID(int artworkID) {
		this.artworkID = artworkID;
	}
	
	public String getMemberID() {
		return memberID;
	}
	
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public int getYear() {
		return year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getScore() {
		return score;
	}
	
	public void setTotalScore(String totalScore) {
		this.score = totalScore;
	}
	
	public int getLikeCount() {
		return likeCount;
	}
	
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public ArtworkDTO(int artworkID, String memberID, String title, String author, int year, String kind, String content, String score, int likeCount) {

		super();
		
		this.artworkID = artworkID;
		this.memberID = memberID;
		this.title = title;
		this.author = author;
		this.year = year;
		this.kind = kind;
		this.content = content;
		this.score = score;
		this.likeCount = likeCount;
	}
}