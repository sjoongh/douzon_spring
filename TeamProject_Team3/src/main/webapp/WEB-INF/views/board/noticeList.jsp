<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<h3 align="center">[공지사항]</h3>
<br>
<table class="table" table class="table">
<thead>
	<tr class="active">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${ list }" var="l">
	<tr>
		<td>${ l.n_id }</td>
		<td>
			<a href="noticeView?n_id=${ l.n_id }">${ l.n_title }</a>
		</td>
		<td>${ l.n_name }</td>
		<td>${ l.n_hit }</td>
		<td>
			<fmt:formatDate value="${ l.n_date }" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5" align="right">
			<secu:authorize
			access="hasAnyRole('ROLE_board_page1_master','ROLE_board_page1_anything','ROLE_board_page1_readWrite')">
			<input type="button" value="글쓰기" onclick="location.href='noticeWrite' "class="btn btn-info"></secu:authorize>
		</td>
	</tr>
	</tbody>
</table>
