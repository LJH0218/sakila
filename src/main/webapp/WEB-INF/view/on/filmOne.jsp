<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<style>
	* {background-color: #212529;}
	.row *{ padding-left: 0; padding-right: 0;  color:#fff; text-decoration: none;}
		.col-sm-2{padding: 0 2%; border-right: 1px solid #333;}
		.main-list{margin-top: 30%;}
	.list-group-item {border:1px solid #333; padding: 0; }
	.main-list a {display: block; padding: 5%; color:#666;}
	.main-list li a:hover{background-color: #333; transition:all 0.4s; color:#fff;}
</style>
<title>Insert title here</title>
</head>

<body class="container-flud">
	<div class="row">
		<div class="col-sm-2">
			<!-- 레프트메뉴 인클루드 -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10">
			<!-- 메인 컨텐츠 -->
			
			<!-- C : 완성 파일
			C : 1. 필름 상세 정보 
			1-1) film 수정 - /on/modifyFilm
			1-2) film 삭제 - /on/removeFilm (film_category삭제 + film_actor삭제 + film삭제)
			
			2. film_category 리스트
			2-1) film_category 추가 /on/addFilmCategory -> 카테고리 전체 목록에서 검색
			2-2) film_category 삭제 /on/removeFilmCategory
						
			C : 3. film_actor 리스트 
			3-1) film_actor 추가	/on/addFilmByActor -> 필름 검색 후 선택
			3-2) film_actor 삭제 /on/removeFilmActor 
			
			 -->
			
			<h1>FILM ONE</h1>
			<div>
				<c:forEach var="f" items="${filmList}">
					<table>
						<tr>
							<td>Title</td>
							<td>${f.title}</td>
						</tr>
						<tr>
							<td>Description</td>
							<td>${f.description}</td>
						</tr>
						<tr>
							<td>ReleaseYear</td>
							<td>${f.releaseYear}</td>
						</tr>
						<tr>
							<td>LanguageId</td>
							<td>${f.languageId}</td>
						</tr>
						<tr>
							<td>RentalDuration</td>
							<td>${f.rentalDuration}</td>
						</tr>
						<tr>
							<td>RentalRate</td>
							<td>${f.rentalRate}</td>
						</tr>
						<tr>
							<td>Length</td>
							<td>${f.length}</td>
						</tr>
						<tr>
							<td>ReplacementCost</td>
							<td>${f.replacementCost}</td>
						</tr>
						<tr>
							<td>Rating</td>
							<td>${f.rating}</td>
						</tr>
						<tr>
							<td>SpecialFeatures</td>
							<td>${f.specialFeatures}</td>
						</tr>
					</table>
				</c:forEach>
				<!-- 영화 수정 및 삭제 -->
				<div>
					<a href="">영화 수정</a>
					<a href="">영화 삭제</a>
				</div>
			</div>
			<div>
				<h2>작품에 출연한 배우들</h2>
				<div class="col-sm-8">
					<c:forEach var = "a" items="${actorList}">
					<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
						<table class="table">
							<tr>
								<td>${a.firstName} ${a.lastName}</td>
							</tr>
						</table>
						<%-- ${a.firstName} ${a.lastName} --%>
					</a>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>