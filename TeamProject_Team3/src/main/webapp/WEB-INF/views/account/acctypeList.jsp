<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>


<c:if test="${ count > 0 }">
	<fmt:parseNumber var="pageCount"
		value="${count / cri.pageSize + (count % cri.pageSize == 0? 0:1) }"
		integerOnly="true" />
	<c:set var="startPage" value="${1 }" />
	<c:set var="pageBlock" value="${5 }" />

	<fmt:parseNumber var="result" value="${cri.currentPage / pageBlock }"
		integerOnly="true" />

	<c:if test="${cri.currentPage % pageBlock != 0 }">
		<c:set var="startPage" value="${result * pageBlock +1 }" />
	</c:if>
	<c:if test="${cri.currentPage % pageBlock == 0 }">
		<c:set var="startPage" value="${(result-1) * pageBlock +1 }" />
	</c:if>

	<c:set var="endPage" value="${startPage + pageBlock -1 }" />

	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }" />
	</c:if>

</c:if>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">회계 분류 코드 관리</h3>
	</div>

	<div class="panel-body">
		<div class="table-responsive" id="table">
			<table class="table table-condensed table-hover">
				<thead>
					<tr>
						<th class="text-center">분류코드</th>
						<th class="text-center">분류명</th>
						<th class="text-center"></th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ typelist }" var="dto">

						<tr>
							<td class="text-center">${dto.type_code }</td>
							<td class="text-center">${dto.type_name }</td>

							<td class="text-center"><secu:authorize
									access="hasAnyRole('ROLE_accounting_page2_master','ROLE_accounting_page2_anything')">
									<input type="button" class="btn btn-warning btn-sm" value="수정"
										onclick="window.location.href='acctypeModify?type_code=${dto.type_code }'">
								</secu:authorize></td>
							<td class="text-center"><secu:authorize
									access="hasAnyRole('ROLE_accounting_page2_master','ROLE_accounting_page2_anything')">
									<input type="button" class="btn btn-danger btn-sm" value="삭제"
										onclick="window.location.href='acctypeDelete?type_code=${dto.type_code }'">
								</secu:authorize></td>
						</tr>
					</c:forEach>

					<c:if test="${count == 0 }">
						<tr>
							<td colspan="5" class="text-center">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</c:if>

					<tr>
						<td colspan="3" class="thick-line">
							<div align="center">
								<nav>
									<ul class="pagination" id="pagination">
										<c:if test="${startPage > pageBlock }">
											<li><a href="acctypeList?pageNum=${startPage-5}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach var="i" begin="${startPage }" end="${endPage }">
											<li><a href="acctypeList?pageNum=${i }"> ${i } <span
													class="sr-only">(current)</span>
											</a></li>
										</c:forEach>

										<c:if test="${endPage < pageCount }">
											<li><a href="acctypeList?pageNum=${startPage+5 }"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</td>
						<td class="thick-line" id="insert_button" align="center"><secu:authorize
								access="hasAnyRole('ROLE_accounting_page2_master','ROLE_accounting_page2_anything','ROLE_accounting_page2_readWrite')">
								<input type="button" value="추가" class="btn btn-success btn-sm"
									onclick="window.location.href = 'acctypeAdd'">
							</secu:authorize></td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
