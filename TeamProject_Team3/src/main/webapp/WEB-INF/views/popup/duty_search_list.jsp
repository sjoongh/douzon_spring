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
function winOpen(response,response2)
{
	opener.document.getElementById("duty_responsibility_code").value = response;
	opener.document.getElementById("duty_responsibility_name").value = response2;
	window.close();
} 
</script> 
	<h2 align="center"> [ 직책 ] </h2>
	<h3 align="center"> [원하시는 직책의 이름을 클릭하세요]</h3>
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<tr>
			<td>직책 코드</td>
			<td>직책 이름</td>
		</tr>
		
		<c:forEach items="${duty_search_list}" var="dto">
			<tr>
				<td>${dto.duty_responsibility_code}</td>
				<td><input type = "text" onClick = "winOpen('${dto.duty_responsibility_code}','${dto.duty_responsibility}')" value ="${dto.duty_responsibility}" readonly="readonly"></td>
			</tr>
		</c:forEach>
	</table>
	<input type='button' value="창닫기" onClick='window.close()'> 
</body>
</html>