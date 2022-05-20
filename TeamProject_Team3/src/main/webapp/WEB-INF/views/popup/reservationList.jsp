<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/totalcss.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/total_js.js"></script>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">예약</h3>
	</div>


	<div id="popup_layer" class="panel-body">
		<div class="col-sm-offset-2 col-sm-10">
			<div class="panel-body">
				<div class="table-responsive" id="table">
					<form action="reservationAddP" method="post"
						class="form-horizontal">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th class="text-center">환자번호</th>
									<th class="text-center">환자이름</th>
									<th class="text-center">예약일자</th>
									<th class="text-center">예약시간</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<c:if test="${ c_no ne null and c_name ne null }">
								<tbody>
									<tr>
										<td class="text-center">${ c_no }<input type="hidden"
											name="c_no" value="${ c_no }">
										</td>
										<td class="text-center">${ c_name }<input type="hidden"
											name="c_name" value="${ c_name }">
										</td>
										<td class="text-center"><input type="date" name="res_date" id="res_date" onchange="showDate()"></td>
										<td class="text-center"><input type="time"
											name="res_time"></td>
										<td class="text-center" colspan="2"><input type="submit"
											class="btn btn-info btn-sm" value="예 약"></td>
									</tr>
								</tbody>
							</c:if>
						</table>
					</form>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="panel-body">
					<div class="table-responsive" id="table">
						<table class="table table-condensed table-hover">
							<thead>
								<tr>
									<th class="text-center">환자번호</th>
									<th class="text-center">환자이름</th>
									<th class="text-center">예약일자</th>
									<th class="text-center">예약시간</th>
									<th class="text-center">삭 제</th>
								</tr>
							</thead>
						</table>
						<div id="resDate">
							<table class="table table-condensed table-hover">
								<c:forEach items="${ list }" var="l">
									<form action="reservationDelete" method="post">
										<tbody>
											<tr>
												<td class="text-center">${ l.c_no }<input type="hidden"
													name="c_no" value="${ l.c_no }">
												</td>
												<td class="text-center">${ l.c_name }<input
													type="hidden" name="c_name" value="${ l.c_name }">
												</td>
												<td class="text-center">${ l.res_date }<input
													type="hidden" name="res_date" value="${ l.res_date }">
												</td>
												<td class="text-center">${ l.res_time }<input
													type="hidden" name="res_time" value="${ l.res_time }">
												</td>
												<td class="text-center"><input type="submit"
													value="삭　제"></td>
											</tr>
										</tbody>
									</form>
								</c:forEach>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
		$("#res_date").change(
				
				function showDate() {
					
					var date = $("#res_date").val();

					$.ajax({
						type : 'post',
						url : 'reservationResult',
						data : {
							res_data : date
						},
						success : function(result) {

							console.log(result);

							var content = "<table class='table table-condensed table-hover'>";
							var list = result['list'];

							for (i = 0;i<list.length;i++) {
								content += "<tbody><tr>";
								content += "<td class='text-center'>"
										+ result.list[i].c_no + "</td>";
								content += "<td class='text-center'>"
										+ result.list[i].c_name + "</td>";
								content += "<td class='text-center'>"
										+ result.list[i].res_date + "</td>";
								content += "<td class='text-center'>"
										+ result.list[i].res_time + "</td><td></td>";
								content += "</tr></tbody>";
							}
							content += "</table>";
							
							console.log(content);
							$("#resDate").html(content);
						}
					});
 				});
	});
</script>