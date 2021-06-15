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
	request.setCharacterEncoding("UTF-8");

	String memberID = null;
	if(session.getAttribute("memberID") != null) {
		memberID = (String) session.getAttribute("memberID");
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
					href="../index.jsp">HOME</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> MEMBERSHIP </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
					<%
					if(memberID == null) {
					%>
						<a class="dropdown-item" href="../login.jsp">로그인</a>
						<a class="dropdown-item" href="../join.jsp">회원가입</a>
					<%
					} else {
					%>
							<a class="dropdown-item" href="../logOut.jsp">로그아웃</a>
							<a class="dropdown-item" href="../deleteMember.jsp">회원탈퇴</a>
					<%
					}
					%>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container mt-3" style="max-width: 560px;">
			<img src="../image/idfound.JPG" width="600px" alt="We found yout ID!"/>
			<div style = "margin-top: 100px;
					width:600px; margin:0 auto;
					padding:50px 20px; text-align:
					center; border-radius: 15px;
					background: linear-gradient(to top, #E2E2E2 0%, #F0EDEC 50%, #FFFBF6 100%);
					margin: 10px 0px; ">
					<% 
						String findMemberID = null;
						findMemberID = (String)session.getAttribute("findMemberID");
						if(findMemberID == null){%>
							<label>관련정보가 존재하지 않습니다.</label>
						<%}else{ %>
							<label>당신의 아이디는 ${findMemberID } 입니다.</label> 
					<%		} %>
			</div>
			<div style = "margin-top: 100px;
					width:600px; margin:0 auto;
					padding:20px 10px 10px; text-align:
					center; border-radius: 15px;
					background: linear-gradient(to top, #ED213A 0%, #ED213A 50%, #93291E 100%);
					margin: 0px 0px;
					cursor:pointer;"
					onclick="location.href='../login.jsp';">
					<label style = "color: white;">바로 로그인하러 가기</label>
			</div>
		<br><br>
	</div>
	
	<div style="text-align: center;">
		<a class="navbar-brand" href="../find.jsp"><img src="../image/findpassword.JPG" width="600px" alt="비밀번호 찾기"/></a>
	</div>
	
	<br><br><br>
	
	<footer>
		<img src="../image/wheel.JPG" width="100%" alt="Copyright (c) FindMedia ALL Rights reserved."/>
	</footer>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
