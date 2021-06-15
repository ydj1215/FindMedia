package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDTO;
import service.MemberService;

public class FindPWController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		MemberDTO MDTO = new MemberDTO(id,email);
		
		MemberService s = MemberService.getInstance();
		String result = s.findPW(MDTO);
		
		session.setAttribute("findMemberPW", result);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='result/findPWResult.jsp'");
		script.println("</script>");
		script.close();
	}

}
