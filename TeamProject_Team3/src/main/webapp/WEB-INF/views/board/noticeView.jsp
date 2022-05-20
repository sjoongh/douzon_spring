<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<table class="table table-bordered" table width="500" cellpadding="0"
	cellspacing="0" border="1">
	<c:forEach items="${ list }" var="list">
		<form action="noticeModify" method="get">
			<tr>
				<td class="active col-md-2" align="center">글번호</td>
				<td class="col-md-4">${ list.n_id } <input type="hidden" name="n_id"
					value="${ list.n_id }">
				</td>
				<td class="active col-md-2" align="center">조회수</td>
				<td class="col-md-4">${ list.n_hit } <input type="hidden" name="n_hit"
					value="${ list.n_hit }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">이름</td>
				<td colspan="3">${ list.n_name } <input type="hidden"
					name="n_name" value="${ list.n_name }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">제목</td>
				<td colspan="3">${ list.n_title } <input type="hidden"
					name="n_title" value="${ list.n_title }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">내용</td>
				<td colspan="3">${ list.n_content } <input type="hidden"
					name="n_content" value="${ list.n_content }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">첨부파일</td>
				<td colspan="3"><a
					href="downloadFile?fileName=/${ list.n_filesrc }">${ list.n_filesrc }</a>
					<input type="hidden" name="b_filesrc" value="${ list.n_filesrc }">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right"><secu:authorize
						access="hasAnyRole('ROLE_board_page1_master','ROLE_board_page1_anything')">

						<input type="submit" value="수정" class="btn btn-warning"> &nbsp;
				<input type="button" value="삭제"
							onclick="ocation.href='noticeDelete?n_id=${ list.n_id }' "
							class="btn btn-danger"> &nbsp;
				</secu:authorize> <input type="button" value="목록"
					onclick="location.href=' noticeList' " class="btn btn-info">
				</td>
			</tr>
		</form>
	</c:forEach>
</table>
