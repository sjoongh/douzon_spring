<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<style>
.form-group {
	width: 90%;
}
</style>
<form action="user_update" method="post" class="form-horizontal company"
	role="form">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">계정 정보 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<div class="form-group">
					<label for="u_id" class="col-md-2 col-md-offset-4 control-label">
						<strong>ID (사번) </strong>
					</label>
					<div class="col-md-3">
						<h4 style="color: black">${user.u_id}</h4>
						<input type="hidden" name="u_id" value="${user.u_id}" id="u_id">
					</div>
				</div>
				<div class="form-group">
					<label for="u_pwd" class="col-md-2 col-md-offset-4 control-label">
						<strong>비밀번호</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_pwd" value="${user.u_pwd}"  required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 col-md-offset-4 control-label"> <strong>직책
					</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_position" value="${user.u_position}"  required="required"
							class="form-control">
					</div>


				</div>

				<div class="form-group">
					<label for="u_name" class="col-md-2 col-md-offset-4 control-label">
						<strong>이름</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_name" value="${user.u_name}"  required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="u_phone" class="col-md-2 col-md-offset-4 control-label">
						<strong>연락처</strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_phone" value="${user.u_phone}"  required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="u_team" class="col-md-2 col-md-offset-4 control-label">
						<strong>부서 </strong>
					</label>
					<div class="col-md-3">
						<input type="text" name="u_team" value="${user.u_team}"  required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-5 col-md-offset-4" align="right">
						<secu:authorize
							access="hasAnyRole('ROLE_admin_page2_master','ROLE_admin_page2_anything')">

							<label for="" class="control-label"><input type="submit"
								value="수정" class="btn btn-warning btn-sm"></label>
						</secu:authorize>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<secu:authorize access="hasRole('ROLE_admin_page2_master')">
							<c:if test="${user.u_id != 'admin'}">
							<label for="" class="control-label"><input type="button"
								value="권한수정" class="btn btn-success btn-sm"
								onclick="authority_page()"></label>
						</c:if>
						</secu:authorize>
						
						&nbsp;&nbsp;&nbsp;&nbsp; <label for="" class="control-label">
							<input type="button" value="뒤로가기" class="btn btn-primary btn-sm"
							onclick="window.history.back();">

						</label>

					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
	function authority_page() {
		var f = document.getElementById("u_id").value;
		window.location.href = "user_authority_modify?c_id=" + f;

	}
</script>