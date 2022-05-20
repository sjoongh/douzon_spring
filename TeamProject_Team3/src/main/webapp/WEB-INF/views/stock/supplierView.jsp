<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags" %>

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
</script>

<form action="supplierModify" method="post" class="form-horizontal company"
	role="form">
	<c:forEach items="${ list }" var="l">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">거래처 상세보기 및 수정</h3>
		</div>
		<div class="panel-body">
				<div class="table-responsive">
					<div class="form-group">
						<label for="su_taxid"
							class="col-md-2 col-md-offset-4 control-label"> <strong>사업자등록번호</strong>
						</label>
						<div class="col-md-3">
							<label class="control-label">${ l.su_taxid }</label> <input
								type="hidden" name="su_taxid" value="${ l.su_taxid }">
						</div>
					</div>
					<div class="form-group">
						<label for="su_name"
							class="col-md-2 col-md-offset-4 control-label"><strong>
								거 래 처 명</strong></label>
						<div class="col-md-3">
							<label class="control-label">${ l.su_name }</label> <input
								type="hidden" name="su_name" value="${ l.su_name }">
						</div>
					</div>


					<div class="form-group">
						<label class="col-md-2 col-md-offset-4 control-label" for="su_ceo">
							<strong>대 표 자 명</strong>
						</label>
						<div class="col-md-3">
							<label class="control-label">${ l.su_ceo }</label> <input
								type="hidden" name="su_ceo" value="${ l.su_ceo }">
						</div>
					</div>
					<div class="form-group">
						<label for="su_fndt"
							class="col-md-2 col-md-offset-4 control-label"> <strong>창
								립 일 자</strong>
						</label>
						<div class="col-md-3">
							<label class="control-label">${ l.su_fndt }</label> <input
								type="hidden" name="su_fndt" value="${ l.su_fndt }">
						</div>
					</div>
					<div class="form-group">
						<label for="su_addr"
							class="col-md-2 col-md-offset-4 control-label"> <strong>업
								체 주 소</strong>
						</label>
						<div class="col-md-3">
							<input type="text" name="su_addr" value="${ l.su_addr }"
								required="required" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="su_phone"
							class="col-md-2 col-md-offset-4 control-label"> <strong>전
								화 번 호</strong></label>
						<div class="col-md-3">
							<input type="text" name="su_phone" value="${ l.su_phone }"
								required="required" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="su_item"
							class="col-md-2 col-md-offset-4 control-label"> <strong>거
								래 품 목</strong>
						</label>
						<div class="col-md-3">
							<input type="text" name="su_item" value="${ l.su_item }"
								required="required" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="su_mgr" class="col-md-2 col-md-offset-4 control-label">
							<strong>담 당 자 명</strong>
						</label>
						<div class="col-md-3">
							<input type="text" name="su_mgr" value="${ l.su_mgr }"
								required="required" class="form-control">
						</div>
					</div>


					<div class="col-md-4 col-md-offset-4">
						<div class="col-md-4"  align="center">
							<label for="" class="control-label"> <input type="submit"
								value="수 정" class="btn btn-success form-control">
							</label>
						</div>
						<div class="col-md-4"  align="center">
							<label for="" class="control-label"> <a
								href="supplierDelete?su_taxid=${ l.su_taxid }"
								class="btn btn-danger">삭 제</a>
							</label>
						</div>
						<div class="col-md-4"  align="center">
							<label for="" class="control-label">
								<button onclick="window.history.back();"
									class="btn btn-primary form-control">뒤로가기</button>
							</label>
						</div>
					</div>
				</div>
			</div>
	</div>
	</c:forEach>
</form>

<%-- 	
	<table>
		<c:forEach items="${ list }" var="l">

			<tr>
				<th>사업자등록번호</th>
				<td>${ l.su_taxid }<input type="hidden" name="su_taxid"
					value="${ l.su_taxid }">
				</td>
			</tr>
			<tr>
				<th>거 래 처 명</th>
				<td>${ l.su_name }<input type="hidden" name="su_name"
					value="${ l.su_name }">
				</td>
			</tr>
			<tr>
				<th>대 표 자 명</th>
				<td>${ l.su_ceo }<input type="hidden" name="su_ceo"
					value="${ l.su_ceo }">
				</td>
			</tr>
			<tr>
				<th>창 립 일 자</th>
				<td>${ l.su_fndt }<input type="hidden" name="su_fndt"
					value="${ l.su_fndt }">
				</td>
			</tr>
			<tr>
				<th>업 체 주 소</th>
				<td><input type="text" name="su_addr" value="${ l.su_addr }"
					required="required"></td>
			</tr>
			<tr>
				<th>전 화 번 호</th>
				<td><input type="tel" name="su_phone" value="${ l.su_phone }"
					required="required" onkeydown="return onlyNumber(event)"></td>
			</tr>
			<tr>
				<th>거 래 품 목</th>
				<td><input type="text" name="su_item" value="${ l.su_item }"
					required="required"></td>
			</tr>
			<tr>
				<th>담 당 자 명</th>
				<td><input type="text" name="su_mgr" value="${ l.su_mgr }"
					required="required"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right"><secu:authorize
						access="hasAnyRole('ROLE_inventory_page3_master','ROLE_inventory_page3_anything')">
						<input type="submit" value="수　정">
					</secu:authorize> &nbsp; <secu:authorize
						access="hasAnyRole('ROLE_inventory_page3_master','ROLE_inventory_page3_anything')">
						<a href="supplierDelete?su_taxid=${ l.su_taxid }">삭 제</a>
					</secu:authorize> &nbsp; <a href="supplierList">목 록</a></td>
			</tr>

		</c:forEach>
	</table>
</form>
 --%>