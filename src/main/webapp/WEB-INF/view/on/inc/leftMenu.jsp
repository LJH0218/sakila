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
	  	<a href="${pageContext.request.contextPath}/on/storeList">지점 리스트</a>
		<!-- 
			StoreMapper.selectStoreList() : List<Map> - store x staff x address
		 	StoreServie.getStoreList() : List<Map>
		 	/on/storeList - SoreController.storeList() - storeList.jsp
		 -->
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addStore">지점 추가</a>
	  	<!-- 
	  		GET - /on/addStore
	  		- storeController.addStore() : staffList 모델추가, search주소 검색결과 모델추가 - addStore.jsp
	  		StoreMapper.insertStore() : Integer
	  		StoreService.addStore() : Integer
	  		POST - /on/addStore - StoreController.addStore(Store)
	  	 -->
	  </li>  
   	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addInventory">인벤토리 리스트</a>
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
	  <!-- 영화관리 부분 -->
  	  <li class="list-group-item">
	  	<a href="">::: 영화 관리 :::</a>
	  </li>
   	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/categoryList">카테고리 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addCategory">카테고리 추가</a>
	  </li>	 
   	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/languageList">언어 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addLanguage">언어 추가</a>
	  </li>	 
  	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/filmList">필름 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addFilm">필름 추가</a>
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
	  
  	  <li class="list-group-item">
	  	<a href="">::: 배우 관리 :::</a>
	  </li>
   	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/actorList">배우 리스트</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${pageContext.request.contextPath}/on/addActor">배우 추가</a>
	  </li>	
	  <li class="list-group-item">
			<a href="">::: 통계 :::</a>  
	  </li>
	</ul>
</div>