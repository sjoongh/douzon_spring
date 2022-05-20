<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<table class="table table-bordered" table width="500" cellpadding="0"
	cellspacing="0" border="1">
	<c:forEach items="${ list }" var="list">
		<form action="bizModify" method="get">
			<tr>
				<td class="active col-md-2" align="center">글번호</td>
				<td class="col-md-4">${ list.b_id } <input type="hidden" name="b_id"
					value="${ list.b_id }">
				</td>
				<td class="active col-md-2">조회수</td>
				<td class="col-md-4">${ list.b_hit } <input type="hidden" name="b_hit"
					value="${ list.b_hit }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">이름</td>
				<td colspan="3">${ list.b_name } <input type="hidden"
					name="b_name" value="${ list.b_name }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">제목</td>
				<td colspan="3">${ list.b_title } <input type="hidden"
					name="b_title" value="${ list.b_title }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">내용</td>
				<td colspan="3">${ list.b_content } <input type="hidden"
					name="b_content" value="${ list.b_content }">
				</td>
			</tr>
			<tr>
				<td class="active" align="center">첨부파일</td>
				<td colspan="3"><a
					href="downloadFile?fileName=/${ list.b_filesrc }">${ list.b_filesrc }</a>
					<input type="hidden" name="b_filesrc" value="${ list.b_filesrc }">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right"><input type="button" value="답글"
					onclick="location.href=' bizReply?b_id=${ list.b_id }' "
					class="btn btn-success"> &nbsp; <secu:authorize
						access="hasAnyRole('ROLE_board_page2_master','ROLE_board_page2_anything')">
						<input type="submit" value="수정" class="btn btn-warning"> &nbsp;
				<input type="button" value="삭제"
							onclick="location.href=' bizDelete?b_id=${ list.b_id }' "
							class="btn btn-danger"> &nbsp;
				</secu:authorize><input type="button" value="목록" onclick="location.href='bizList' "
					class="btn btn-info"></td>
			</tr>
		</form>
	</c:forEach>
</table>
