<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 퇴사 처리</title>
</head>
<body>

<script language="javascript">
function checkId()
{
	var userinput = eval("document.resignation_sign_up");
	  if (!userinput.emp_num.value) {
	         alert("사원 번호를 입력하세요.");
	         return false;
	      }
	  if (!userinput.emp_name.value) {
	         alert("사원 이름을 입력하세요.");
	         return false;
	      }
	  if (!userinput.retire_date.value) {
	         alert("퇴사 날짜를 입력하세요.");
	         return false;
	      }
	}

function winOpen(emp_num,emp_name)
{
	document.getElementById("emp_num").value =emp_num;
	document.getElementById("emp_name").value =emp_name;
}  
/* function winOpen2()
{
	   document.resignation_sign_up.submit(); 
}  */
</script> 
	<h3 align="center">[사원 리스트]</h3>
	
	<table width=100% cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<tr>
			<td>사원 번호</td>
			<td>사원 이름</td>
			<td>입사 일자</td>
			<td>근속 기간</td>
		</tr>
		
		<c:forEach items="${resignation_list}" var="dto">
			<tr>
				<td>${dto.emp_num}</td>
				<td><input type = "text" onClick = "winOpen ('${dto.emp_num}','${dto.emp_name}')" value ="${dto.emp_name}" readonly="readonly" style="width: 100px;"/></td>
				<td>${dto.join_date}</td>
				<td>${dto.continuous_service_date}</td>
			</tr>
		</c:forEach>
		</tr>
	</table>
	<form name="resignation_sign_up" action="resignation_sign_up" method="post" onSubmit="return checkId()">
			<h5 align="center"><font color="blue">[퇴사 처리할 사원의 이름을 클릭하고 퇴사 날짜를 선택해주세요]</font></h4>
	<div align="center">
			<input type="text"  name="emp_num" id="emp_num" style="width: 65px;" readonly="readonly" placeholder="사원번호"/>
			<input type="text"  name="emp_name" id="emp_name" style="width: 65px;" readonly="readonly" placeholder="사원이름"/>
			<input type="date"  name="retire_date" style="width: 130px;" /></div><br>
	<div align="center"><input type="submit" value="퇴사자 등록"  class="btn btn-primary btn-sm" readonly="readonly" style="width: 90px;"/> <!-- onClick="winOpen2()" -->
			<input type="button" value="창닫기" onClick='window.close()' class="btn btn-danger btn-sm"/> </div>
	</form>
</body>
</html>