<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<style>
	.container {background-color: #212529;}
	* {color:#666; text-decoration: none; }
	h1 {color:#666; text-align: center;transition: all 0.4s;}
	.bgc {background-color: #333; padding: 20px; border-radius: 15px; margin-top: 50%; text-align: center;}
	h1:hover {color:#fff;}
	.loginbox {text-align: left;}
	.form-control::placeholder {
  		color: #666;
}
	.bgc input {background-color: #212529; border: 1px solid #666; color:#666;}
	.form-control:focus {background-color: #333; border-color: #666; box-shadow:none; color:#fff;}
	.btn {color:#666;}

</style>
<title>Insert title here</title>


</head>
<body class="container col-sm-3">

	
	<form class="bgc" id="form" action="${pageContext.request.contextPath}/off/login" method="post">
		<h1>STAFF-LOGIN</h1>
		<hr>
		<small>${msg}</small>
		  <div class="mb-3 mt-3 loginbox">
		    <label class="form-label" for="staffId"> Staff-Num </label>
		    <input class="form-control" id="staffId" placeholder="Staff-Num" name="staffId" type="text" value="1">
		  </div>
		  <div class="mb-3 loginbox">
		    <label class="form-label" for="password"> Password </label>
		    <input  id="password" name="password" placeholder="Password" type="password" class="form-control" value="1234">
		  </div>
	  <button id="btn" type="button" class="btn btn-dark justify-content-center">로그인</button>
	</form>
	
</body>

<script>
	// btn 버튼 클릭시 폼값 유효성 검사
	
	$('#btn').click(function(){
		console.log('click');
		// 숫자가 아니면 isNaN() or $.isNumeric()
		if($.isNumeric($('#staffId').val()) == false){
			alert('StaffId는 숫자만 입력 가능합니다.');
		} else if ($('#password').val().length < 4){
			alert('Password는 4자 이상 입력하셔야합니다.');
		} else {
		$('#form').submit();
		}
	});
</script>
</html>