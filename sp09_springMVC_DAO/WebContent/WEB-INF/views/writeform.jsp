<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeform.jsp page</title>
</head>
<body>
	<h3>방명록 글쓰기</h3>
	<form action="write.do" method="post">
		번호 : <input type="number" name="no">
		이름 : <input type="text" name="name">
		이메일 : <input type="text" name="email">
		홈페이지 : <input type="text" name="home">
		내용 : <input type="text" name="contents">
		
		<input type="submit" value="글쓰기"> &nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소"> &nbsp;&nbsp;&nbsp;
		<input type="button" value="목록보기" onclick="location.href='list.do'">
	</form>
</body>
</html>