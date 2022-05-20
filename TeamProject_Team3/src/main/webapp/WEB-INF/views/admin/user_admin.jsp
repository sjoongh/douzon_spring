<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>
<!-- 	<p id="demo"></p>
<script>
document.getElementById("demo").innerHTML = uid;
</script>   -->



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
		<h3 class="panel-title">계정 관리</h3>
	</div>

	<div class="panel-body">
		<div class="table-responsive" id="table">
			<table class="table table-condensed table-hover">
				<thead>
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">직책</th>
						<th class="text-center">이름</th>
						<th class="text-center">연락처</th>
						<th class="text-center">부서</th>
						<th class="text-center">email</th>
						<th class="text-center">권한부여</th>
						<th class="text-center">계정 수정시간</th>
						<secu:authorize
							access="hasAnyRole('ROLE_admin_page2_master','ROLE_admin_page2_anything','ROLE_admin_page2_readWrite')">
							<th class="text-center">추가</th>
							<th class="text-center">삭제</th>
						</secu:authorize>
					</tr>
				</thead>
				<tbody>
					<secu:authorize
						access="hasAnyRole('ROLE_admin_page2_anything','ROLE_admin_page2_readWrite','ROLE_admin_page2_readOnly')">
						<c:forEach items="${ list2 }" var="dto">
							<c:if test="${dto.u_id == sessionScope.login_id}">
								<tr>
									<td class="text-center">${dto.u_id }</td>
									<td class="text-center">${dto.u_position }</td>
									<td class="text-center">${dto.u_name }</td>
									<td class="text-center">${dto.u_phone }</td>
									<td class="text-center">${dto.u_team }</td>
									<td class="text-center">${dto.u_email }</td>
									<td class="text-center">${dto.role_check }</td>
									<td class="text-center">${dto.u_modifydate }</td>
									<secu:authorize
										access="hasRole('ROLE_admin_page2_anything')">
										<td class="text-center">
												<input type="button" class="btn btn-warning btn-sm"
													value="수정"
													onclick="window.location.href='user_update?u_id=${dto.u_id }'">
											</td>
										<td class="text-center"><secu:authorize
												access="hasRole('ROLE_admin_page2_master')">
												<input type="button" class="btn btn-danger btn-sm"
													value="삭제"
													onclick="window.location.href='user_delete?u_id=${dto.u_id }'">
											</secu:authorize></td>
									</secu:authorize>

								</tr>
							</c:if>
						</c:forEach>
					</secu:authorize>


					<secu:authorize access="hasRole('ROLE_admin_page2_master')">
						<c:forEach items="${ list }" var="dto">

							<tr>
								<td class="text-center">${dto.u_id }</td>
								<td class="text-center">${dto.u_position }</td>
								<td class="text-center">${dto.u_name }</td>
								<td class="text-center">${dto.u_phone }</td>
								<td class="text-center">${dto.u_team }</td>
								<td class="text-center">${dto.u_email }</td>
								<td class="text-center">${dto.role_check }</td>
								<td class="text-center">${dto.u_modifydate }</td>
								<td class="text-center"><input type="button"
									class="btn btn-warning btn-sm" value="수정"
									onclick="window.location.href='user_update?u_id=${dto.u_id }'"></td>
								<td class="text-center"><input type="button"
									class="btn btn-danger btn-sm" value="삭제"
									onclick="window.location.href='user_delete?u_id=${dto.u_id }'"></td>
							</tr>
						</c:forEach>
					</secu:authorize>
					<%-- </c:if>  --%>

					<c:if test="${count == 0 }">
						<tr>
							<td colspan="10" class="text-center">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</c:if>
					<secu:authorize access="hasRole('ROLE_admin_page2_master')">
						<tr>
							<td colspan="9" class="thick-line">
								<div align="center">
									<nav>
										<ul class="pagination" id="pagination">
											<c:if test="${startPage > pageBlock }">
												<li><a href="user_admin?pageNum=${startPage-5}"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
											</c:if>

											<c:forEach var="i" begin="${startPage }" end="${endPage }">
												<li><a href="user_admin?pageNum=${i }"> ${i } <span
														class="sr-only">(current)</span>
												</a></li>
											</c:forEach>

											<c:if test="${endPage < pageCount }">
												<li><a href="user_admin?pageNum=${startPage+5 }"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
							</td>
							<td class="thick-line" id="insert_button"><secu:authorize
									access="hasRole('ROLE_admin_page2_master')">
									<input type="button" value="추가" class="btn btn-success btn-sm"
										onclick="window.location.href = 'user_insert'">
								</secu:authorize></td>

						</tr>
					</secu:authorize>
				</tbody>
			</table>
		</div>
	</div>

</div>

