<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<secu:authorize access="hasRole('ROLE_accounting_page_view')">
	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_accounting_page1_master','ROLE_accounting_page1_anything','ROLE_accounting_page1_readWrite','ROLE_accounting_page1_readOnly')">
			<li role="presentation" id="accountList"><a href="accountList">회계내역</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_accounting_page2_master','ROLE_accounting_page2_anything','ROLE_accounting_page2_readWrite','ROLE_accounting_page2_readOnly')">
		<li role="presentation" id="acctypeList"><a href="acctypeList?pageNum=1">회계코드관리</a></li>
		</secu:authorize>
	</ul>

</secu:authorize>
