<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">접 수</h3>
	</div>
	<div>
		<secu:authorize
			access="hasAnyRole('ROLE_reservation_page2_master','ROLE_reservation_page2_anything','ROLE_reservation_page2_readWrite')">
			<div class="panel-body">
				<div class="table-responsive" id="table">
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr>
								<th class="text-center sky col-md-2">이 름</th>
								<th class="text-center sky col-md-2">진료비</th>
								<th class="text-center sky col-md-2">분 류</th>
								<th class="text-center sky col-md-2"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ payment }" var="p">
								<form action="paymentDelete" method="post">
									<input type="hidden" name="c_no" value="${ p.c_no }">
									<tr>
										<td class="text-center">${ p.c_name }<input type="hidden"
											name="c_name" value="${ p.c_name }">
										</td>
										<td class="text-center">${ p.t_pay }<input type="hidden"
											name="t_pay" value="${ p.t_pay }">
										</td>
										<td class="text-center"><select name="type_name">
												<c:forEach items="${ type }" var="t">
													<option value="${ t.type_name }"
														${ t.type_name eq '진료/검사' ? 'selected' : '' }>${ t.type_name }</option>
												</c:forEach>
										</select></td>
										<td class="text-center"><input type="submit" value="결　제"></td>
									</tr>
								</form>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</secu:authorize>
	</div>
	<div class="panel-body">
		<div class="table-responsive" id="table">
		
				<table class="table table-condensed table-hover table-bordered">
					<thead>
						<tr>
							<th class="text-center sky col-md-2">환자번호</th>
							<th class="text-center sky col-md-2">환자이름</th>
							<th class="text-center sky col-md-2">예약시간</th>
							<th class="text-center sky col-md-2"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ today }" var="l">
							<form action="receptionAdd" method="post">
							<tr>
								<td class="text-center">${ l.c_no }<input type="hidden"
									name="c_no" value="${ l.c_no }">
								</td>
								<td class="text-center">${ l.c_name }<input type="hidden"
									name="c_name" value="${ l.c_name }">
								</td>
								<td class="text-center">${ l.res_time }</td>
								<td class="text-center"><input type="submit" value="접　수">
								</td>
							</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			
		</div>
	</div>

	<div class="panel-body">
		<div class="table-responsive" id="table">

			<table class="table table-condensed table-hover table-bordered">
				<thead>
					<tr>
						<th class="text-center sky col-md-2">환자번호</th>
						<th class="text-center sky col-md-2">환자이름</th>
						<th class="text-center sky col-md-4">접수일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="l">
						<form action="receptionDelete" method="post">
							<input type="hidden" name="r_no" value="${ l.r_no }">
						<tr>
							<td class="text-center">${ l.c_no }<input type="hidden"
								name="c_no" value="${ l.c_no }">
							</td>
							<td class="text-center">${ l.c_name }<input type="hidden"
								name="c_name" value="${ l.c_name }">
							</td>
							<td class="text-center">
								<%-- ${ l.rec_date } --%> <fmt:formatDate
									value="${ l.rec_date }" pattern="yyyy-MM-dd a hh:mm" /> <input
								type="hidden" name="rec_date" value="${ l.rec_date }">
							</td>
						</tr>
						</form>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</div>
