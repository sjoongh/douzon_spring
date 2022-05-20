<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가 및 결근 신청</title>
</head>
<body>
<h1 align="center">휴가 및 결근 신청</h1>
<h5 align="center">휴가 및 결근 신청시 관리자에게 승인 요청이 보내집니다.</h5>
 <script language="javascript">
function windowAbsence_Search()
{
	window.open("absence_search", "newWin9", "width=600, height=600, toolbar=no, scrollbars=yes,location=no");
} 
function checkId() {
    var userinput = eval("document.commute_holyday_process_emp_sign_up");
    
    if (!userinput.emp_num.value) {
        alert("사원 번호를 입력하세요.");
        userinput.emp_num.focus();
        return false;
     }
    
    if (!userinput.status.value) {
        alert("결근 사유를 입력하세요.");
        userinput.status.focus();
        return false;
     }
}
</script> 
<div class="col-md-4">
<form name="commute_holyday_process_emp_sign_up" action="commute_holyday_process_emp_sign_up" method="post" onSubmit="return checkId()">
<table class="table table-striped" border="1" cellspacing="0" cellpadding="3" align="center"  >
<tr><td>
사원 번호 :
<input type="text" id="emp_num" name="emp_num" value="${emp_num}" readonly="readonly" class="form-control" style="width: 200px;"></td></tr>
<tr><td>사원 이름 : <input type="text" id="emp_name" name="emp_name" value="${emp_name }" readonly="readonly" class="form-control" style="width: 200px;" required="required"/></td></tr>
<tr><td>결근 사유 : <input type="text" id="status" name="status" class="form-control" style="width: 200px;" readonly="readonly" required="required"/><input type="button" value="결근 사유 검색" OnClick="javascript:windowAbsence_Search();" class="btn btn-primary btn-sm" /></td></tr>
<tr><td>시작 날짜 : <input type="date" name="start_day" class="form-control" style="width: 200px;" required="required"/></td></tr>
<tr><td>종료 날짜 : <input type="date" name="end_day" class="form-control" style="width: 200px;" required="required"/></td></tr>
<tr><td><input type=submit value="휴가 및 결근 신청" class="btn btn-info btn-sm"/></td></tr>
</table>
</form>
</div>
</body>
</html>