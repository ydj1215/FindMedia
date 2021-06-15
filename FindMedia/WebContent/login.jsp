<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>

<body>

<%
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
	}
	
	application.getContextPath();
	request.getSession().getServletContext().getRealPath("/");
	application.getRealPath("/image"); 
%>	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="find.jsp"><img src="image/logo.JPG" width="200" alt="FindMedia"/></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">HOME</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> MEMBERSHIP </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
					<%
					if(memberID == null) {
					%>
						<a class="dropdown-item" href="login.jsp">로그인</a>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
					<%
					} else {
					%>
							<a class="dropdown-item" href="logOut.jsp">로그아웃</a>
					<%
					}
					%>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	
	<div style="text-align: center;">
		<img src="image/login.JPG" width="600" alt="login"/>
	</div>
	<div class="container mt-3" style="max-width: 560px;">
		<form method="post" action="login.do">
			<div class="form-group">
				<input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요."/>
			</div>
			<div class="form-group">
				<input type="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요."/>
			</div>
			
			<button type="submit" class="btn btn-danger">로그인</button>&nbsp;&nbsp;
		</form>
	</div>
	
	<div style="text-align: center;">
		<a class="navbar-brand" href="find.jsp"><img src="image/finder.JPG" width="600" alt="FindMedia"/></a>
	</div>
	
	<footer>
		<img src="image/wheel.JPG" width="100%" alt="FindMedia"/>
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
