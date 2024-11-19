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
			<h1>CUSTOMER LIST</h1>
			
			<table>
				<tr>
					<td>customerId</td>
					<td>storeId</td>
					<td>firstName</td>
					<td>lastName</td>
					<td>email</td>
					<td>addressId</td>
					<td>createDate</td>
					<td>lastUpdate</td>
				</tr>
				<c:forEach var="c" items="${customerList}">
				<tr>
					<td>
						<!-- 고객 상세 정보 -->
						<a href="${pageContext.request.contextPath}/on/customerOne?customerId=${c.customerId}">
							${c.customerId}
						</a>
					</td>
					<td>${c.storeId}</td>
					<td>${c.firstName}</td>
					<td>${c.lastName}</td>
					<td>${c.email}</td>
					<td>${c.addressId}</td>
					<td>${c.createDate}</td>
					<td>${c.lastUpdate}</td>
				</tr>
				</c:forEach>
			</table>
			<!-- 고객 검색기 -->
			<div>
				<form action="">
					<input type="text">
					<button type="button">이름 검색</button>
				</form>
			</div>
			
			<div>
				<!-- 페이징 -->
				<!-- EX : 이전 11 12 13 14 15 16 17 18 19 20 다음 -->
			<%-- if분기 필요			
				<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage-10}">
					[이전]
				</a> 
			
				<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage+10}">
					[다음]
				</a>
			--%>
				
	
				
	
				<c:if test="${currentPage > 10}">
					<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage-10}">
						[이전]
					</a> 
				</c:if>				
				<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">

					<c:if test="${num == currentPage}">
						${num}&nbsp;
					</c:if>
					<c:if test="${num != currentPage}">
					<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${num}">${num}</a>
					&nbsp;
					</c:if>		
				</c:forEach>
				
				<c:if test="${endPagingNum < lastPage}">
				<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage+10}">
					[다음]
				</a>				
				</c:if>			

			</div>

		</div>
	</div>
</body>
</html>