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
		.col-sm-10{padding: 0 5%;}
		.main-list{margin-top: 30%;}
		.titlebox{padding-bottom: 50px;}
		
	.list-group-item {border:1px solid #333; padding: 0; }
	.main-list a {display: block; padding: 5%; color:#666;}
	.main-list li a:hover{background-color: #333; transition:all 0.4s; color:#fff;}
	h1 {padding-bottom: 15px;}
</style>
<title>Insert title here</title>
</head>

<body class="container-flud">
	<div class="row mt-3">
		<div class="col-sm-2">
			<!-- 레프트메뉴 인클루드 -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10 ">
		<div class="container mt-3">
			<!-- 메인 컨텐츠 -->
			<div class="titlebox">
				<h1>STAFF LIST</h1>
			</div>
			
			<table class="table table-striped">
				<tr>
					<td>staffId</td>
					<td>firstName</td>
					<td>lastName</td>
					<td>addressId</td>
					<td>email</td>
					<td>storeId</td>
					<td>username</td>
					<td>lastUpdate</td>
					<td>active</td>
					<td>활성/비활성화</td>
				</tr>
				<c:forEach var = "s" items="${staffList}">
					<tr>
						<td>${s.staffId}</td>
						<td>${s.firstName}</td>
						<td>${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.email}</td>
						<td>${s.storeId}</td>
						<td>${s.username}</td>
						<td>${s.lastUpdate}</td>
						<td>${s.active}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" class="btn btn-danger">
								<c:if test="${s.active==1}">사용금지로(2로) 변경</c:if>
								<c:if test="${s.active==2}">사용가능으로(1로) 변경</c:if>
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
	</div>
</body>
</html>