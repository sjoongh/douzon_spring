<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
<title>GuestBook 초간단 방명록</title>
</head>
<body>
	<table border="1" width="600">
		<tr>
			<td>NUM</td>
			<td>Writer</td>
			<td>Email</td>
			<td>HomePage</td>
			<td>Detail</td>
			<td>Delete</td>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.num}</td>
				<td>${list.name}</td>
				<td>${list.email}</td>
				<td>${list.home}</td>
				<td><a href="javascript:location.href='guest.do?cmd=detail&no=${list.num}'">상세보기</a></td>
				<td><a href="javascript:location.href='guest.do?cmd=delete&no=${list.num}'">삭제하기</a></td>
			</tr>
		</c:forEach>
	</table>	
	<a href="writeForm.html">글쓰기</a>
</body>
</html>