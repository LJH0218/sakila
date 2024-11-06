<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
<meta charset="UTF-8">
<style>
	* {background-color: #212529;}
	.row *{ padding-left: 0; padding-right: 0;  color:#fff; text-decoration: none;}
		.col-sm-2{padding: 0 2%; border-right: 1px solid #333;}
		.main-list{margin-top: 30%;}
	.list-group-item {border:1px solid #333; padding: 0; }
	.main-list a {display: block; padding: 5%; color:#666;}
	.main-list li a:hover{background-color: #333; transition:all 0.4s; color:#fff;}
	li {text-align: center;}
	.pageBox {margin: 0 auto; float: right;}
	#formSearch {float: left;}
	
	.contentFooter {float: left; width: 60%;}

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
			<h1>ACTOR LIST</h1>
			<table class="table table-striped">
				<tr>
					<td>ActorId</td>
					<td>Name</td>
				</tr>
				<c:forEach var="a" items="${actorList}">
					<tr>
						<td>${a.actorId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							</a>
						</td>
					</tr>
				</c:forEach>


			</table>
		<!-- 서치 박스 -->
		<div class="contentFooter">
			<div class="searchBox col-sm-4 ">
				<form id="formSearch" action="${pageContext.request.contextPath}/on/actorList" method="get">
					<input type="text" name="searchWord" id="searchWord">
					<button  id="btnSearch">검색</button>
				</form>
			</div>
				
			<!-- 페이징 박스 -->
			<div class="pageBox col-sm-8">
		
					<ul class=" pagination ">
			
						
							<li class="page-item col-sm-3 ">
								<a href="${pageContext.request.contextPath}/on/actorList?currentPage=1&searchWord=${searchWord}">첫 페이지</a>
							</li>	
						<!-- 페이징 박스[이전] - 분기코드 시작 -->
						<c:if test="${currentPage > 1}">
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
							</li>
						</c:if>
	
						<!-- 페이징 박스[이전] - 분기코드 종료 -->
						
							<li class="page-item col-sm-3">
								<a href="#">[${currentPage}]</a>
							</li>
							
						<!-- 페이징 박스[다음] - 분기코드 시작 -->
						<c:if test="${currentPage >= 1}">
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
							</li>
						</c:if>
						<!-- 페이징 박스[다음] - 분기코드 종료 -->
						
							<li class="page-item col-sm-3">
								<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
							</li>
					</ul>
		
			</div>
		</div>
		
		</div>
	</div>
</body>
<script>
	$('#btnSearch').click(function(){
		if($('#searchWord').val() == ''){
			alert('검색어를 입력하세요.');
			return;
		}
		$('#formSearch').submit(); // else문 대신 쓰는것
	});
</script>
</html>