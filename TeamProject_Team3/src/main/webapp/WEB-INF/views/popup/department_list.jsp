<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서 page</title>
</head>
<body>
<script language="javascript">
function winOpen()
{
       window.open("department_sign_up", "newWin2", "width=300, height=300, toolbar=no, scrollbars=yes,location=no");
} 
</script> 
	<h2 align="center"> [ 부서 ] </h2>
	<h3 align="center"> [부서 코드는 5자리를 입력해주세요.  ex : 00001,00501]</h3>
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<tr>
			<td>부서 코드</td>
			<td>부서 이름</td>
			<td></td>
		</tr>
		
		<c:forEach items="${department_list}" var="dto">
		
				
		
			<tr>
				<td>				
					<a href="department_content_view?department_code=${dto.department_code}">${dto.department_code}</a>
				</td>
				<td>${dto.department }</td>
				<td><a href="department_delete?department_code=${dto.department_code}">[삭제]</a></td>
			</tr>
		</c:forEach>
		
		<tr>
		     <td colspan="1"><input type='button' value="부서 신규 등록" onClick='winOpen()' class="btn btn-primary"></td>
			 <td colspan="2"><input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger"></td>
		</tr>
		
	</table>
</body>
</html>