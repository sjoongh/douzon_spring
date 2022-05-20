<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">거래처 목록</h3>
	</div>
	<div class="panel-body">
		<div class="col-md-6 col-md-offset-3 form-group table-responsive">
			<form action="supplierList" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="st_vendor" class="col-md-3 control-label"> 거래처명</label>
					<div class="col-md-7">

						<input type="text" name="su_name" value="${ su_name }"
							class="form-control" required="required">
					</div>

					<div class="col-md-1">
						<input type="submit" value="검색" class="btn btn-default">
					</div>

				</div>

			</form>
		</div>
	</div>

	<div class="panel-body">
		<div class="table-responsive" id="table">





			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">사업자등록번호</th>
						<th class="text-center">거 래 처 명</th>
						<th class="text-center">대 표 자 명</th>
						<th class="text-center">거 래 품 목</th>
						<th class="text-center">담 당 자 명</th>
						<th class="text-center">상 세 보 기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="l">
						<form action="supplierView" method="post" class="form-horizontal">
							<tr>
								<td class="text-center">${ l.su_taxid }<input type="hidden"
									name="su_taxid" value="${ l.su_taxid }">
								</td>
								<td class="text-center">${ l.su_name }<input type="hidden"
									name="su_name" value="${ l.su_name }">
								</td>
								<td class="text-center">${ l.su_ceo }<input type="hidden"
									name="su_ceo" value="${ l.su_ceo }">
								</td>
								<td class="text-center">${ l.su_item }<input type="hidden"
									name="su_item" value="${ l.su_item }">
								</td>
								<td class="text-center">${ l.su_mgr }<input type="hidden"
									name="su_mgr" value="${ l.su_mgr }">
								</td>
								<td class="text-center"><input type="submit" value="상세보기"
									class="btn btn-sm btn-info"></td>
							</tr>
						</form>
					</c:forEach>
					<tr>
						<td colspan="6" class="thick-line text-right"><secu:authorize
								access="hasAnyRole('ROLE_inventory_page3_master','ROLE_inventory_page3_anything','ROLE_inventory_page3_readWrite')">
								<a href="supplierAdd" class="btn btn-success btn-sm">거래처 추가</a>
							</secu:authorize></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>