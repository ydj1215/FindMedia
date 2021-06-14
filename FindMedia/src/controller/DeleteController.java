package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artwork.ArtworkDAO;

public class DeleteController implements Controller {

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

		ArtworkDAO dao = new ArtworkDAO();

		if(memberID.equals(dao.getMemberID(artworkID))) {
			
			int result = new ArtworkDAO().delete(artworkID);

			if (result == 1) {

				session.setAttribute("memberID", memberID);
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제가 완료되었습니다.');");
				script.println("location.href='index.jsp'");
				script.println("</script>");
				script.close();

				return;

			} else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제 과정에서 오류가 발생했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();

				return;
			}

		} else {
			
			request.setCharacterEncoding("UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('작성자만이 삭제할 수 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();

			return;
		}
	}
}
