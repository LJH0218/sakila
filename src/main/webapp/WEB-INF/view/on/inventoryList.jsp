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
			<h1> ${storeId} 지점 INVENTORY LIST</h1>
			<table class="table">
				<tr>
					<td>inventoryId</td>
					<td>filmId(title)</td>
					<td>lastUpdate</td>
				</tr>
				<c:forEach var="iv" items="${inventoryList}">
					<tr>
						<td>${iv.inventoryId}</td>
						<td>${iv.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}">
							(${iv.filmId}) ${iv.title}
							</a>
						</td>
						<td>${iv.lastUpdate}</td>
					</tr>
				</c:forEach>
				
			
			</table>
			
				<ul class=" pagination col-sm-6 ">
			
						
							<li class="page-item col-sm-3 ">
								<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=1&storeId=${storeId}">첫 페이지</a>
							</li>	
						<!-- 페이징 박스[이전] - 분기코드 시작 -->
						<c:if test="${currentPage > 1}">
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=${currentPage-1}&storeId=${storeId}">이전</a>
							</li>
						</c:if>
	
						<!-- 페이징 박스[이전] - 분기코드 종료 -->
						
							<li class="page-item col-sm-3">
								<a href="#">[${currentPage}]</a>
							</li>
							
						<!-- 페이징 박스[다음] - 분기코드 시작 -->
						<c:if test="${currentPage >= 1}">
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=${currentPage+1}&storeId=${storeId}">다음</a>
							</li>
						</c:if>
						<!-- 페이징 박스[다음] - 분기코드 종료 -->
						
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/inventoryList?currentPage=${lastPage}&storeId=${storeId}">마지막</a>
							</li>
					</ul>
		
		
		</div>
	</div>
</body>
</html>