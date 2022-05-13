<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp LIST Page</title>
</head>
<body>
	<h3>List Page 초간단 방명록 리스트</h3>
	
	<input type="button" value="글쓰기" onclick="javascript:window.location.href='writeform.do'">
	<p>
	<c:forEach items="${ list }" var="list">
		${ list.num }
		${ list.name }
		${ list.email }
		${ list.home }
		${ list.content } <hr />
	</c:forEach>
</body>
</html>