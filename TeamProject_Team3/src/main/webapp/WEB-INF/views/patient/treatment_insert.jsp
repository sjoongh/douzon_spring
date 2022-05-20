<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.form-group{
width: 90%;
}
</style>
<script type="text/javascript">
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
</script>
<form action="treatment_insert2" method="post" class="form-horizontal company"
	role="form">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">진료 추가</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">

				<div class="form-group">
					<label for="t_name" class="col-md-1 col-md-offset-4 control-label">
						<strong>진료 이름 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="t_name" class="form-control" id="t_name" required="required">
					</div>
					</div>
				<div class="form-group">
					<label for="t_pay" class="col-md-1 col-md-offset-4 control-label">
						<strong>진료 가격 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="t_pay" class="form-control" required="required" onkeydown="return onlyNumber(event)">
					</div>
				</div>
					<div class="col-md-2 col-md-offset-4">
						<label for="" class="control-label"> <input type="submit"
							value="추가" class="btn btn-success btn-sm form-control">
						</label>
					</div>
					<div class="col-md-2" >
						<label for="" class="control-label"><input type="button"
							value="뒤로가기" onclick="window.history.back();"
							class="btn btn-warning btn-sm form-control"> </label>
					</div>

				</div>
			</div>
		</div>
	</div>
</form>
