<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결근사유 page</title>
</head>
<body>
<script language="javascript">
function winOpen()
{
       window.open("absence_sign_up_view", "newWin2", "width=300, height=300, toolbar=no, scrollbars=yes,location=no");
} 
function winOpen2(response)
{
	opener.document.getElementById("status").value = response;
	window.close();
} 
</script> 
	<h2 align="center"> [결근 사유] </h2>
	<h4 align="center"> [사용할 결근 사유의 이름을 클릭하세요]</h4>
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<tr>
			<td>결근 코드</td>
			<td>결근 사유</td>
			<td></td>
		</tr>
		
		<c:forEach items="${absence_list}" var="dto">
		
			<tr>
				<td>				
					${dto.absence_code}</a>
				</td>
				<td>
				<input type = "text" onClick = "winOpen2('${dto.absence_name}')" value ="${dto.absence_name}" readonly="readonly">
				</td>
				
				<td><a href="absence_delete?absence_code=${dto.absence_code}">[삭제]</a></td>
			</tr>
		</c:forEach>
		
		<tr>
		     <td colspan="1"><input type='button' value="결근 사유 신규 등록" onClick='winOpen()' class="btn btn-primary btn-sm"></td>
			 <td colspan="2"><input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger btn-sm"></td>
		</tr>
		
	</table>
</body>
</html>