package artwork;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

public class ArtworkDAO {

	private Connection conn;
	private ResultSet rs;
	public ArtworkDAO() {

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

	public int write(ArtworkDTO ArtworkDTO) {
		PreparedStatement pstmt = null;
		
		try {
			String SQL = "INSERT INTO artwork VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, 0);";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ArtworkDTO.getMemberID());
			pstmt.setString(2, ArtworkDTO.getTitle());
			pstmt.setString(3, ArtworkDTO.getAuthor());
			pstmt.setInt(4, ArtworkDTO.getYear());
			pstmt.setString(5, ArtworkDTO.getKind());
			pstmt.setString(6, ArtworkDTO.getContent());
			pstmt.setString(7, ArtworkDTO.getScore());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
	}

	public ArrayList<ArtworkDTO> getList(String kind, String searchType, String search, int pageNumber) {

		if (kind.equals("전체")) {
			kind = "";
		}

		ArrayList<ArtworkDTO> list = null;
		PreparedStatement pstmt = null;
		String SQL = "";

		try {
			if (searchType.equals("최신순")) {
				SQL = "SELECT * FROM artwork WHERE kind LIKE ? AND CONCAT(title, author, title, content) LIKE ? ORDER BY artworkID DESC LIMIT "
						+ pageNumber * 5 + ", " + pageNumber * 5 + 6;
				
			} else if (searchType.equals("추천순")) {
				SQL = "SELECT * FROM artwork WHERE kind LIKE ? AND CONCAT(title, author, title, content) LIKE ? ORDER BY likeCount DESC LIMIT "
						+ pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}

			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, "%" + kind + "%");
			pstmt.setString(2, "%" + search + "%");

			rs = pstmt.executeQuery();

			list = new ArrayList<ArtworkDTO>();

			while (rs.next()) 
			{
				ArtworkDTO a = new ArtworkDTO(

						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9)
				);

				list.add(a);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	public int like(String artworkID) {
		PreparedStatement pstmt = null;
		try {
			String SQL = "UPDATE artwork SET likeCount = likeCount + 1 WHERE artworkID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(artworkID));
			return pstmt.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				
				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;

	}

	public int delete(String artworkID) {

		PreparedStatement pstmt = null;
		try {
			String SQL = "DELETE FROM artwork WHERE artworkID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(artworkID));
			return pstmt.executeUpdate();
		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public String getMemberID(String artworkID) {

		PreparedStatement pstmt = null;
		try {
			String SQL = "SELECT memberID FROM artwork WHERE artworkID = ?";
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(artworkID));
			rs = pstmt.executeQuery();

			while (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}