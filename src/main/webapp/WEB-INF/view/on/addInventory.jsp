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
			<h1>인벤토리 추가</h1>
		<div>
			<form id="formSearchTitle" method="get" action="${pageContext.request.contextPath}/on/addInventory">
				<input type="hidden" name="storeId" value="${storeId}"> <!-- storeId를 hidden값으로 넘겨줌 -->
				<input type="text" id="searchTitle" name="searchTitle" placeholder="영화제목검색" value="${searchTitle}">
				<button type="button" id="btnSearchTitle">검색</button>
			</form>
		</div>
		<div>	
			<form action="${pageContext.request.contextPath}/on/addInventory" id="formAddInventory" method="post">
				<table class="table">
					<tr>
						<td>storeId</td>
						<td>
							<input type="text" name="storeId" value="${storeId}" readonly>
						</td>
					</tr>
					<tr>
						<td>filmId</td>
						<td>
							<select id="filmId" name="filmId" size="5">
								<c:forEach var="f" items="${filmList}">
									<option value="${f.filmId}">${f.title}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				<button id="btnAddInventory" type="button">인벤토리 추가</button>
			</form>
		</div>
		</div>
	</div>
</body>
<script>
	
	$('#btnAddInventory').click(function(){
		
		if($('#filmId').val() == null){
			alert('검색할 영화의 제목을 선택해주세요.');
		}else{
			$('#formAddInventory').submit();
		}
	});

	$('#btnSearchTitle').click(function(){
		
		if($('#searchTitle').val()==''){
			alert('검색할 영화의 제목을 입력해주세요.');
		}else{
			$('#formSearchTitle').submit();
		}
	});

</script>
</html>