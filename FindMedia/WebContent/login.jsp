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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">FindMedia</a>
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
						<a class="dropdown-item" href="login.jsp">로그인</a> <a
							class="dropdown-item" href="join.jsp">회원가입</a> <a
							class="dropdown-item" href="logOut.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container mt-3" style="max-width: 560px;">
		<form method="post" action="login.do">
			<div class="form-group">
				<label>아이디</label> <input type="text" name="id" class="form-control">
			</div>
			
			<div class="form-group">
				<label>비밀번호</label> <input type="password" name="password" class="form-control">
			</div>
			
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright (c)YDJ FindMedia ALL Rights reserved.<br>TEL.010-7637-0520
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
