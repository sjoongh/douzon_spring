<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">구매 내역</h3>
	</div>

	<div class="panel-body">
		<div class="col-md-8 col-md-offset-2 form-group table-responsive">
			<form action="invoiceList" name="search" method="post"
				class="form-horizontal">
				<div class="form-group">
					<label for="st_vendor" class="col-md-3 control-label">거래처명</label>
					<div class="col-md-7">
						<select name="st_vendor" class="form-control" id="st_vendor">
							<option value="">전 체</option>
							<c:forEach items="${ list }" var="l">
								<option value="${ l.st_vendor }">${ l.st_vendor }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-1">
						<input type="submit" value="검색" class="btn btn-default">
					</div>

				</div>

				<script type="text/javascript">
					document.search.st_vendor.value = "${ l.st_vendor }";
				</script>



				<div class="form-group">
					<label for="inputPassword3" class="col-md-3 control-label">
						기 간</label>
					<div class="col-md-3">
						<input id="start" type="date" name="start" class="form-control"
							style="font-size: 90%" value="${ start }" required="required">
					</div>
					<label class="col-md-1 control-label" style="text-align: center;">~</label>
					<div class="col-md-3">
						<input type="date" name="end" class="form-control"
							style="font-size: 90%" value="${ end }" required="required">
					</div>
				</div>


			</form>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive" id="table">


			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">물품코드</th>
						<th class="text-center">품 명</th>
						<th class="text-center">규 격</th>
						<th class="text-center">모 델</th>
						<th class="text-center">구 매 처</th>
						<th class="text-center">구매일자</th>
						<th class="text-center">상세보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="l">
						<form action="invoiceView" method="post" class="form-horizontal">
							<tr>
								<td class="text-center">${ l.st_code }<input type="hidden"
									name="st_code" value="${ l.st_code }">
								</td>
								<td class="text-center">${ l.st_name }<input type="hidden"
									name="st_name" value="${ l.st_name }">
								</td>
								<td class="text-center">${ l.st_std }<input type="hidden"
									name="st_std" value="${ l.st_std }">
								</td>
								<td class="text-center">${ l.st_model }<input type="hidden"
									name="st_model" value="${ l.st_model }">
								</td>
								<td class="text-center">${ l.st_vendor }<input
									type="hidden" name="st_man" value="${ l.st_vendor }">
								</td>
								<td class="text-center">${ l.in_date }<input type="hidden"
									name="in_date" value="${ l.in_date }">
								</td>
								<td class="text-center"><input type="submit" value="상세보기"
									class="btn btn-sm btn-info"></td>
							</tr>
						</form>
					</c:forEach>
					<tr>
						<td colspan="7" class="thick-line text-right"><secu:authorize
								access="hasAnyRole('ROLE_inventory_page2_master','ROLE_inventory_page2_anything','ROLE_inventory_page2_readWrite')">
								<a href="invoiceAdd" class="btn btn-success btn-sm">구매내역 추가</a>
							</secu:authorize></td>

					</tr>
				</tbody>
			</table>

		</div>
	</div>
</div>


