<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
<title>Insert title here</title>
</head>
<body>
	
	<form action="guest.do?cmd=update" method="post">
		번호 <input type="text" name ="no" value="${detail.no}" readonly><br>
		이름 <input type="text" name ="name" value="${detail.name}" ><br>
		이메일 <input type="text" name ="email" value="${detail.email}" ><br>
		홈페이지<input type="text" name ="home" value="${detail.home}" ><br>
		내용<input type="text" name ="content" value="${detail.content}" ><br>
		작성일<input type="text" name ="regdate" value="${detail.regdate}" disabled><br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>