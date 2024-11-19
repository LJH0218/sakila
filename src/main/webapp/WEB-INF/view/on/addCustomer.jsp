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
			<h1>ADD CUSTOMER</h1>
			
			<div>
				<!-- 주소 검색 폼 -->
				
				<form id="formSearchAddress" action="${pageContext.request.contextPath}/on/addCustomer" method="get" >
				
				<input type="text" id="searchAddress" name="searchAddress" placeholder="주소 검색" value="${searchAddress}">
				<button type="button" id="btnSearchAddress">검색</button>
				</form>
			</div>
			
			<div>
				<!-- 고객 입력 폼 -->
				<form action="${pageContext.request.contextPath}/on/addCustomer" id="formAddCustomer" method="post">
					<table class="table">
						<tr>
							<td>addressId</td>
							<td>
								<select id="addressId" name="addressId" size="5">
									<c:forEach var="ad" items="${addressList}">
										<option value="${ad.addressId}">${ad.address}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
					<button id="btnAddCustomer" type="button">입력하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
$('#btnAddCustomer').click(function(){
	
	if($('#addressId').val() == null){
		alert('올바른 주소를 선택해주세요.');
	}else{
		$('#formAddCustomer').submit();
	}
});


$('#btnSearchAddress').click(function(){
	
	if($('#searchAddress').val()==''){
		alert('올바른 주소를 입력해주세요.');
	}else{
		$('#formSearchAddress').submit();
	}
});
</script>
</html>