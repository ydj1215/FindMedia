<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		PrintWriter script = response.getWriter();
		session.invalidate();
		script.println("<script>");
		script.println("alert('로그아웃이 완료되었습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	%>
</body>
</html>