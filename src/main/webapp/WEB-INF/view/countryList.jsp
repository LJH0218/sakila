<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>country list</h1>
	<table border="1">
		<tr>
			<td>CountryId</td>
			<td>Country</td>
			<td>LastUpdate</td>
		</tr>
		<c:forEach var="c" items="${list}">
			<tr>
				<td>${c.countryId}</td>
				<td>${c.country}</td>
				<td>${c.lastUpdate}</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>