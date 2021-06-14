package like;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;

public class LikeDAO {

	private Connection conn;
	public LikeDAO() {

		try {
			String dbURL = "jdbc:mysql://localhost:3306/findmedia";
			String dbID = "root";
			String dbPassword = "woehddb5555!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace();

		}
	}

	public int like(String memberID, String artworkID, String memberIP) {

		String SQL = "INSERT INTO likey VALUES (?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID);
			pstmt.setString(2, artworkID);
			pstmt.setString(3, memberIP);
			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}
		return -1; //이미 추천
	}
}
