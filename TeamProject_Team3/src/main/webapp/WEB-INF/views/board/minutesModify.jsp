<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<table class="table table-bordered"table width="500" cellpadding="0" cellspacing="0" border="1">
	<c:forEach items="${ list }" var="list">
	<form action="minutesModify" method="post" enctype="multipart/form-data">
	
		<tr>
			<td class="active col-md-2"  align="center">이름</td>
			<td class="col-md-4">${ list.m_name }</td>
			<td class="active col-md-2">글번호</td>
			<td class="col-md-4"><input type="hidden" name="m_id" value="${ list.m_id }">${ list.m_id }</td>
		</tr>
		<tr>
			<td class="active" align="center">제목</td>
			<td colspan="3"><input type="text" name="m_title" size="50" required="required" value="${ list.m_title }" class="form-control"></td>
		</tr>
		<tr>
			<td class="active" align="center">내용</td>
			<td colspan="3"><textarea name="m_content" required="required" rows="10" class="form-control">${ list.m_content }</textarea></td>
		</tr>
		<tr>
			<td class="active" align="center" class="form-control">첨부파일</td>
			<td colspan="3">
				<input type="file" name="files[0]" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="submit" value="수정" class="btn btn-warning"> &nbsp;
				<input type="button" value="목록" onclick="location.href='minutesList'" class="btn btn-info">
				
				
			</td>
		</tr>
	</form>
	</c:forEach>
</table>
