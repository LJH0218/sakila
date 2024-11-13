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
			C : 1-1) film 수정 - /on/modifyFilm
			C : 1-2) film 삭제 - /on/removeFilm
			(inventory 렌탈 정보 확인 + film_category삭제 + film_actor삭제 + film삭제)
			
		 	C : 2.film_category 리스트
			C : 2-1) film_category 추가 /on/addFilmCategory -> 카테고리 전체 목록에서 검색
							-> 이슈 Category가 중복으로 늘어나면 프라이머리키 충돌 이슈가 있다
			C : 2-2) film_category 삭제 /on/removeFilmCategory
						
			C : 3. film_actor 리스트 
			C : 3-1) film_actor 추가	/on/addFilmByActor -> 필름 검색 후 선택
			3-2) film_actor 삭제 /on/removeFilmActor 
			
			4. inventory 정보
			
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
					<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}">영화 수정</a>
					<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}">영화 삭제</a>
					<span class="text-danger">${removeFilmMsg}</span>
				</div>			
			</div>		

			<br>
			<div>

				
			
	
				<h2>작품 장르_CATEGORY</h2>
				<form id="formFilmCategory" action="${pageContext.request.contextPath}/on/addFilmCategory" method="post">
					<input type="hidden" name="filmId" value="${film.filmId}"> <!-- input:hidden 으로 보이지않는 filmId값을 보내준다 -->
					<select name="categoryId" id="categoryId">
						<option value="">카테고리 선택</option>
						<!-- 모델 카테고리리스트 -->
						<c:forEach var="ac" items="${allCategoryList}">
							<option value="${ac.categoryId}">${ac.name}</option>
							
						</c:forEach>
					</select>
					<button id="btnFilmCategory" type="button">현재필름 카테고리 추가</button>
				</form>
				
				<div>
					<c:forEach var="fc" items="${filmCategoryList}">
						<div>
							${fc.name}
							&nbsp;
							<a href="${pageContext.request.contextPath}/on/removeFilmCategory?filmId=${fc.filmId}&categoryId=${fc.categoryId}">삭제</a>
						</div>
					</c:forEach>
				</div>
				
				<div class="col-sm-8">
				<h2>작품에 출연한 배우들</h2>
			<div>
				<form id="formSearchName" method="get" action="${pageContext.request.contextPath}/on/filmOne">
					<input type="hidden" name="filmId" value="${film.filmId}">
				
					<input type="text" name="searchName" id="searchName">
					<button id="btnSearchName" type="button">이름검색</button>
				</form>
				
				
				
				<form method="post">
					<select name="actorId" id="actorId" size="5">
						<!-- SearchActorList -->
						<c:forEach var="sa" items="${searchActorList}">
							<option value="${sa.actorId}">${sa.firstName} ${sa.lastName}</option>
						</c:forEach>
					</select>
					<button id="btnFilmActor" type="button">출연배우추가</button>
				</form>
				
				
					<c:forEach var="a" items="${actorList}">
						<div>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							
							</a>		
							&nbsp;
							<a href="${pageContext.request.contextPath}/on/removeFilmActorByFilm?filmId=${film.filmId}&actorId=${film.actorId}">삭제</a>
						</div>
						<%-- ${a.firstName} ${a.lastName} --%>
					
					</c:forEach>
					
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
<script>
$('#btnFilmName').click(function() {
	if($('#actorId').val() == '' || $('#actorId').val() == null) {
		alert('출연배우를 추가하세요');
	} else {
		$('#formFilmActor').submit();
	}
})


	$('#btnSearchName').click(function() {
		if($('#searchName').val() == '') {
			alert('검색이름을 입력하세요');
		} else {
			$('#formSearchName').submit();
		}
	})

	$('#btnFilmCategory').click(function(){
		if($('#categoryId').val() == ''){
			alert('카테고리를 선택하세요');
		}else{
			$('#formFilmCategory').submit();
		}
	});
</script>
</html>