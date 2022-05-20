<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE>

<html>

<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="resources/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>사업자등록번호 중복 확인</title>
</head>

<body>

	<script language="javascript">
		
		function winOpen(su_taxid) {
			opener.document.getElementById("su_taxid").value = su_taxid;
			window.close();
		}
	</script>
	
	<h4 align="center">[사업자등록번호 중복 확인]</h4>
	<form action="su_taxid_check" method="post">
		<div align="center">
			<input type="text" name="su_taxid" size='25' value="${ su_taxid }"
				style="width: 150px;" > <input type="submit" value="검색" required="required" class="btn btn-success btn-sm">
		</div>
	</form>
	<c:if test="${ result == 0 }">
		<h4><font color="blue">등록 가능한 사업자등록번호입니다</h4>
	</c:if>
	<c:if test="${ result < 0 || result > 0 }">
		<h4><font color="red">등록 할 수 없는 사업자등록번호입니다</h4>
	</c:if>

	<c:if test="${ result == 0}">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value="사용" onClick="winOpen('${ su_taxid }')" class="btn btn-success"> 
	</c:if>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger"> 
</body>
</html>