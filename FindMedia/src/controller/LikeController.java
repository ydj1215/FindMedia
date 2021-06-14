package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artwork.ArtworkDAO;
import like.LikeDAO;

public class LikeController implements Controller {

	public static String getClientIP(HttpServletRequest request) {
		
	    String ip = request.getHeader("X-FORWARDED-FOR"); 
	    if (ip == null || ip.length() == 0) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }

	    if (ip == null || ip.length() == 0) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }

	    if (ip == null || ip.length() == 0) {
	        ip = request.getRemoteAddr() ;
	    }
	    return ip;
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String memberID = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("memberID") != null) {
			memberID = (String) session.getAttribute("memberID");
		}

		if(memberID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			script.close();

			return;
		}

		String artworkID = null;
		
		if(request.getParameter("artworkID") != null) {
			artworkID = (String) request.getParameter("artworkID");
		}

		ArtworkDAO ADAO = new ArtworkDAO();
		LikeDAO likeyDAO = new LikeDAO();

		int result = likeyDAO.like(memberID, artworkID, getClientIP(request));

		if (result == 1) {
			result = ADAO.like(artworkID);
			if (result == 1) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추천이 완료되었습니다.');");
		script.println("location.href='./index.jsp'");
		script.println("</script>");
		script.close();

		return;
			} else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('추천 과정에서 오류가 발생했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();

		return;

			}

		} else {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 추천을 하였습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();

			return;
		}
	}
}
