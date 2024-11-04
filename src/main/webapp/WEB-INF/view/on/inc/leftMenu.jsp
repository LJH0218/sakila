<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main-list ">
	<ul class="list-group text-center">
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/main">홈으로</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username}님</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/logout">로그아웃</a>
	  </li>
	  
   	  <li class="list-group-item">
	  <a href="">::: 지점 관리 :::</a>
	  </li>
  	  <li class="list-group-item">
	  	<a href="">지점 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="">지점 추가</a>
	  </li>  
	  
	  <li class="list-group-item">
	  	<a href="">::: STAFF 관리 :::</a>
	  </li>
  	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/staffList">STAFF 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addStaff">STAFF 추가</a>
	  </li>
	  
	  <li class="list-group-item">
	  	<a href="">::: 고객 관리 :::</a>
	  </li>
  	  <li class="list-group-item">
	  	<a href="">고객 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="">고객 추가</a>
	  </li>	  
	</ul>
</div>