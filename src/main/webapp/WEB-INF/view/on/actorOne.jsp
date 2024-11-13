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
			<h1>actorONe</h1>
			
			
			<!-- C : 만들어진 파일
			C : 1. 배우 상세 정보 
			1-1) actor 수정 - /on/modifyActor
			1-2) actor 삭제 - /on/removeActor (actor_file삭제 + film_actor삭제 + actor삭제)
			
			C : 2. 배우 파일 리스트
			C : 2-1) actor_file 추가 /on/addFilmActorFile 
			C : 2-2) actor_file 삭제 /on/removeFilmCategory
						
			C : 3. 필름 배우 리스트
			3-1) film_actor 추가 /on/addActorByFilm -> 배우 검색 후 선택
			3-2) film_actor 삭제 /on/removeFileActor
			
			 -->
			
			<!-- actor -->
			<h2>actor</h2>
				<table>
					<tr>
						<td>actorId</td>
						<td>${actor.actorId}</td>
					</tr>
					<tr>
						<td>firstName</td>
						<td>${actor.firstName}</td>
					</tr>
					<tr>
						<td>lastName</td>
						<td>${actor.lastName}</td>
					</tr>
					<tr>
						<td>lastUpdate</td>
						<td>${actor.lastUpdate}</td>
					</tr>
				</table>
			<div>
				<a href="${pageContext.request.contextPath}/on/modifyActor?actorId=${actor.actorId}">
					actor 수정
				</a>
				&nbsp;
				<a href="${pageContext.request.contextPath}/on/removeActor?actorId=${actor.actorId}">
					actor 삭제
				</a>
			</div>
				
			<!-- actor file -->
				<h2>actor file</h2>
				<table class="table">
					<tr>
						<td>image</td>
						<td>type</td>
						<td>size</td>
						<td>createDate</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="af" items="${actorFileList}">
						<td>
							<img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}" alt="배우 이미지">
						</td>
						<td>${af.type}</td>
						<td>${af.size} Byte</td>
						<td>${af.createDate}</td>
						<td><a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}" class="btn btn-warning">삭제</a></td>
					</c:forEach>
				</table>
				
				<div><a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-success">이미지파일 추가</a></div>
			<!-- film -->
			<div>
				<h2>출연 작품</h2>
				
				
				<div>
				<!-- 출연자 추가 -->
					<form id="formSearchFilm" method="get" action="${pageContext.request.contextPath}/on/actorOne"><!-- 영화 검색 -->
						<!-- 필름 검색시 필요한 -->
							<input type="hidden" name="actorId" value="${actor.actorId}">
							<input type="text" name="searchTitle" >
							<button id="btnSearchFilm" type="button">FILM 검색</button>
					</form>
					
					<form id="formAddFilm" method="post" action="${pageContext.request.contextPath}/on/addFilmByActor">
						<input type="hidden" name="actorId" value="${actor.actorId}">
						<select size="5" id="filmId" name="filmId">
								<c:forEach var="sf" items="${searchFilmList}">
									<option value="${sf.filmId}">${sf.title}</option>
								</c:forEach>
						</select>
						<button id="btnAddFilm" type="button">FILM 추가</button>
					</form>
				</div>

				<c:forEach var="f" items="${filmList}">
					<div>
						<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}" class="btn">${f.title}</a>&nbsp;
						
						&nbsp;
						<a href="${pageContext.request.contextPath}/on/removeFilmActorByActor?filmId=${f.filmId}&actorId=${actor.actorId}" class="btn">FILM_ACTOR에서 삭제</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#btnSearchFilm').click(function(){
		$('#formSearchFilm').submit();
	});
	$('#btnAddFilm').click(function(){
		$('#formAddFilm').submit();
	});
</script>
</html>