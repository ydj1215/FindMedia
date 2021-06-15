<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>

<body>

<%
	request.setCharacterEncoding("UTF-8");
	String memberID = null;

	if(session.getAttribute("memberID") != null) {
		memberID = (String) session.getAttribute("memberID");
	}

%>	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><img src="image/logo.JPG" width="200px" alt="FindMedia"/></a>
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
	
	<div class="container mt-3" style="max-width: 560px;">
		<img src="image/wannafindid.JPG" width="300px" alt="FINDID"/>
		<form method="post" action="findID.do">
			<div class="form-group">
				<input type="text" name="email" class="form-control" placeholder="이메일을 입력해주세요."/>
			</div>
			<button type="submit" class="btn btn-danger">아이디 찾기</button>
		</form>
		
		<br><br>
		
		<img src="image/wannafindpw.JPG" width="300px" alt="FINDPW"/>
		<form method="post" action="findPW.do">
		<div class="form-group">
				<input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요."/>
			</div>
			<div class="form-group">
				<input type="text" name="email" class="form-control" placeholder="이메일을 입력해주세요."/>
			</div>
			<button type="submit" class="btn btn-danger">비밀번호 찾기</button>
		</form>
	</div>
	
	<br><br><br>
	
	<footer>
		<img src="image/wheel.JPG" width="100%" alt="Copyright (c) FindMedia ALL Rights reserved."/>
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
