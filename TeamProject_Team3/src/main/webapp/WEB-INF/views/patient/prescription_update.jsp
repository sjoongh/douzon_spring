<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<form action="prescription_update" method="post">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">처방 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">

				<table id="user_table" class="table table-bordered">
					<tbody>

						<tr>
							<td class="text-center gr"><strong>처방코드 :</strong></td>
							<td>${update.pre_code}<input type="hidden" name="pre_code"
								value="${update.pre_code}"></td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>처방품명 :</strong></td>
							<td><input type="text" name="pre_name" value="${update.pre_name}" required="required"></td>
						</tr>
						
						<tr>
							<td class="text-center gr"><strong>처방용법 :</strong></td>
							<td><input type="text" name="pre_way" value="${update.pre_way}" required="required"></td>
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
