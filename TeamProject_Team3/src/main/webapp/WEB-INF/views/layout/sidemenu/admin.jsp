<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<secu:authorize access="hasRole('ROLE_admin_page_view')">
	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_admin_page1_master','ROLE_admin_page1_anything','ROLE_admin_page1_readWrite','ROLE_admin_page1_readOnly')">
			<li role="presentation" id="hospital_info"><a href="hospital_info">병원정보수정</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_admin_page2_master','ROLE_admin_page2_anything','ROLE_admin_page2_readWrite','ROLE_admin_page2_readOnly')">
			<li role="presentation" id="user_admin"><a href="user_admin?pageNum=1">계정관리</a></li>
		</secu:authorize>
	</ul>
</secu:authorize>
