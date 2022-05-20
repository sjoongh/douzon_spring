<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<table class="table table-bordered" table width="500" cellpadding="0" cellspacing="0" border="1">
	<c:forEach items="${ list }" var="list">
	<form action="bizReply" method="post" enctype="multipart/form-data">
		<input type="hidden" name="b_id" value="${ list.b_id }">
		<input type="hidden" name="b_group" value="${ list.b_group }">
		<input type="hidden" name="b_step" value="${ list.b_step }">
		<input type="hidden" name="b_indent" value="${ list.b_indent }">
		<tr>
			<td class="active"  align="center">이름</ >
			<td><input type="text" name="b_name" size="50" class="form-control"></td>
		</tr>
		<tr>
			<td class="active"  align="center">제목</td>
			<td><input type="text" name="b_title" size="50" value="[답변] " class="form-control"></td>
		</tr>
		<tr>
			<td class="active"  align="center">내용</td>
			<td><textarea name="b_content" rows="10" class="form-control"></textarea></td>
		</tr>
		<tr>
			<td class="active" align="center">첨부파일</td>
			<td>
				<input type="file" name="files[0]" required="required" readonly="readonly" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="입력"   class="btn btn-success"> &nbsp;
				<input type="button" value="목록" onclick="location.href='bizList' "   class="btn btn-info">
				
				
			</td>
		</tr>
	</form>
	</c:forEach>
</table>
