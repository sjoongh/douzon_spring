<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	

<form action="hospital_modify" method="post" name="userinput">
	<table width="500" cellpadding="0" cellspacing="0" border="1"
		class="table table-condensed">
<script type="text/javascript">
 				document.userinput.marital_status.value="${hospital_content_view.marital_status}";
</script>
		<tr>
			<td>사원번호</td>
			<td>${hospital_content_view.emp_num}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${hospital_content_view.emp_name}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${hospital_content_view.telephone}</td>
		</tr>
		<tr>
			<td>비상연락망</td>
			<td>${hospital_content_view.telephone2}</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${hospital_content_view.address_number}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${hospital_content_view.address}</td>
		</tr>
		<tr>
			<td>부서코드</td>
			<td>${hospital_content_view.department_code}</td>
		</tr>
        <tr>
			<td>부서이름</td>
			<td>${hospital_content_view.department}	</td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td>${hospital_content_view.jumin_number}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${hospital_content_view.gender}</td>
		</tr>

		<tr>
			<td>입사일자</td>
			<td>${hospital_content_view.join_date}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${hospital_content_view.email}</td>
		</tr>
		<tr>
			<td>직책</td>
			<td>${hospital_content_view.duty_responsibility}</td>
		</tr>
		<tr>
			<td>직급</td>
			<td>${hospital_content_view.rank_position}</td>
		</tr>
		<tr>
			<td>근속일자</td>
			<td>${hospital_content_view.continuous_service_date}</td>
		</tr>
		<tr>
			<td>결혼여부</td>
			<td>
			${hospital_content_view.marital_status}
			</td>
		</tr>
		<tr>
			<td>예금주</td>
			<td>${hospital_content_view.account_holder}</td>
		</tr>
		<tr>
			<td>거래은행</td>
			<td>${hospital_content_view.bank_name}</td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>${hospital_content_view.account_number}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="창닫기" class="btn btn-danger btn-sm" onClick='window.close()'>&nbsp;&nbsp;
			</td>
		</tr>

	</table>
</form>

