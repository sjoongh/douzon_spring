<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인적사항등록</title>
</head>
<body>
 <script language="javascript">
function windowClose()
{
	   document.duty_sign_up.submit(); 
} 
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
</script>
	<form name="duty_sign_up" action="duty_sign" method="post">
		<h3>[[ 직책 신규 등록 ]]</h3>
		직책 코드 : <input type="text" name="duty_responsibility_code" onkeydown="return onlyNumber(event)" class="form-control" style="width: 200px;" placeholder="코드는 숫자 5자리 입력!" required="required"/><br>
		직책 이름 : <input type="text" name="duty_responsibility" class="form-control" style="width: 200px;" required="required"/><br>	
		<input type=submit value="직책 등록"  class="btn btn-success btn-sm"/>
		<input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger btn-sm"> <!-- onClick="javascript:windowClose()" -->
	</form>
</body>
</html>


