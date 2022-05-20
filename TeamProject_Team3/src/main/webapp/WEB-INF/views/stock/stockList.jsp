<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">재고 목록</h3>
	</div>
	<div class="panel-body">
		<div class="table-responsive" id="table">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">물품코드</th>
						<th class="text-center">품 명</th>
						<th class="text-center">규 격</th>
						<th class="text-center">모 델</th>
						<th class="text-center">제조회사</th>
						<th class="text-center">수 량</th>
						<th class="text-center">단 위</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="l">
						<form action="stockModify" method="get">
						<tr>
							<td class="text-center">${ l.st_code }<input type="hidden"
								name="st_code" value="${ l.st_code }">
							</td>
							<td class="text-center">${ l.st_name }</td>
							<td class="text-center">${ l.st_std }</td>
							<td class="text-center">${ l.st_model }</td>
							<td class="text-center">${ l.st_man }</td>
							<td class="text-center">${ l.st_qty }</td>
							<td class="text-center">${ l.st_unit }</td>
							<td class="text-center"><secu:authorize
									access="hasAnyRole('ROLE_inventory_page1_master','ROLE_inventory_page1_anything')">
									<input type="submit" value="수　정" class="btn btn-warning btn-sm">
								</secu:authorize></td>
						</tr>
						</form>
					</c:forEach>
					<tr>
						<td colspan="8" class="thick-line text-right"><secu:authorize
								access="hasAnyRole('ROLE_inventory_page2_master','ROLE_inventory_page2_anything','ROLE_inventory_page2_readWrite')">
								<a href="invoiceAdd" class="btn btn-success btn-sm">구매내역 추가</a>
							</secu:authorize></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</div>