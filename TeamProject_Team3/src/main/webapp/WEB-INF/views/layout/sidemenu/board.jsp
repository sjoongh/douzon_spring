<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<secu:authorize access="hasRole('ROLE_board_page_view')">

	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_board_page1_master','ROLE_board_page1_anything','ROLE_board_page1_readWrite','ROLE_board_page1_readOnly')">
			<li role="presentation" id="noticeList"><a href="noticeList">공지사항</a></li>
		</secu:authorize>
		 <secu:authorize
			access="hasAnyRole('ROLE_board_page2_master','ROLE_board_page2_anything','ROLE_board_page2_readWrite','ROLE_board_page2_readOnly')">
			<li role="presentation" id="bizList"><a href="bizList">업무보고서</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_board_page3_master','ROLE_board_page3_anything','ROLE_board_page3_readWrite','ROLE_board_page3_readOnly')">
			<li role="presentation" id="minutesList"><a href="minutesList">회의록</a></li>
		</secu:authorize> 
	</ul> 
	
</secu:authorize>
