<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
<form action="reservationAdd" method="post">
	<table>

		<tr>
			<th>환자번호</th>
			<th>환자이름</th>
			<th>예약일자</th>
			<th>예약시간</th>
			<th></th>
		</tr>
		<tr>
			<td><input type="text" name="c_no"></td>
			<td><input type="text" name="c_name"></td>
			<td><input type="date" name="res_date"></td>
			<td><input type="time" name="res_time"></td>
			<td colspan="2"><input type="submit" value="예　약"></td>
		</tr>

	</table>
</form>
