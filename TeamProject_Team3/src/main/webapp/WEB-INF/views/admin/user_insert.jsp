<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<style>
.form-group{
width: 90%;
}
</style>
<script language="javascript">
function checkId() {
    var userinput = eval("document.user_insert");
    
    if (!userinput.u_id.value) {
        alert("사원번호를 입력하세요.");
        userinput.u_id.focus();
        return false;
     }
}
</script>


<script type="text/javascript">
	function winOpen() {
		window
				.open("user_search", "newWin2",
						"width=500, height=500, toolbar=no, scrollbars=no, location=no");
	}
</script>
<form action="user_insert" name="user_insert" method="post" class="form-horizontal company"
	role="form" onSubmit="return checkId()">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">계정 추가</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<div class="form-group">
					<label for="u_id" class="col-md-2 col-md-offset-4 control-label">
						<strong>ID (사번) </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_id" class="form-control" id="u_id"
							value="${list.u_id}" readonly="readonly" required="required" readonly="readonly">
					</div>
					<div class="col-md-1">
						<input type="button" value="검색" onclick="winOpen()" class="btn btn-primary btn-sm" >
					</div>
				</div>
				<div class="form-group">
					<label for="u_pwd" class="col-md-2 col-md-offset-4 control-label"><strong>비밀번호
					</strong> </label>
					<div class="col-md-3">
						<input type="text" name="u_pwd" class="form-control"
							value="${list.u_id}" required="required" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="u_position" class="col-md-2 col-md-offset-4 control-label"> <strong>직책
					</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_position" value="${list.u_position}" id="u_position"
							class="form-control" required="required" readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<label for="u_name" class="col-md-2 col-md-offset-4 control-label">
						<strong>이름 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_name" class="form-control"
							value="${list.u_name}" required="required" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="u_phone" class="col-md-2 col-md-offset-4 control-label">
						<strong>연락처 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_phone" class="form-control"
							value="${list.u_phone}" required="required" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="u_team" class="col-md-2 col-md-offset-4 control-label">
						<strong>부서 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_team" class="form-control"
							value="${list.u_team}" required="required" readonly="readonly">
					</div>


					<div class="col-md-1 col-md-offset-6" align="center">
						<label for="" class="control-label"> <input type="submit"
							value="추가" class="btn btn-success btn-sm form-control">
						</label>
					</div>
					<div class="col-md-3" align="center">
						<label for="" class="control-label"><input type="button"
							value="뒤로가기" onclick="window.history.back();"
							class="btn btn-warning btn-sm form-control"> </label>
					</div>

				</div>
			</div>
		</div>
	</div>
</form>
