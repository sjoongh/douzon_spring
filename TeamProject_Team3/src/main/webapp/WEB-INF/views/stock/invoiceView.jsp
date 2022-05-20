<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>
<style>
.form-group {
	width: 90%;
}
</style>
<script language="javascript">   
function onlyNumber(event){
   event = event || window.event;
   var keyID = (event.which) ? event.which : event.keyCode;
   if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
      return;
   else
      return false;
}
</script>

<form action="invoiceModify" method="post"
	class="form-horizontal company" role="form">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">구매내역 상세</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<c:forEach items="${ list }" var="l">
				<input type="hidden" name="in_seq" value="${ l.in_seq }">
					<div class="form-group">
						<label for="st_code"
							class="col-md-2 col-md-offset-4 control-label"> <strong>물품코드</strong></label>
						<div class="col-md-3">
							<label class="control-label"> ${ l.st_code } <input
								type="hidden" name="st_code" value="${ l.st_code }">
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="st_name"
							class="col-md-2 col-md-offset-4 control-label"><strong>
								품 명</strong></label>
						<div class="col-md-3">
							<label class="control-label"> ${ l.st_name } <input
								type="hidden" name="st_name" value="${ l.st_name }"
								required="required">
							</label>
						</div>
					</div>


					<div class="form-group">
						<label for="st_std" class="col-md-2 col-md-offset-4 control-label">
							<strong> 규 격</strong>
						</label>
						<div class="col-md-3">
							<label class="control-label"> ${ l.st_std } <input
								type="hidden" name="st_std" value="${ l.st_std }"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="st_model"
							class="col-md-2 col-md-offset-4 control-label"> <strong>



								모 델</strong></label>
						<div class="col-md-3">
							<label class="control-label"> ${ l.st_model } <input
								type="hidden" name="st_model" value="${ l.st_model }"
								required="required"></label>
						</div>
					</div>

					<div class="form-group">
						<label for="st_man" class="col-md-2 col-md-offset-4 control-label">
							<strong> 제조회사</strong>
						</label>
						<div class="col-md-3">
							<label class="control-label"> ${ l.st_man } <input
								type="hidden" name="st_man" value="${ l.st_man }"></label>
						</div>
					</div>

					<div class="form-group">
						<label for="st_vendor"
							class="col-md-2 col-md-offset-4 control-label"> <strong>

								구매회사</strong></label>
						<div class="col-md-3">
							<label class="control-label"> ${ l.st_vendor } <input
								type="hidden" name="st_vendor" value="${ l.st_vendor }"></label>
						</div>
					</div>

					<div class="form-group">
						<label for="st_qty" class="col-md-2 col-md-offset-4 control-label">
							<strong> 수 량</strong>
						</label>
						<div class="col-md-3">
							<input type="number" name="st_qty" value="${ l.st_qty }"
								class="form-control" onkeydown="return onlyNumber(event)"
								required="required"> <input type="hidden"
								name="st_qty_org" value="${ l.st_qty }">
						</div>
					</div>
					<div class="form-group">
						<label for="st_unit"
							class="col-md-2 col-md-offset-4 control-label"> <strong>

								단 위 </strong></label>
						<div class="col-md-3">
							<label class="control-label">${ l.st_unit } <input
								type="hidden" name="st_unit" value="${ l.st_unit }">
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="in_price"
							class="col-md-2 col-md-offset-4 control-label"> <strong>
								단 가</strong></label>
						<div class="col-md-3">
							<input type="number" class="form-control" name="in_price"
								value="${ l.in_price }" required="required"
								onkeydown="return onlyNumber(event)"> <input
								type="hidden" name="in_price_org" value="${ l.in_price }">
						</div>
					</div>
					<div class="form-group">
						<label for="in_date"
							class="col-md-2 col-md-offset-4 control-label"> <strong>
								구매일자 </strong></label>
						<div class="col-md-3">
							<input type="date" class="form-control" name="in_date"
								value="${ l.in_date }" required="required"> <input
								type="hidden" name="in_date_org" value="${ l.in_date }">
						</div>
					</div>
					
					<div class="col-md-1 col-md-offset-4" align="center">
						<label for="" class="control-label"> <a href="invoiceList"
							class="btn btn-primary">목 록</a>
						</label>
					</div>

					<div class="col-md-2 " align="center">
						<secu:authorize
							access="hasAnyRole('ROLE_inventory_page2_master','ROLE_inventory_page2_anything')">

							<label for="" class="control-label"> <input type="submit"
								value="수 정" class="btn btn-warning">
							</label>
						</secu:authorize>
					</div>


					<div class="col-md-1 " align="center">
						<secu:authorize
							access="hasAnyRole('ROLE_inventory_page2_master','ROLE_inventory_page2_anything')">

							<label for="" class="control-label"> <a
								class="btn btn-danger"
								href="invoiceDelete?st_code=${ l.st_code }&st_model=${ l.st_model }&st_qty=${ l.st_qty }&in_date=${ l.in_date }">
									삭 제 </a>
							</label>
						</secu:authorize>
					</div>
				</c:forEach>
</form>