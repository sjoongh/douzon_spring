<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	
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
				.open("su_taxid_check", "newWin1",
						"width=500, height=500, toolbar=no, scrollbars=yes,location=no");
	}
</script>

<style>
.form-group {
	width: 90%;
}
</style>


<form action="supplierAdd" method="post" class="form-horizontal company"
	role="form">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">거래처 추가</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<div class="form-group">
					<label for="su_taxid"
						class="col-md-2 col-md-offset-4 control-label"> <strong>사업자등록번호</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="su_taxid" id="su_taxid" class="form-control"
							id="su_taxid" required="required" OnClick="javascript:windowOverlapSearch();">
					</div>
				</div>
				<div class="form-group">
					<label for="su_name" class="col-md-2 col-md-offset-4 control-label"><strong>
							거 래 처 명</strong></label>
					<div class="col-md-3">
						<input type="text" name="su_name" id="su_name"
							class="form-control" required="required">
					</div>
				</div>


				<div class="form-group">
					<label class="col-md-2 col-md-offset-4 control-label" for="su_ceo">
						<strong>대 표 자 명</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="su_ceo" id="su_ceo" class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="su_fndt" class="col-md-2 col-md-offset-4 control-label">
						<strong>창 립 일 자</strong>
					</label>
					<div class="col-md-3">
						<input type="date" name="su_fndt" id="su_fndt"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="su_addr" class="col-md-2 col-md-offset-4 control-label">
						<strong>업 체 주 소</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="su_addr" id="su_addr"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="su_phone"
						class="col-md-2 col-md-offset-4 control-label"> <strong>전
							화 번 호</strong></label>
					<div class="col-md-3">
						<input type="tel" name="su_phone" id="su_phone"
							class="form-control" required="required" onkeydown="return onlyNumber(event)">
					</div>
				</div>
				<div class="form-group">
					<label for="su_item" class="col-md-2 col-md-offset-4 control-label">
						<strong>거 래 품 목</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="su_item" id="su_item"
							class="form-control" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="su_mgr" class="col-md-2 col-md-offset-4 control-label">
						<strong>담 당 자 명</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="su_mgr" id="su_mgr" class="form-control" required="required">
					</div>
				</div>


				<div class="col-md-1 col-md-offset-5" align="right">
					<label for="" class="control-label"> <input type="submit"
						value="등록" class="btn btn-success form-control">
					</label>
				</div>
				<div class="col-md-3" align="center">
						<label for="" class="control-label"> <button onclick="window.history.back();"
									class="btn btn-danger form-control">뒤로가기</button></label>
				</div>
			</div>
		</div>
	</div>
</form>
