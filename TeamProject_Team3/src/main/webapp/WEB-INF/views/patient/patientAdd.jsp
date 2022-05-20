<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<style type="text/css">
body {
	text-align: center;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
	padding: 10px;
	text-align: center;
	width: 800px;
}

tr {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #FFFFCC;
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align: center;
}

td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align: center;
}
</style>

<h1>신규환자등록</h1>
<form action="" method="post">
	<div style="text-align: left;">
		&nbsp; &nbsp; ▷ 이 름 : <input type="text" name="m_name" size="10"><br>
		&nbsp; &nbsp; ▷ 주민번호 : <input type="text" name="m_jumin1" size="10">
		- <input type="text" name="m_jumin2" size="10"> &nbsp; &nbsp;
		<input type="submit" value="검색"> <br>
		<br>
	</div>
</form>
<hr>
Medical Table Result
<br>
<br>
<form action="patientAdd" method="post">
	<table>
		<tr>
			<th>고유번호</th>
			<th>이 름</th>
			<th>성 별</th>
			<th colspan="2">주민등록번호</th>
			<th>주 소</th>
			<th>전화번호</th>
		</tr>
		<c:forEach items="${ list }" var="m">
			<tr>
				<td>${ m.m_no } <input type="hidden" name="c_no"
					value="${ m.m_no }">
				</td>
				<td>${ m.m_name } <input type="hidden" name="c_name"
					value="${ m.m_name }">
				</td>
				<td>${ m.m_gender } <input type="hidden" name="c_gender"
					value="${ m.m_gender }">
				</td>
				<td>${ m.m_jumin1 } <input type="hidden" name="c_jumin1"
					value="${ m.m_jumin1 }">
				</td>
				<td>${ m.m_jumin2 } <input type="hidden" name="c_jumin2"
					value="${ m.m_jumin2 }">
				</td>
				<td>${ m.m_address } <input type="hidden" name="c_address"
					value="${ m.m_address }">
				</td>
				<td>${ m.m_phone } <input type="hidden" name="c_phone"
					value="${ m.m_phone }">
				</td>
			</tr>
			</c:forEach>
			<tr><td colspan="6">담당의사 : <select name="c_doctor">
					<c:forEach items="${doctor}" var="dc">
						<option value="${dc.emp_name}"/>${dc.emp_name}</option>
					</c:forEach>
				</select>
				</td>
				<td><input type="submit" value="등록(추가)"></td>
			</tr>
		
	</table>
</form>
<hr>
