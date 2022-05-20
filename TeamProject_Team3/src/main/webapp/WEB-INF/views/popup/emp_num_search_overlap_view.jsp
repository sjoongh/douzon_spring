<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 중복 확인</title>
</head>
<body>

<script language="javascript">
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function winOpen(emp_num)
{
	opener.document.getElementById("emp_num").value =emp_num;
	window.close();
}  

</script> 
<h4 align="center">[사원 중복 확인]</h4>
<form action="emp_num_search_overlap" method="post">
	<div align="center"><input type="text" name="emp_num" placeholder="사용할 사원번호  다섯자리 숫자 입력[ENTER]"
		size='25' value="${emp_num}" onkeydown="return onlyNumber(event)" maxlength="5" style="width: 300px;"> <input type="submit" value="검색"   required="required"></div>
</form>
	<h5 align="center">[사원 리스트]</h5>
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<tr>
			<td>사원 번호</td>
			<td>사원 이름</td>
		</tr>
		
		<c:forEach items="${emp_num_search_list}" var="dto">
			<tr>
				<td>${dto.emp_num}</td>
				<td><input type = "text" <%-- onClick = "winOpen ('${dto.emp_num}','${dto.emp_name}')" --%> value ="${dto.emp_name}" readonly="readonly" ></td>
			</tr>
		</c:forEach>
		<tr><td colspan="2">
		<c:if test="${emp_num_search_list.size() ==0}">
		<h4><font color="blue">${emp_num} 사용 하실수 있는 사원 번호입니다</h4>
		</c:if>
		</td></tr>
	</table>
	<c:if test="${emp_num_search_list.size() ==0}">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value="사용" onClick="winOpen('${emp_num}')" class="btn btn-success"> 
	</c:if>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger"> 
</body>
</html>