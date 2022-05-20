<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직책 page</title>
</head>
<body>
<script language="javascript">
function winOpen()
{
       window.open("basic_pay_sign_view", "newWin2", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
</script> 
	<h2 align="center"> [ 기본급 리스트 ] </h2>
	
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<tr>
			<td>직책 코드</td>
			<td>직책 이름</td>
			<td>기본급</td>
			<td>삭제</td>
		</tr>
		
		<c:forEach items="${basic_pay_list}" var="dto">
			<tr>
				<td>				
					<a href="basic_pay_content_view?duty_responsibility_code=${dto.duty_responsibility_code }">${dto.duty_responsibility_code }</a>
				</td>
				<td>${dto.duty_responsibility}</td>
				<td>${dto.basic_pay }</td>
				<td><a href="basic_pay_delete?duty_responsibility_code=${dto.duty_responsibility_code}">삭제</a></td>
			</tr>
		</c:forEach>
		
		<tr>
		<td colspan="4"><input type='button' value="기본급 신규 등록" onClick='winOpen()' class="btn btn-primary btn-sm"></td>
			 
		</tr>
		<tr>
		<td colspan="4"><input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger btn-sm"></td>
		</tr>
	</table>
</body>
</html>