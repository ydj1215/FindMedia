package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDTO;
import service.MemberService;

public class DeleteMemberController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
	
		String id = null;
		String password = null;
		String nickname = null;
		String email = null;
		String name = null;
			
		if(request.getParameter("id") != null) {
			id = (String) request.getParameter("id");
		}

		if(request.getParameter("password") != null) {
			password = (String) request.getParameter("password");
		}

		if(request.getParameter("nickname") != null) {
			nickname = (String) request.getParameter("nickname");
		}

		if(request.getParameter("email") != null) {
			email = (String) request.getParameter("email");
		}
		
		if(request.getParameter("name") != null) {
			name = (String) request.getParameter("name");
		}

		if (id == null || password == null || nickname == null || email == null || name == null ||
				id == "" || password == "" || nickname == "" || email == "" || name == ""){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			
		} else {
	
			MemberService s = MemberService.getInstance();
			
			String resultPassword = s.checkPassword(id);
			String resultNickname= s.checkNickname(id);
			String resultEmail = s.checkEmail(id);
			String resultName = s.checkName(id);
			
			if (resultPassword.equals(password) && resultNickname.equals(nickname) && resultEmail.equals(email) && resultName.equals(name)) {
				
				MemberDTO MemberDTO = new MemberDTO(id,password,nickname,email,name);
				s.deleteMember(MemberDTO);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 탈퇴에 성공하였습니다.');");
				session.invalidate();
				script.println("location.href='index.jsp'");
				script.println("</script>");
				script.close();

			} else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 탈퇴에 실패하셨습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			}
		}
	}
}
