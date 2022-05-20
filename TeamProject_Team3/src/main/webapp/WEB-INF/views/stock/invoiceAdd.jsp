<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.form-group {
	width: 90%;
}
</style>

<script language="javascript">
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}
	function windowOverlapSearch() {
		window
				.open("st_code_check", "newWin1",
						"width=500, height=500, toolbar=no, scrollbars=yes,location=no");
	}
</script>

<form action="invoiceAdd" method="post" class="form-horizontal company"
	role="form">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">구매내역 추가</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">

				<div class="form-group">
					<label for="st_code" class="col-md-2 col-md-offset-4 control-label">
						<strong>물품코드</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="st_code" id="st_code" class="form-control" required="required"
							onkeydown="return onlyNumber(event)" OnClick="javascript:windowOverlapSearch();">
					</div>
				</div>
				<div class="form-group">
					<label for="st_name" class="col-md-2 col-md-offset-4 control-label"><strong>품
							명</strong></label>
					<div class="col-md-3">
						<input type="text" name="st_name" id="st_name"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="st_std" class="col-md-2 col-md-offset-4 control-label">
						<strong>규 격</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="st_std" id="st_std" class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="st_model"
						class="col-md-2 col-md-offset-4 control-label"> <strong>
							모 델</strong></label>
					<div class="col-md-3">
						<input type="text" name="st_model" id="st_model"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="st_man" class="col-md-2 col-md-offset-4 control-label">
						<strong>제조회사</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="st_man" id="st_man" class="form-control" required="required">
					</div>
				</div>

				<div class="form-group">
					<label for="st_vendor"
						class="col-md-2 col-md-offset-4 control-label"> <strong>구매회사</strong></label>
					<div class="col-md-3">
						<input type="text" name="st_vendor" id="st_vendor"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="st_qty" class="col-md-2 col-md-offset-4 control-label">
						<strong>수 량</strong>
					</label>
					<div class="col-md-3">
						<input type="number" name="st_qty" id="st_qty"
							class="form-control" required="required" onkeydown="return onlyNumber(event)">
					</div>
				</div>
				<div class="form-group">
					<label for="st_unit" class="col-md-2 col-md-offset-4 control-label">
						<strong>단 위</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="st_unit" id="st_unit"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="in_price"
						class="col-md-2 col-md-offset-4 control-label"> <strong>단
							가</strong></label>
					<div class="col-md-3">
						<input type="number" name="in_price" id="in_price"
							class="form-control" required="required" onkeydown="return onlyNumber(event)">
					</div>
				</div>
				<div class="form-group">
					<label for="in_date" class="col-md-2 col-md-offset-4 control-label">
						<strong>구매일자</strong>
					</label>
					<div class="col-md-3">
						<input type="date" name="in_date" id="in_date"
							class="form-control" required="required">
					</div>
				</div>
				
				<div class="form-group">
					<label for="in_date" class="col-md-2 col-md-offset-4 control-label">
						<strong>회계분류</strong>
					</label>
					<div class="col-md-3">
						<select name="type_name" required="required" class="form-control">
									<c:forEach items="${ type }" var="t">
										<option value="${ t.type_name }">${ t.type_name }</option>
									</c:forEach>
							</select>
					</div>
				</div>

				<div class="col-md-1 col-md-offset-5" align="right">
					<label for="" class="control-label"><input type="submit"
						value="등록" class="btn btn-success form-control"> </label>
						</div>
					<div class="col-md-2 col-md-offset-1" align="left">
						<label for="" class="control-label"> <button onclick="window.history.back();"
									class="btn btn-danger form-control">뒤로가기</button></label>
					</div>


				</div>
			
		</div>
	</div>
</form>
