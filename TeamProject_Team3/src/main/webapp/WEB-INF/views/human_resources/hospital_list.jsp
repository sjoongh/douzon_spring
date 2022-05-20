<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


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


<script>
	function winOpen() {
		window.open("sign_up", "newWin","width=700, height=500, toolbar=no, scrollbars=yes,location=no");
	}

	function winOpen2() {
		window.open("duty_list", "newWin","width=700, height=500, toolbar=no, scrollbars=yes,location=no");
	}
	function winOpen3() {
		window.open("department_list", "newWin","width=700, height=500, toolbar=no, scrollbars=yes,location=no");
	}
</script>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">인사 관리</h3>
	</div>

	<div class="col-md-4">
		<form action="hospital_search" method="post" style="margin-top: 15px;">
			<secu:authorize access="hasRole('ROLE_human_resources_page1_master')">
				<div class="col-md-8">
					<input type="text" name="variable" placeholder="사번 또는 이름 입력[ENTER]"
						size='25' class="form-control input-sm">
				</div>
				<div class="col-md-4">
					<input type="submit" value="검색" class="btn btn-success btn-sm">
				</div>
			</secu:authorize>
		</form>
	</div>




	<div class="panel-body">
		<div class="col-md-12">
			<secu:authorize access="hasRole('ROLE_human_resources_page1_master')">
				<p style="margin-top: 10px;">[전체인원 : ${count}명]</p>
			</secu:authorize>
			<secu:authorize
				access="hasAnyRole('ROLE_human_resources_page1_anything','ROLE_human_resources_page1_readWrite','ROLE_human_resources_page1_readOnly')">
				<p style="margin-top: 10px;"></p>
			</secu:authorize>

			<table class="table table-bordered">
				<tr class="sky">
					<th class="text-center"><a
						href="hospital_content_array?array_variable=emp_num&pageNum=1">사원번호</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=emp_name&pageNum=1">이름</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=telephone&pageNum=1">전화번호</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=email&pageNum=1">이메일</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=email&pageNum=1">부서</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=duty_responsibility&pageNum=1">직책</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=join_date&pageNum=1">입사일</a>
					</th>
					<th class="text-center"><a
						href="hospital_content_array?array_variable=account_number&pageNum=1">계좌번호</a>
					</th>
				</tr>
				<secu:authorize
					access="hasRole('ROLE_human_resources_page1_master')">
					<c:forEach items="${ hospital_list }" var="dto">
						<tr>
							<td class="text-center"><a
								href="hospital_content_view?emp_num=${dto.emp_num }">${dto.emp_num }</a>

							</td>
							<td class="text-center">${dto.emp_name }</td>
							<td class="text-center">${dto.telephone }</td>
							<td class="text-center">${dto.email }</td>
							<td class="text-center">${dto.department}</td>
							<td class="text-center">${dto.duty_responsibility }</td>
							<td class="text-center">${dto.join_date }</td>
							<td class="text-center">${dto.account_number }</td>
							<%-- <td class="text-center"><a href="delete?bId=${dto.bId}">DELETE</a></td> --%>
						</tr>
					</c:forEach>
				</secu:authorize>
				<secu:authorize
					access="hasAnyRole('ROLE_human_resources_page1_anything','ROLE_human_resources_page1_readWrite','ROLE_human_resources_page1_readOnly')">
					<c:forEach items="${ hospital_list2 }" var="dto">
						<tr>
							<td class="text-center"><secu:authorize
									access="hasAnyRole('ROLE_human_resources_page1_anything','ROLE_human_resources_page1_readWrite')">
									<a href="hospital_content_view?emp_num=${dto.emp_num }">${dto.emp_num }</a>
								</secu:authorize> <secu:authorize
									access="hasRole('ROLE_human_resources_page1_readOnly')">
								${dto.emp_num }
								</secu:authorize></td>
							<td class="text-center">${dto.emp_name }</td>
							<td class="text-center">${dto.telephone }</td>
							<td class="text-center">${dto.email }</td>
							<td class="text-center">${dto.department}</td>
							<td class="text-center">${dto.duty_responsibility }</td>
							<td class="text-center">${dto.join_date }</td>
							<td class="text-center">${dto.account_number }</td>
							<%-- <td class="text-center"><a href="delete?bId=${dto.bId}">DELETE</a></td> --%>
						</tr>
					</c:forEach>
				</secu:authorize>

				<secu:authorize
					access="hasAnyRole('ROLE_human_resources_page1_master','ROLE_human_resources_page1_anything')">

					<tr>
						<td colspan="8"><span class="col-md-1"><input
								type="button" class="btn btn-primary btn-sm" value="사원등록"
								onClick="winOpen();" /></span><span class="col-md-1"> <input
								type="button" class="btn btn-primary btn-sm" value="직책등록"
								onClick="winOpen2();" /></span><span class="col-md-1"> <input
								type="button" class="btn btn-primary btn-sm" value="부서등록"
								onClick="winOpen3();" /></span> <secu:authorize
								access="hasRole('ROLE_human_resources_page1_master')">
								<nav class="col-md-4 col-md-offset-2">
									<ul class="pagination pagination-sm" id="pagination"
										style="margin-top: 0px; margin-bottom: 0px;">
										<c:if test="${startPage > pageBlock }">
											<li><a href="hospital_list?pageNum=${startPage-5}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach var="i" begin="${startPage }" end="${endPage }">
											<li><a href="hospital_list?pageNum=${i }"> ${i } <span
													class="sr-only">(current)</span>
											</a></li>
										</c:forEach>

										<c:if test="${endPage < pageCount }">
											<li><a href="hospital_list?pageNum=${startPage+5 }"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</secu:authorize>
						</td>
					</tr>

				</secu:authorize>
			</table>
		</div>
	</div>
</div>
