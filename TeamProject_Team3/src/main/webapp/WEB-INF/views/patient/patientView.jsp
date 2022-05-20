<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function windowprescription_list() {

		var p = document.getElementById("c_no").value;
		window
				.open("prescription_list?c_no=" + p, "newWin1",
						"width=800, height=350, toolbar=no, scrollbars=yes,location=no");
	}

	function windowtreatment_list() {
		var f = document.getElementById("c_no").value;
		window
				.open("treatment_list?c_no=" + f, "newWin1",
						"width=700, height=350, toolbar=no, scrollbars=yes,location=no");
	}

	function recvCheckList(list) {
		console.log(list);
		var str = JSON.stringify(list);
		document.getElementById("treatment_send_list").value = str;
		for (var i = 0; i < list.length; i++) {
			var row = list[i];
			var tr = $('<tr>');
			var tdCode = $('<td class="text-center">').text(row.code);
			var tdName = $('<td class="text-center">').text(row.name);
			var tdContent = $('<td class="text-center">').text(row.content);
			var tdFee = $('<td class="text-center">').text(row.fee);
			tr.append(tdCode).append(tdName).append(tdContent).append(tdFee);
			$('#patient_jin_tbody').append(tr);
		}
	}

	function preCheckList(list) {
		console.log(list);
		var str1 = JSON.stringify(list);
		document.getElementById("prescription_send_list").value = str1;
		for (var i = 0; i < list.length; i++) {
			var row = list[i];
			var tr = $('<tr>');
			var tdCode = $('<td class="text-center">').text(row.code2);
			var tdName = $('<td class="text-center">').text(row.name2);
			var tdDay = $('<td class="text-center">').text(row.day);
			var tdTotal = $('<td class="text-center">').text(row.total);
			var tdWay = $('<td class="text-center">').text(row.way);
			tr.append(tdCode).append(tdName).append(tdDay).append(tdTotal)
					.append(tdWay);
			$('#patient_pre_tbody').append(tr);
		}
	}

	function reservation() {

		var c_no = document.getElementById("c_no").value;
		var c_name = document.getElementById("c_name").value;

		window
				.open("reservationPatient?c_no=" + c_no + "&c_name=" + c_name,
						"newWin",
						"width=700, height=550, toolbar=no, scrollbars=yes,location=no");
	}
</script>

<%
	String c_no = request.getParameter("c_no");
