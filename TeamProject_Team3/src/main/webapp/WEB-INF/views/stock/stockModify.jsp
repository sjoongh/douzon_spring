<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.form-group {
	width: 90%;
}
</style>

<form action="stockModify" method="post" class="form-horizontal company" role="form">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">재고 수량 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<c:forEach items="${ list }" var="l">
					<div class="form-group">
						<label for="st_code"
							class="col-md-2 col-md-offset-4 control-label"> <strong>물품코드</strong></label>
						<div class="col-md-2">
							<label class="control-label"> ${ l.st_code } <input
								type="hidden" name="st_code" value="${ l.st_code }">
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="st_name"
							class="col-md-2 col-md-offset-4 control-label"><strong>
								품 명</strong></label>
						<div class="col-md-2">
							<label class="control-label"> ${ l.st_name } <input
								type="hidden" name="st_name" value="${ l.st_name }">
							</label>
						</div>
					</div>


					<div class="form-group">
						<label for="st_std" class="col-md-2 col-md-offset-4 control-label">
							<strong> 규 격</strong>
						</label>
						<div class="col-md-2">
							<label class="control-label"> ${ l.st_std } <input
								type="hidden" name="st_std" value="${ l.st_std }"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="st_model"
							class="col-md-2 col-md-offset-4 control-label"> <strong>
								모 델</strong></label>
						<div class="col-md-2">
							<label class="control-label"> ${ l.st_model } <input
								type="hidden" name="st_model" value="${ l.st_model }"></label>
						</div>
					</div>

					<div class="form-group">
						<label for="st_man" class="col-md-2 col-md-offset-4 control-label">
							<strong> 제조회사</strong>
						</label>
						<div class="col-md-2">
							<label class="control-label"> ${ l.st_man } <input
								type="hidden" name="st_man" value="${ l.st_man }"></label>
						</div>
					</div>


					<div class="form-group">
						<label for="st_qty" class="col-md-2 col-md-offset-4 control-label">
							<strong> 수 량</strong>
						</label>
						<div class="col-md-2">
							<input type="number" name="st_qty" value="${ l.st_qty }"
								class="form-control"> <input type="hidden"
								name="st_qty_org" value="${ l.st_qty }">
						</div>
					</div>
					<div class="form-group">
						<label for="st_unit"
							class="col-md-2 col-md-offset-4 control-label"> <strong>

								단 위 </strong></label>
						<div class="col-md-2">
							<label class="control-label">${ l.st_unit } <input
								type="hidden" name="st_unit" value="${ l.st_unit }">
							</label>
						</div>
					</div>
				
					<div class="col-md-1 col-md-offset-4" align="right">
						<label for="" class="control-label"> <a href="stockList"><button
									class="btn btn-primary">목 록</button></a>
						</label>
					</div>

					<div class="col-md-1 " align="right">
						<label for="" class="control-label"> <input type="submit"
							value="수 정" class="btn btn-warning">
						</label>
					</div>


					<div class="col-md-1 " align="right">
						<label for="" class="control-label">
							<a href="stockDelete?st_code=${ l.st_code }" class="btn btn-danger">삭 제</a>
						</label>
					</div>
				</c:forEach>
</form>
