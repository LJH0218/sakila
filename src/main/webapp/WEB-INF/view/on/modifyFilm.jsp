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
			<h1>MODIFY FILM</h1>
			<form id="formAddFilm" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
				<table class="table table-striped table-bordered" style="width:80%">
					<tr>
						<td colspan="2" class="fw-bold">필수 항목</td>
					</tr>
					<tr>
						<td>title</td>
						<td>
							<input type="text" id="title"  value="${modifyFilm.title}" name="title">
						</td>
					</tr>
					<tr>
						<td>languageId</td>
						<td>
							<select name="languageId"  id="languageId">
							<option value="">언어 선택</option>
								<c:forEach var="la" items="${languageList}">
									<option selected value="${la.languageId}">${la.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>

					<tr>
						<td>rentalDuration</td>
						<td>
							<!-- 기본값 : 3 -->
							<input type="number" value="${modifyFilm.rentalDuration}" id="rentalDuration" name="rentalDuration" value="3">
							일
						</td>
					</tr>
					<tr>
						<td>rentalRate</td>
						<td>
							<!-- 기본값 : 4.99 -->
							<input type="number" id="rentalRate"  value="${modifyFilm.rentalRate}" name="rentalRate" value="4.99">$
						</td>
					</tr>

					<tr>
						<td>replacementCost</td>
						<td>
							<!-- 기본값 : 19.99 -->
							<input type="number" id="replacementCost" value="${modifyFilm.replacementCost}" name="replacementCost" value="19.99" >$
						</td>
					</tr>
					<tr>
						<td>rating</td>
						<td> 
						<!-- radio, enum(g,pg,pg-13,r,nc-17), DB기본 값 : "G" -->
							<input type="radio"  name="rating" class="rating" value="G" <c:if test="${modifyFilm.rating == 'G'}">checked</c:if>>G<br>
							<input type="radio" name="rating" class="rating" value="PG" <c:if test="${modifyFilm.rating == 'PG'}">checked</c:if>>PG<br>
							<input type="radio" name="rating" class="rating" value="PG-13" <c:if test="${modifyFilm.rating == 'PG-13'}">checked</c:if>>PG-13<br>
							<input type="radio" name="rating" class="rating" value="R" <c:if test="${modifyFilm.rating == 'R'}">checked</c:if>>R<br>
							<input type="radio" name="rating" class="rating" value="NC-17" <c:if test="${modifyFilm.rating == 'NC-17'}">checked</c:if>>NC-17
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="fw-bold">선택적 항목</td>
					</tr>
					
					<!-- 선택적 항목 -->
					<tr>
						<td>length</td>
						<td><input type="number"  value="${modifyFilm.length}" id="length" name="length" >분</td>
					</tr>
					<tr>
						<td>originalLanguageId</td>
						<td>
							<select name="originalLanguageId" value="${modifyFilm.originalLanguageId}" id="originalLanguageId">
								<option value="">오리지널 언어 선택</option>
								<c:forEach var="la" items="${languageList}">
									<option selected value="${la.languageId}">${la.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>releaseYear</td>
						<td>
							<input type="number" id="releaseYear" selected value="${modifyFilm.releaseYear}" name="releaseYear">
						</td>
					</tr>
					<tr>
						<td>specialFeatures</td>
						<td>
							<!-- checkBox -->
							<input type="checkbox"  name="specialFeatures" class="specialFeatures"
								value="Trailers" <c:if test="${modifyFilm.specialFeatures == 'Trailers'}">checked</c:if>>Trailers<br>
							<input type="checkbox"  name="specialFeatures" class="specialFeatures"
								value="Commentaries" <c:if test="${modifyFilm.specialFeatures == 'Commentaries'}">checked</c:if>>Commentaries<br>
							<input type="checkbox"  name="specialFeatures" class="specialFeatures"
								value="Deleted Scenes" <c:if test="${modifyFilm.specialFeatures == 'Deleted Scenes'}">checked</c:if>>Deleted Scenes<br>
							<input type="checkbox" c name="specialFeatures" class="specialFeatures"
								value="Behind the Scenes" <c:if test="${modifyFilm.specialFeatures == 'Behind the Scenes'}">checked</c:if>>Behind the Scenes<br>
						
						</td>
						
					<tr>
						<td>description</td>
						<td><!-- textarea -->
						<textarea name="description"  selected value="${modifyFilm.description}" id="description" cols="50" rows="3"></textarea></td>
					</tr>
					
					</tr>
				</table>
				<button id="btnAddFilm" type="button">Modify Film</button>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnAddFilm').click(function(){
		// 폼 유효성 검사(제외 description, releaseYear, originalLanguageId, length, specialFeatures)
		if($(title).val() == ''){
			alert('title을 입력하세요');
		} else if ($('#languageId').val == ''){
			alert('languageId를 선택하세요');
		} else if ($.isNumeric($('#rentalDuration').val())== false){
			alert('rentalDuration은 숫자를 입력하세요');
		} else if ($.isNumeric($('#rentalRate').val())== false){
			alert('rentalRate은 숫자를 입력하세요');
		} else if ($.isNumeric($('#replacementCost').val())== false){
			alert('replacementCost은 숫자를 입력하세요');
		} else if ($('.rating:checked').length == 0){
			alert('rating을 선택하세요');
		} else {
			$('#formAddFilm').submit();
		}
		$('#formAddFilm').submit();
	});
	
	

</script>
</html>