package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.MemberDAO;

public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return dao;
	}

	public Connection connect() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/findmedia", "root", "woehddb5555!");
		} catch (Exception e) {
			System.out.println("MDAO:connect" + e);
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println("Pstmt close error" + e);
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("Conn close error" + e);
			}
		}
	}

	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println("rs close error" + e);
			}
		}
	}

	public int join(MemberDTO MemberDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?);");
			pstmt.setString(1, MemberDTO.getId());
			pstmt.setString(2, MemberDTO.getPassword());
			pstmt.setString(3, MemberDTO.getNickname());
			pstmt.setString(4, MemberDTO.getEmail());
			pstmt.setString(5, MemberDTO.getName());
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public boolean login(String id, String password) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member where id = ? and password = ?;");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next())
			{
				result = true;
				
				
			} else
			{
				result = false;
			}
		} catch (Exception e) {
			
			System.out.println("login error!" + e);
			
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	
	public String findID(String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select id from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
		 if(rs.next())
		{
			id = rs.getString(1);
		}
	}
		catch(Exception e)
		{
			System.out.println("findID error!" +e);
		}
		finally
		{
			close(conn,pstmt,rs);
		}
	
		return id;
	}
	
	public String findPW(MemberDTO MDTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String password = null;
		
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select password from member where id = ? and email = ?");
			pstmt.setString(1, MDTO.getId());
			pstmt.setString(2, MDTO.getEmail());
			rs = pstmt.executeQuery();
		 if(rs.next())
		{
			password = rs.getString(1);
		}
	}
		catch(Exception e)
		{
			System.out.println("findPW error!" +e);
		}
		finally
		{
			close(conn,pstmt,rs);
		}
	
		return password;
	}
}

