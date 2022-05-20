<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>duty_content_view 상세보기 페이지</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action=basic_pay_modify method="post">
			<tr>
				<td>직책 코드</td>
				<input type="hidden" name="duty_responsibility_code" value="${basic_pay_content_view.duty_responsibility_code}">
				<td>${basic_pay_content_view.duty_responsibility_code}</td>
			</tr>
			<tr>
				<td>직책 이름</td>
				<input type="hidden" name="duty_responsibility" value="${basic_pay_content_view.duty_responsibility}">
				<td>${basic_pay_content_view.duty_responsibility}</td>
			</tr>
			<tr>
				<td>기본급</td>
				<td><input type="text" name="basic_pay" value="${basic_pay_content_view.basic_pay}"></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
					<a href="basic_pay_list">목록보기</a>&nbsp;&nbsp;
					
				</td>
			</tr>
		</form>
	</table>

</body>
</html>