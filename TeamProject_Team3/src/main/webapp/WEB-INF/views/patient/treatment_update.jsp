<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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

<form action="treatment_update" method="post">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">계정 정보 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">

				<table id="user_table" class="table table-bordered">
					<tbody>

						<tr>
							<td class="text-center gr"><strong>진료코드 :</strong></td>
							<td>${update.t_code}<input type="hidden" name="t_code"
								value="${update.t_code}"></td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>진료이름 :</strong></td>
							<td><input type="text" name="t_name" value="${update.t_name}" required="required"></td>
						</tr>
						
						<tr>
							<td class="text-center gr"><strong>진료가격 :</strong></td>
							<td><input type="text" name="t_pay" value="${update.t_pay}" required="required" onkeydown="return onlyNumber(event)"></td>
						</tr>

					</tbody>
				</table>
				<div align="right">
					<input type="submit" value="수정" class="btn btn-warning btn-sm">
					&nbsp;&nbsp; <input type="button" value="뒤로가기"
						class="btn btn-primary btn-sm" onclick="window.history.back();">
				</div>
			</div>
		</div>
	</div>
</form>
