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
		.col-sm-9{padding: 0 5%;}
		.titlebox{padding-bottom: 50px;}
		.main-list{margin-top: 30%;}
	.list-group-item {border:1px solid #333; padding: 0; }
	.main-list a {display: block; padding: 5%; color:#666;}
	.main-list li a:hover{background-color: #333; transition:all 0.4s; color:#fff;}
	
	h2 {padding-bottom: 15px;}
	
</style>
<title>Insert title here</title>
</head>

<body class="container-flud">
	<div class="row mt-3">
		<div class="col-sm-2">
			<!-- 레프트메뉴 인클루드 -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10">
			<div class="container mt-3">
			<!-- 메인 컨텐츠 -->
			<div class="titlebox">
				<h1>ADD STAFF</h1>
			</div>
			
			<div class="d-flex">
			<div class="col-sm-3">
			
				<h2>주소 검색</h2>
				<form id ="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
					<input type="text" name="searchAddress" id="searchAddress">
					<button type="button" id='btnAddress'>검색하기</button> <!-- 디버깅용으로 submit 확인 끝나면 button태그로 교체해줘야함 -->
				</form>
				<select id="resultAddress" size="10">
					<c:forEach var="a" items="${addressList}">
						<option value="${a.addressId}">
							(ADDRESS ID : ${a.addressId}) ${a.address}
						</option>
					</c:forEach>
				</select>
				<br>
				<button type="button" id="btnAddrSel">주소선택</button>
			</div>
			
			<div class="col-sm-9">
				<h2>정보 입력</h2>
				<form id="addForm" method="post" action="${pageContext.request.contextPath}/on/addStaff">
					<table class="table" style="width:80%">
						<tr>
							<td>StoreId</td>
							<td>
								<select name="storeId" id="storeId">
									<option value="">:::선택:::</option>
									<c:forEach var="s" items="${storeList}">
										<option value="${s.storeId}">${s.storeId}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>addressId</td>
							<td>
								<input type="text" name="addressId" id="addressId" readonly>
							</td>
						</tr>
						<tr>
							<td>firstName</td>
							<td><input type="text" name="firstName" id="firstName"></td>
						</tr>
						<tr>
							<td>lastName</td>
							<td><input type="text" name="lastName" id="lastName"></td>
						</tr>
						<tr>
							<td>email</td>
							<td><input type="text" name="email" id="email"></td>
						</tr>
						<tr>
							<td>userName</td>
							<td><input type="text" name="username" id="username"></td>
						</tr>
					</table>
					<button id="btnAddStaff" type="button"> 스탭 추가</button>
				</form>
			</div>
			</div>
		</div>
		</div>
	</div>
</body>
<script>
	$('#btnAddStaff').click(function(){
		//공백이 넘어가면 메세지가 뜨게끔
		
		//입력폼 유효성 검사
		if($('#storeId').val() == null || $('#storeId').val() == ""){
			alert('storeId를 입력하세요');
		}else if($('#addressId').val() == null || $('#addressId').val() == ""){
			alert('addressId를 입력하세요');
		}else if($('#firstName').val() == null || $('#firstName').val() == ""){
			alert('firstName를 입력하세요');
		}else if($('#lastName').val() == null || $('#lastName').val() == ""){
			alert('lastName를 입력하세요');
		}else if($('#email').val() == null || $('#email').val() == ""){
			alert('email를 입력하세요');
		}else if($('#username').val() == null || $('#username').val() == ""){
			alert('username를 입력하세요');
		}else{
			console.log('submit...');
			$('#addForm').submit();	
		}
	});

	$('#btnAddrSel').click(function() {
		console.log($('#resultAddress').val());
		if($('#resultAddress').val() == null || $('#resultAddress').val() =='') {
			alert('주소 선택을 먼저 하세요');
		} else {
			$('#addressId').val($('#resultAddress').val());
		}
	});
	$("#btnAddress").click(function(){
		if($('#searchAddress').val() == ""){
			alert('주소 검색어를 입력하세요.');
		}else{
			$('#formAddress').submit();
		}
		
	});
</script>
</html>