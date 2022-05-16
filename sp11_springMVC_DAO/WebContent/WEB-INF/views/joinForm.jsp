<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
</head>
<body>
<form action="" method="POST">
		<table border="1">
		<tr>
			<td>아이디 : </td>
			<td>
				<input type="text" name="id" size="20" placeholder="id 입력 요망">
			</td>
		</tr>
		<tr>
			<td>이 름 : </td>
			<td>
				<input type="text" name="name" size="20" placeholder="name input">
			</td>	
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td>
				<input type="password" name="pwd" size="20" placeholder="password input">
			</td>	
		</tr>
		<tr>
			<td>이메일 : </td>
			<td>
				<input type="email" name="email" size="20" placeholder="email@email.or.kr">
			</td>	
		</tr>
		<tr>
			<td>나 이 : </td>
			<td>
				<input type="number" name="age" size="20" placeholder="age input">
			</td>	
		</tr>
		<tr>
			<td colspan="1">
				<input type="submit" value="회원가입">
				<input type="reset" value="취소">
			</td>
		</tr>
		</table>
	</form>
</body>
</html>