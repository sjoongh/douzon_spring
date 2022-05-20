<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서등록</title>
</head>
<body>

 <script language="javascript">
/* function windowSubmit()
{
	   document.basic_pay_sign.submit(); 
}  */
function checkId() {
    var userinput = eval("document.basic_pay_sign");
    
    if (!userinput.duty_responsibility_code.value) {
        alert("직책코드를 입력하세요.");
        userinput.duty_responsibility_code.focus();
        return false;
     }
    
    if (!userinput.duty_responsibility_name.value) {
        alert("직책이름을 입력하세요.");
        userinput.emp_name.focus();
        return false;
     }
}
function windowDutySearch()
{
	window.open("duty_search_list", "newWin3", "width=400, height=400, toolbar=no, scrollbars=yes,location=no");
} 

</script>
	<form name="basic_pay_sign" action="basic_pay_sign" method="post" onSubmit="return checkId()">
		<h3 align="center">[[기본급 신규 등록]]</h3>
		직책 코드 : <input type="text" id="duty_responsibility_code" name="duty_responsibility_code"   placeholder="검색창을 눌러주세요" readonly="readonly" class="form-control" style="width: 200px;"><input type="button" value="검색" OnClick="javascript:windowDutySearch();" class="btn btn-primary btn-sm"><br>
		직책 이름 : <input type="text" id="duty_responsibility_name"  readonly="readonly" class="form-control" style="width: 200px;">
		기본급 설정 : <input type="text" name="basic_pay" required="required" class="form-control" style="width: 200px;">	
		<input type="submit" value="기본급 등록" onClick="javascript:windowSubmit()" class="btn btn-primary btn-sm"/>
		<input type="button" value="창닫기" class="btn btn-danger btn-sm" onClick='window.close()'/>
	</form>
</body>
</html>


