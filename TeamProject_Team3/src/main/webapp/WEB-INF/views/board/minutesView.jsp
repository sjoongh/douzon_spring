<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<table class="table table-bordered" table width="500" cellpadding="0"
	cellspacing="0" border="1">
	<c:forEach items="${ list }" var="list">
		<form action="minutesModify" method="get">
			<tr>
				<td class="active col-md-2" align="center">글번호</td>
				<td class="col-md-4">${ list.m_id } <input type="hidden" name="m_id"
					value="${ list.m_id }">
				</td>
				<td class="active col-md-2" align="center">조회수</td>
				<td class="col-md-4">${ list.m_hit } <input type="hidden" name="m_hit"
					value="${ list.m_hit }">
				</td>
			</tr>
			<tr>

				<td class="active" align="center">이름</td>
				<td colspan="3">${ list.m_name } <input type="hidden"
					name="m_name" value="${ list.m_name }">
				</td>
			</tr>
			<tr>

				<td class="active" align="center">제목</td>
				<td colspan="3">${ list.m_title } <input type="hidden"
					name="m_title" value="${ list.m_title }">
				</td>
			</tr>
			<tr>

				<td class="active" align="center">내용</td>
				<td colspan="3">${ list.m_content } <input type="hidden"
					name="m_content" value="${ list.m_content }">
				</td>
			</tr>
			<tr>

				<td class="active" align="center">첨부파일</td>
				<td colspan="3"><a
					href="downloadFile?fileName=/${ list.m_filesrc }">${ list.m_filesrc }</a>
					<input type="hidden" name="b_filesrc" value="${ list.m_filesrc }">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right"><secu:authorize
						access="hasAnyRole('ROLE_board_page3_master','ROLE_board_page3_anything')">

						<input type="submit" value="수정" class="btn btn-warning"> &nbsp;
				<input type="button" value="삭제"
							onclick="location.href='minutesDelete?m_id=${ list.m_id }' "
							class="btn btn-danger"> &nbsp;
				</secu:authorize><input type="button" value="목록" onclick="location.href='minutesList"
					class="btn btn-info"></td>
			</tr>
		</form>
	</c:forEach>
</table>