%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">환자상세보기</h3>
	</div>
	<div class="panel-body" style="padding-top: 30px;">
		<div id="c_info" class="col-md-12 table-condensed">
			<form action="patientView" method="post" class="form-horizontal">
				<table class="table table-bordered">
					<c:forEach items="${ customer_view }" var="cv">
						<input type="hidden" value="${ cv.c_no }" name="c_no" id="c_no">
						<tr class="active">
							<th class="text-center">이 름</th>
							<th class="text-center">성 별</th>
							<th class="text-center">생년월일</th>
							<th class="text-center">주 소</th>
							<th class="text-center">전화번호</th>
							<th class="text-center">담당의사</th>
							<th class="text-center"></th>
							<th class="text-center"></th>
						</tr>
						<tr>
							<td class="text-center">${ cv.c_name }<input type="hidden"
								value="${ cv.c_name }" name="c_name" id="c_name"></td>
							<td class="text-center">${ cv.c_gender }<input type="hidden"
								value="${ cv.c_gender }" name="c_gender"></td>
							<td class="text-center">${ cv.c_jumin1 }<input type="hidden"
								value="${ cv.c_jumin1 }" name="c_jumin1"></td>
							<td class="text-center"><input type="text"
								class="form-control input-sm" value="${ cv.c_address }" name="c_address"></td>
							<td class="text-center"><input type="text"
								class="form-control input-sm" value="${ cv.c_phone }" name="c_phone"></td>
							<td class="text-center"><select name="c_doctor"
								class="form-control input-sm">
									<c:forEach items="${doctor}" var="dc">
										<option value="${dc.emp_name}"
											${ dc.emp_name eq cv.c_doctor ? 'selected' : '' }>${dc.emp_name}</option>
									</c:forEach>
							</select></td>
							<td class="text-center"><input type="submit"
								class="btn btn-warning btn-sm" value="정보수정"></td>
							<td class="text-center"><a onclick="reservation()"
								class="btn btn-danger btn-sm">예 약</a></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
	<div class="panel-body">
		<div id="t_info" class="col-md-6">
			<form action="treatment_prescriptionAdd" method="post">
				<input type="hidden" id="treatment_send_list"
					name="treatment_send_list" /> <input type="hidden" name="c_no"
					value="<%= c_no %>"> <br> <br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="text-center">진료코드</th>
							<td class="text-center">진료이름</th>
							<td class="text-center">진료내용</th>
							<td class="text-center">가격</th>
						</tr>
					</thead>
					<tbody id="patient_jin_tbody">
						<c:forEach items="${customer_view2}" var="cv2">
							<tr>
								<td class="text-center">${cv2.t_code }</td>
								<td class="text-center">${cv2.t_name }</td>
								<td class="text-center">${cv2.t_content}</td>
								<td class="text-center">${cv2.t_pay }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tr>
						<td colspan="4"><input type="button"
							class="btn btn-info btn-sm" name="treatment_add" value="진료추가"
							OnClick="javascript:windowtreatment_list();"></td>
					</tr>
				</table>
		</div>

		<div class="col-md-6">
			<input type="hidden" id="prescription_send_list"
				name="prescription_send_list" /> <input type="hidden" name="c_no"
				value="<%= c_no %>"> <br> <br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="text-center">처방코드</td>
						<td class="text-center">처방제품</td>
						<td class="text-center">1일투여횟수</td>
						<td class="text-center">총투약일수</td>
						<td class="text-center">처방용법</td>
					</tr>
				</thead>
				<tbody id="patient_pre_tbody">
					<c:forEach items="${customer_view3}" var="cv3">
						<tr>
							<td class="text-center">${cv3.pre_code }</td>
							<td class="text-center">${cv3.pre_name }</td>
							<td class="text-center">${cv3.pre_day}</td>
							<td class="text-center">${cv3.pre_total }</td>
							<td class="text-center">${cv3.pre_way }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr><td style="border-right: none;">
				<input type="button" class="btn btn-info btn-sm"
				name="prescription_list" value="처방추가"
				OnClick="javascript:windowprescription_list();">
				</td>
				<td colspan="4" style="border-left: none;">  <input
				type="submit" class="btn btn-success btn-sm" value="저장">
				</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<div class="panel-body">
		<div class="clear col-md-12">
			<div class="col-md-4">
				<table class="table table-bordered">
					<tr>
						<td class="text-center">진료일자</td>
					</tr>
					<c:forEach items="${date}" var="d">
						<tr>
							<form>
								<td class="text-center">
									<input type="hidden" name="c_no" value="<%= c_no %>">
									<input type="hidden" name="patient_treatment_no" value="${ d.patient_treatment_no }">
									<input type="hidden" name="t_date" value="${d.t_date }">
									 <input type="submit" value="${d.t_date }" class="btn btn-default btn-sm">
								</td>
							</form>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-4">
				<table class="table table-bordered">
					<tr>
						<td class="text-center">진료종류</td>
						<td class="text-center">진료내용</td>

					</tr>

					<c:forEach items="${treatment_date}" var="td">
						<tr>
							<td class="text-center">${td.t_name }</td>
							<td class="text-center">${td.t_content}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div class="col-md-4">
				<table class="table table-bordered">
					<tr>
						<td class="text-center">처방코드</td>
						<td class="text-center">처방품명</td>
					</tr>

					<c:forEach items="${prescription_date}" var="pd">
						<tr>
							<td class="text-center">${pd.pre_code }</td>
							<td class="text-center">${pd.pre_name }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>