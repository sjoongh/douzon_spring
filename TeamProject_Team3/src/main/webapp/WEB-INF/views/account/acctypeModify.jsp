<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<style>
.form-group {
	width: 90%;
}
</style>
<script type="text/javascript">
</script>
<form action="acctypeModify" method="post" class="form-horizontal company" role="form">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">회계 분류 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<div class="form-group">
				<c:forEach items="${acctypeMo}" var="am">
					<label for="type_code" class="col-md-1 col-md-offset-4 control-label">
						<strong>코드번호 </strong>
					</label>
					<div class="col-md-3">
						<input type="hidden" name="type_code" value="${am.type_code}">${am.type_code}
					</div><br>
				</div>
				<div class="form-group">
					<label for="type_name" class="col-md-1 col-md-offset-4 control-label">
						<strong>코드명 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="type_name" id="type_name" class="form-control" value="${am.type_name}" required="required">
					</div>
				</div>
				</c:forEach>
					<div class="col-md-2 col-md-offset-4">
						<label for="" class="control-label"> <input type="submit"
							value="수정" class="btn btn-success btn-sm form-control">
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
