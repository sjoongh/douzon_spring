<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.form-group{
width: 90%;
}
</style>
<script type="text/javascript">
</script>
<form action="prescription_insert2" method="post" class="form-horizontal company"
	role="form">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">처방 추가</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">

				<div class="form-group">
					<label for="pre_name" class="col-md-1 col-md-offset-4 control-label">
						<strong>처방 품명 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="pre_name" class="form-control" id="pre_name" required="required">
					</div></div>
					
				<div class="form-group">
					<label for="pre_way" class="col-md-1 col-md-offset-4 control-label">
						<strong>처방 용법 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="pre_way" class="form-control" required="required">
					</div>
				</div>
					<div class="col-md-2 col-md-offset-4">
						<label for="" class="control-label"> <input type="submit"
							value="추가" class="btn btn-success btn-sm form-control">
						</label>
					</div>
					<div class="col-md-2">
						<label for="" class="control-label"><input type="button"
							value="뒤로가기" onclick="window.history.back();"
							class="btn btn-warning btn-sm form-control"> </label>
					</div>

				</div>
			</div>
		</div>
	
	</div>
</form>
