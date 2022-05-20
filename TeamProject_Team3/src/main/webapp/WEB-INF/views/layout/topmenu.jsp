<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>



<!--  <p id="demo"></p>
<script>
document.getElementById("demo").innerHTML =
	$(location).attr('pathname');
</script>  -->
<ul class="nav nav-pills nav-justified" id="topmenu">
	<secu:authorize access="hasRole('ROLE_reservation_page_view')">
		<li role="presentation" id="sidemenu_reservation"><a
			href="sidemenu_reservation">접수/예약</a></li>
	</secu:authorize>
	<secu:authorize access="hasRole('ROLE_patient_page_view')">
		<li role="presentation" id="sidemenu_patient"><a
			href="sidemenu_patient">환자</a></li>
	</secu:authorize>

	<secu:authorize access="hasRole('ROLE_inventory_page_view')">
		<li role="presentation" id="sidemenu_inventory"><a
			href="sidemenu_inventory">재고</a></li>
	</secu:authorize>
	<secu:authorize access="hasRole('ROLE_accounting_page_view')">
		<li role="presentation" id="sidemenu_accounting"><a
			href="sidemenu_accounting">회계</a></li>
	</secu:authorize>
	<secu:authorize access="hasRole('ROLE_human_resources_page_view')">
		<li role="presentation" id="sidemenu_human_resources"><a
			href="sidemenu_human_resources">인사</a></li>
	</secu:authorize>


	<secu:authorize access="hasRole('ROLE_board_page_view')">
		<li role="presentation" id="sidemenu_board"><a
			href="sidemenu_board">게시판</a></li>
	</secu:authorize>
	<secu:authorize access="hasRole('ROLE_admin_page_view')">
		<li role="presentation" id="sidemenu_admin"><a
			href="sidemenu_admin">관리</a></li>
	</secu:authorize>
</ul>

