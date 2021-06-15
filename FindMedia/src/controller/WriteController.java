package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artwork.ArtworkDAO;
import artwork.ArtworkDTO;

public class WriteController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();

		String memberID = null;

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

		String title = null;
		String author = null;
		int year = 0;
		String kind = null;
		String content = null;
		String score = null;

		if(request.getParameter("title") != null) {
			title = (String) request.getParameter("title");
		}

		if(request.getParameter("author") != null) {
			author = (String) request.getParameter("author");
		}

		if(request.getParameter("year") != null) {
			try {
				
				year = Integer.parseInt(request.getParameter("year"));
				
			} catch (Exception e) {

				System.out.println("제작 연도를 입력하는 와중에 오류가 발생했습니다.");
			}
		}

		if(request.getParameter("kind") != null) {
			kind = (String) request.getParameter("kind");
		}

		if(request.getParameter("content") != null) {
			content = (String) request.getParameter("content");
		}

		if(request.getParameter("score") != null) {
			score = (String) request.getParameter("score");
		}
		
		if (title == null || author == null || year == 0 || kind == null || content == null || score == null  ||
				title == "" || author == "" || kind == "" || content == "" || score == "") {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈 곳이 존재합니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();

			return;

		} else {

			ArtworkDAO dao = new ArtworkDAO();
			int result = dao.write(new ArtworkDTO(0, memberID, title, author, year, kind, content, score, 0));
			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('등록에 실패했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();

				return;

			} else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp';");
				script.println("</script>");
				script.close();
				return;
			}
		}
	}
}
