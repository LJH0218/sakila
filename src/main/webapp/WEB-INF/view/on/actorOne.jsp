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
			
			
			<!-- actir -->
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
					<a href="">actor 수정</a>
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
						<td><a href="" class="btn btn-warning">삭제</a></td>
					</c:forEach>
				</table>
				
				<div><a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-success">이미지파일 추가</a></div>
			<!-- film -->
			<div>
				<h2>&#128526; 출연 작품</h2>
				<c:forEach var="f" items="${filmList}">
					<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">${f.title}</a>&nbsp;
					${f.title}
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>