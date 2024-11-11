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
			<h1>FILM LIST</h1>
			<!-- 카테고리 선택 -->
			<form action="${pageContext.request.contextPath}/on/filmList" action="get" id="formCategory">
				<select name="categoryId" id="categoryId">
					<option value="0">전체</option> <!-- 전체는 값을 넘겨주지않겠다는 의미로 0이라는 숫자 부여(수업을 위한 임시조치) -->
					<c:forEach var="c" items="${categoryList}">
						<c:if test="${c.categoryId == currentCategoryId}">
							<option selected value="${c.categoryId}">${c.name}</option>
						</c:if>
						<c:if test="${c.categoryId != currentCategoryId}">
							<option  value="${c.categoryId}">${c.name}</option>
						</c:if>
					
					
					</c:forEach>
				</select>
			</form>
			<br>
			<table class="table">
				<tr>
					<td>filmId</td>
					<td>title</td>
					<td>releaseYear</td>
					<td>rentalDuration</td>
					<td>rentalRate</td>
					<td>length</td>
					<td>replacmentCost</td>
					<td>ration</td>
				</tr>
				 <!-- filmList -->
				<c:forEach var="f" items="${filmList}">
					<tr>
						<td>${f.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
								${f.title}
							</a>
						</td>
						<td>${f.releaseYear}</td>
						<td>${f.rentalDuration}</td>
						<td>${f.rentalRate}</td>
						<td>${f.length}</td>
						<td>${f.replacmentCost}</td>
						<td>${f.ration}</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 페이징 박스 -->
			<div class="pageBox col-sm-8">
		
					<ul class=" pagination ">
			
						
							<li class="page-item col-sm-3 ">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=1&categoryId=${currentCategoryId}">첫 페이지</a>
							</li>	
						<!-- 페이징 박스[이전] - 분기코드 시작 -->
						<c:if test="${currentPage > 1}">
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage-1}&categoryId=${currentCategoryId}">이전</a>
							</li>
						</c:if>
	
						<!-- 페이징 박스[이전] - 분기코드 종료 -->
						
							<li class="page-item col-sm-3">
								<a href="#">[${currentPage}]</a>
							</li>
							
						<!-- 페이징 박스[다음] - 분기코드 시작 -->
						<c:if test="${currentPage >= 1}">
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${lastPage}&categoryId=${currentCategoryId}">다음</a>
							</li>
						</c:if>
						<!-- 페이징 박스[다음] - 분기코드 종료 -->
						
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${lastPage}&categoryId=${currentCategoryId}">마지막</a>
							</li>
					</ul>
		
			</div>
			
		</div>
	</div>
</body>
<script>
$('#categoryId').change(function() {
	// alert('change!');
	$('#formCategory').submit();
});
</script>
</html>