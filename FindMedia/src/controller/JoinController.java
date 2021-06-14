package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import member.MemberDTO;

public class JoinController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		MemberDTO MemberDTO = new MemberDTO(id,password,nickname,email,name);
		
		MemberService s = MemberService.getInstance();
		s.join(MemberDTO); 
		
		HttpUtil.forward(request, response, "/index.jsp");
	}
}
