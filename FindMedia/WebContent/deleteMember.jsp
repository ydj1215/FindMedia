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

	if(memberID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('먼저 로그인을 해주세요.');");
		script.println("location.href = 'login.jsp'");
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
							<a class="dropdown-item" href="deleteMember.jsp">회원탈퇴</a>
					<%
					}
					%>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	
	<div style="text-align: center;">
		<img src="image/withdrawal.JPG" width="600" alt="회원탈퇴"/>
	</div>
	<div class="container mt-3" style="max-width: 560px;">
		<form method="post" action="deleteMember.do">
			<div class="form-group">
				<input type="text" name="id" class="form-control" placeholder="당신의 아이디를 입력해주세요.">
			</div>

			<div class="form-group">
				<input type="password" name="password" class="form-control" placeholder="당신의 비밀번호를 입력해주세요.">
			</div>
			
			<div class="form-group">
				<input type="text" name="nickname" class="form-control" placeholder="가입했을때 입력하신 별명을 입력해주세요.">
			</div>

			<div class="form-group">
				<input type="text" name="email" class="form-control" placeholder="입했을때 입력하신 이메일을 입력해주세요.">
			</div>

			<div class="form-group">
				<input type="text" name="name" class="form-control" placeholder="당신의 이름을 입력해주세요.">
			</div>
			
			<div style="text-align: center;">
				<input type="submit" class="btn btn-danger" value = "회원 탈퇴"/>
			</div>
		</form>
	</div>
	
	<div style="text-align: center;">
		<img src="image/goodbye.JPG" width="600" alt="회원 탈퇴 전에 다시 더 한번 생각해보세요."/>
	</div>
	
	<footer>
		<img src="image/wheel.JPG" width="100%" alt="Copyright (c) FindMedia ALL Rights reserved."/>
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
