<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<h3 align="center">[업무보고]</h3>
<br>
<table class="table ">
	<thead>
	<tr class="active">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	</thead>
	<c:forEach items="${ list }" var="l">
	<tbody>
	<tr>
		<td>${ l.b_id }</td>
		<td>
			<c:if test="${ l.b_indent ne 0 }">
				<c:forEach begin="1" end="${ l.b_indent }">　</c:forEach>└▷
			</c:if>
			<a href="bizView?b_id=${ l.b_id }">${ l.b_title }</a>
		</td>
		<td>${ l.b_name }</td>
		<td>${ l.b_hit }</td>
		<td>
			<fmt:formatDate value="${ l.b_date }" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5" align="right">
		<secu:authorize
			access="hasAnyRole('ROLE_board_page2_master','ROLE_board_page2_anything','ROLE_board_page2_readWrite')">
			
		<input type="button" value="글쓰기" onclick="location.href='bizWrite' "class="btn btn-info">
		</secu:authorize>
		
		</td>
	</tr>
	</tbody>
</table>
