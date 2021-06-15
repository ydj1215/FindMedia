package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;

public class LoginController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		String memberID = null;

		if(session.getAttribute("memberID") != null) {
			memberID = (String) session.getAttribute("memberID");
		}

		if(memberID != null) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있는 상태입니다.');");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();	
		}else {
		
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			MemberService s = MemberService.getInstance();
			boolean result = s.login(id,password);
			
			if(result)
			{
				session.setAttribute("memberID", id);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index.jsp'");
				script.println("</script>");
				script.close();
			}
			else
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인에 실패하셨습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
	
			}
		}
	}
}