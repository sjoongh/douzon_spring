<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<table class="table table-bordered" table width="500" cellpadding="0" cellspacing="0" border="1">
	<c:forEach items="${ list }" var="list">
	<form action="noticeModify" method="post" enctype="multipart/form-data">
	
		<tr>
			<td class="active col-md-2" align="center">이름</td>
			<td class="col-md-4">${ list.n_name }</td>
			<td class="active col-md-2">글번호</td>
			<td class="col-md-4"><input type="hidden" name="n_id" value="${ list.n_id }">${ list.n_id }</td>
		</tr>
		<tr>
			<td class="active" align="center">제목</td>
			<td colspan="3"><input type="text" name="n_title" size="50" required="required" value="${ list.n_title }" class="form-control"></td>
		</tr>
		<tr>
			<td class="active" align="center">내용</td>
			<td colspan="3"><textarea name="n_content" required="required" rows="10" class="form-control">${ list.n_content }</textarea></td>
		</tr>
		<tr>
			<td class="active" align="center">첨부파일</td>
			<td colspan="3">
				<input type="file" name="files[0]" readonly="readonly" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="submit" value="수정" class="btn btn-warning"> &nbsp;
				<input type="button" value="목록" onclick="location.href='noticeList' " class="btn btn-info" >
			</td>
		</tr>
	</form>
	</c:forEach>
</table>
