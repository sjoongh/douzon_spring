<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE>

<html>

<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="resources/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>품목코드 중복 확인</title>
</head>

<body>

	<script language="javascript">
	
		function onlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				return false;
		}
		
		function winOpen(st_code) {
			opener.document.getElementById("st_code").value = st_code;
			window.close();
		}
	</script>
	
	<h4 align="center">[품목코드 중복 확인]</h4>
	<form action="st_code_check" method="post">
		<div align="center">
			<input type="text" name="st_code" size='25' value="${ st_code }" onkeydown="return onlyNumber(event)" maxlength="5"
				style="width: 150px;"> <input type="submit" value="검색" required="required" class="btn btn-success btn-sm">
		</div>
	</form>
	<c:if test="${ result == 0 }">
		<h4><font color="blue">${ st_code } 사용할 수 있는 품목코드입니다</h4>
	</c:if>
	<c:if test="${ result < 0 || result > 0 }">
		<h4><font color="red">${ st_code } 사용할 수 없는 품목코드입니다</h4>
	</c:if>

	<c:if test="${ result == 0}">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value="사용" onClick="winOpen('${ st_code }')" class="btn btn-success"> 
	</c:if>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger"> 
</body>
</html>