package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class FrontController extends HttpServlet {
	HashMap<String, Controller> map = null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		map = new HashMap<String, Controller>();
		map.put("/join.do", new JoinController());
		map.put("/login.do", new LoginController());
		map.put("/write.do", new WriteController());
		map.put("/delete.do", new DeleteController());
		map.put("/like.do", new LikeController());
		map.put("/findID.do", new FindIDController());
		map.put("/findPW.do", new FindPWController());
		map.put("/deleteMember.do", new DeleteMemberController());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String contextP = req.getContextPath();
		String url = req.getRequestURI();
		String path = url.substring(contextP.length());
		Controller subController = map.get(path);
		subController.execute(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
