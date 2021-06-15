<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="artwork.ArtworkDAO"%>
<%@ page import="artwork.ArtworkDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>

<!doctype html>
<html>
<head>
<title>FindMedia</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String kind = "전체";
		String searchType = "최신순";
		String search = "";
		int pageNumber = 0;
		
		if (request.getParameter("kind") != null) {
			kind = request.getParameter("kind");
		}
	
		if (request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
	
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
	
		if (request.getParameter("pageNumber") != null) {
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
				System.out.println("페이지 번호를 입력하는 와중에 오류가 발생했습니다.");
			}
		}
		
		String memberID = null;
		if(session.getAttribute("memberID") != null) {
			memberID = (String) session.getAttribute("memberID");
		}
		
		application.getContextPath();
		request.getSession().getServletContext().getRealPath("/");
		application.getRealPath("/image"); 
	%>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><img src="image/logo.JPG" width="200px" alt="FindMedia"/></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">HOME</a>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown"data-toggle="dropdown">MEMBERSHIP</a>
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

	<div class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="kind" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="영화" <%if (kind.equals("영화")) out.println("selected"); %>>영화</option>
				<option value="애니메이션" <%if (kind.equals("애니메이션")) out.println("selected"); %>>애니메이션</option>
				<option value="도서" <%if (kind.equals("도서")) out.println("selected"); %>>도서</option>
				<option value="음악" <%if (kind.equals("음악")) out.println("selected"); %>>음악</option>
				<option value="음악" <%if (kind.equals("드라마")) out.println("selected"); %>>드라마</option>
				<option value="음악" <%if (kind.equals("뮤지컬")) out.println("selected"); %>>뮤지컬</option>
				<option value="음악" <%if (kind.equals("게임")) out.println("selected"); %>>게임</option>
				<option value="음악" <%if (kind.equals("기타")) out.println("selected"); %>>기타</option>
			</select>
			
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="추천순" <%if (searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
			</select>
			
			<input type="text" name="search" class="form-control mx-1 mt-2" value="<%=search%>" placeholder="내용을 입력하세요." style="width:40%;"/>
			<button type="submit" class="btn btn-danger mx-1 mt-2">검색</button>
			
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#registerModal">등록</a>
		</form>
		
		<%
			ArrayList<ArtworkDTO>ArtworkList = new ArrayList<ArtworkDTO>();
			ArtworkList = new ArtworkDAO().getList(kind, searchType, search, pageNumber);

			if (ArtworkList != null)
				for (int i = 0; i < ArtworkList.size(); i++) {
					if (i == 5) break;
					ArtworkDTO ADto= ArtworkList.get(i);
		%>

		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
					<%=ADto.getTitle()%>&nbsp;
					<small><%=ADto.getAuthor()%></small>
					</div>
					<div class="col-4 text-right">
						<span style="color: #212529;">(추천:</span>
						<span style="color: #212529;"><%=ADto.getLikeCount()%></span>
						<span style="color: #212529;">, 작성자: <%=ADto.getMemberID()%>)</span>
					</div>
				</div>
			</div>

			<div class="card-body">
				<h5 class="card-title">
					<small>(<%=ADto.getYear()%>년
						<%=ADto.getKind()%>)
					</small>
				</h5>

				<p class="card-text"><%=ADto.getContent()%></p>
				<div class="row">
					<div class="col-9 text-left">
					평점 <span style="color: #dc3545;"><%=ADto.getScore()%></span>
					</div>

					<div class="col-3 text-right">
						<a style="color: #dc3545;" onclick="return confirm('추천하시겠습니까?')" href="like.do?artworkID=<%=ADto.getArtworkID()%>">
						추천
						</a>
						<a style="color: #212529;" onclick="return confirm('삭제하시겠습니까?')" href="delete.do?artworkID=<%=ADto.getArtworkID()%>">
						삭제
						</a>
					</div>
				</div>
			</div>
		</div>

		<%
			}
		%>
		
	</div>

	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
			<%
				if (pageNumber <= 0) {
				%> <a class="page-link disabled">이전</a> <%
 				} else {
 				%> <a class="page-link" href="./index.jsp?kind=<%=URLEncoder.encode(kind, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber - 1 %>">이전</a>
				<%
					}
			%>
		</li>

		<li class="page-item">
			<%
				if (ArtworkList.size() < 6) {
				%> <a class="page-link disabled">다음</a> <%
 				} else {
 				%> <a class="page-link" href="./index.jsp?kind=<%=URLEncoder.encode(kind, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber + 1%>">다음</a>
				<%
				}
			%>
		</li>

	</ul>

	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">작품 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form action="write.do" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>작품 제목</label> <input type="text" name="title" class="form-control" maxlength="20">
							</div>

							<div class="form-group col-sm-6">
								<label>원작자</label> <input type="text" name="author" class="form-control" maxlength="20">
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>제작 연도</label>
								<select name="year" class="form-control">
									<option value="2011">제작 연도</option>
										<%for(int j = 1900; j<=2021; j++){ %>
										<option value ="<%=j %>"><%=j+"년" %>
									</option>
										<%} %>
								</select>
							</div>

							<div class="form-group col-sm-4">
								<label>분류</label> <select name="kind" class="form-control">
									<option value="영화" selected>영화</option>
									<option value="애니메이션">애니메이션</option>
									<option value="도서">도서</option>
									<option value="음악">음악</option>
									<option value="드라마">드라마</option>
									<option value="뮤지컬">뮤지컬</option>
									<option value="게임">게임</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label>내용</label>
							<textarea name="content" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>

						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>평점</label>
								<select name="score" class="form-control">
									<option value="★★★★★" selected>★★★★★</option>
									<option value="★★★★☆">★★★★</option>
									<option value="★★★☆☆">★★★</option>
									<option value="★★☆☆☆">★★</option>
									<option value="★☆☆☆☆">★</option>
								</select>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">작성 취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<footer>
		<img src="image/wheel.JPG" width="100%" alt="Copyright (c) FindMedia ALL Rights reserved."/>
	</footer>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>