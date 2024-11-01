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
	.row *{ padding-left: 0; padding-right: 0; background-color: #212529; color:#fff; text-decoration: none;}
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
		
	<div class="container mt-3">
		<h1>${loginStaff.username}님 어서오세요.</h1>
		  <hr>
			  <table class="table table-dark">
			    <thead>
   				<tr>
					<th>staffId</th>
					<td>${staff.staffId}</td>
				</tr>
			      <tr>
			        <th>Firstname</th>
	            	<td>${staff.firstName}</td>
			      </tr>
			      <tr>
			      	<th>Lastname</th>
			      	<td>${staff.lastName}</td>
			      </tr>
				<tr>
					<th>staffAddress</th>
					<td>${staff.staffAddress}</td>
				</tr>
				<tr>
					<th>staffAddress2</th>
					<td>${staff.staffAddress2}</td>
				</tr>
				<tr>
					<th>staffDistrict</th>
					<td>${staff.staffDistrict}</td>
				</tr>
				<tr>
					<th>staffPostCode</th>
					<td>${staff.staffPostCode}</td>
				</tr>
				<tr>
					<th>staffPhone</th>
					<td>${staff.staffPhone}</td>
				</tr>
				<tr>
					<th>staffCity</th>
					<td>${staff.staffCity}</td>
				</tr>
				<tr>
					<th>staffCountry</th>
					<td>${staff.staffCountry}</td>
				</tr>
				<tr>
					<th>storeId</th>
					<td>${staff.storeId}</td>
				</tr>
				<tr>
					<th>storeId</th>
					<td>${staff.storeId}</td>
				</tr>
				<tr>
					<th>managerStaffId</th>
					<td>${staff.managerStaffId}</td>
				</tr>
				<tr>
					<th>managerName</th>
					<td>${staff.managerName}</td>
				</tr>
				<tr>
					<th>storeAddress</th>
					<td>${staff.storeAddress}</td>
				</tr>
				<tr>
					<th>storeAddress2</th>
					<td>${staff.storeAddress2}</td>
				</tr>
				<tr>
					<th>storeDistrict</th>
					<td>${staff.storeDistrict}</td>
				</tr>
				<tr>
					<th>storePostCode</th>
					<td>${staff.storePostCode}</td>
				</tr>
				<tr>
					<th>storePhone</th>
					<td>${staff.storePhone}</td>
				</tr>
				<tr>
					<th>storeCity</th>
					<td>${staff.storeCity}</td>
				</tr>
				<tr>
					<th>storeCountry</th>
					<td>${staff.storeCountry}</td>
				</tr>			
			    </thead>
			  </table>
		</div>
		</div>
	</div>
</body>
</html>