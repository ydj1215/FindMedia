<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
</head>

<body>

<%
	String findMemberID = null;
	String memberID = null;

	if(session.getAttribute("memberID") != null) {
		memberID = (String) session.getAttribute("memberID");
	}

	if(session.getAttribute("findMemberID") != null) {
		findMemberID = (String) session.getAttribute("findMemberID");
	}

%>	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="../index.jsp"><img src="../image/logo.JPG" width="200px" alt="FindMedia"/></a>
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
	
	<div class="container mt-3" style="max-width: 560px;">
			<img src="../image/pwfound.JPG" width="600px" alt="비밀번호 찾았습니다."/>
			<div style = "margin-top: 100px;
					width:600px; margin:0 auto;
					padding:50px 20px; text-align:
					center; border-radius: 15px;
					background: linear-gradient(to top, #E2E2E2 0%, #F0EDEC 50%, #FFFBF6 100%);
					margin: 100px 0px; ">
				<label>당신의 비밀번호는 ${findMemberPW } 입니다.</label> 
			</div>
		<br><br>
	</div>
	
	<div style="text-align: center;">
		<a class="navbar-brand" href="../find.jsp"><img src="../image/findid.JPG" width="600px" alt="비밀번호 찾기"/></a>
	</div>
	
	<br><br><br>
	
	<footer>
		<img src="image/wheel.JPG" width="100%" alt="FindMedia"/>
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
