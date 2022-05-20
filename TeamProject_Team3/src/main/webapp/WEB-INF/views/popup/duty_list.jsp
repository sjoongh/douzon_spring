<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<!— Latest compiled and minified CSS —>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직책 List page</title>
</head>
<body>
<script language="javascript">
function windowDutySearch()
{
	window.open("duty_search_list", "newWin2", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
function winOpen()
{
       window.open("duty_sign_up", "newWin2", "width=300, height=300, toolbar=no, scrollbars=yes,location=no");
} 
</script> 
	<h2 align="center"> [ 직책 ] </h2>
	<h3 align="center"> [직책 코드는 5자리를 입력해주세요.  ex : 00001,00300]</h3>
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped" >
	
		<tr>
			<td>직책 코드</td>
			<td>직책 이름</td>
			<td></td>
		</tr>
		
		<c:forEach items="${duty_list}" var="dto">
			<tr>
			
				<td>				
					<a href="duty_content_view?duty_responsibility_code=${dto.duty_responsibility_code }">${dto.duty_responsibility_code }</a>
				</td>
				<td>${dto.duty_responsibility }</td>
				<td><a href="duty_delete?duty_responsibility_code=${dto.duty_responsibility_code}">[삭제]</a></td>
			</tr>
		</c:forEach>
		
		<tr>
			 <td colspan="1"><input type='button' value="직책 신규 등록" onClick='winOpen()' class="btn btn-primary"></td>
			 <td colspan="2"><input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger"></td>
		</tr>
		
	</table>
</body>
</html>