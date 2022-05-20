<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결근 사유 등록</title>
</head>
<body>
 <script language="javascript">
function windowSubmit()
{
	   document.absence_sign_up.submit(); 
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
	<form name="absence_sign_up" action="absence_sign_up" method="post">
		<h3>[[ 결근 사유 등록]]</h3>
		[결근 코드는 5자리로 입력해주세요]<br>
		[ex : 00001,00050]
		결근 코드 : <input type="text" id="absence_code" name="absence_code" onkeydown="return onlyNumber(event)" class="form-control" style="width: 200px;"/>
		결근 사유 : <input type="text" id="absence_name"  name="absence_name" class="form-control" style="width: 200px;"/>
		<input type=button value="결근 사유 등록" class="btn btn-primary btn-sm" onClick="javascript:windowSubmit()" />
	</form>
</body>
</html>
