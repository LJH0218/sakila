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
			<h1>MODIFY ACTOR</h1>
			
				<table class="table">
					<tr>
						<td>firstName</td>
						<td>
							<form id="formFirstName" action="${pageContext.request.contextPath}/on/modifyActor"
							method="post" >
								<input type="hidden" name="actorId" value="${actor.actorId}" >
								<input type="text" value="${actor.firstName}" name="firstName" id="firstName">
								<button type="button" id="btnFirstName">firstName 수정</button>
							</form>
						</td>
					</tr>
					<tr>
						<td>lastName</td>
						<td>
							<form id="formLastName" action="${pageContext.request.contextPath}/on/modifyActor"
							method="post" >
								<input type="hidden" name="actorId" value="${actor.actorId}" >
								<input type="text" value="${actor.lastName}" name="lastName" id="lastName">
								<button type="button" id="btnLastName">lastName 수정</button>
							</form>
						</td>
					</tr>
				</table>
	
		</div>
	</div>
</body>
<script>
$('#btnFirstName').click(function(){
	if($('#firstName').val() == '') {
		alert('수정할 firstName을 입력하세요');
	} else {
		$('#formFirstName').submit();
	}
});

$('#btnLastName').click(function(){
	if($('#lastName').val() == '') {
		alert('수정할 lastName을 입력하세요');
	} else {
		$('#formLastName').submit();
	}
});
</script>
</html>