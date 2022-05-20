<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<secu:authorize access="hasRole('ROLE_reservation_page_view')">
	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_reservation_page1_master','ROLE_reservation_page1_anything','ROLE_reservation_page1_readWrite','ROLE_reservation_page1_readOnly')">

			<li role="presentation" id="patientSearch"><a
				href="patientSearch">검색</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_reservation_page2_master','ROLE_reservation_page2_anything','ROLE_reservation_page2_readWrite','ROLE_reservation_page2_readOnly')">
			<li role="presentation" id="receptionList"><a
				href="receptionList">접수</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_reservation_page3_master','ROLE_reservation_page3_anything','ROLE_reservation_page3_readWrite','ROLE_reservation_page3_readOnly')">
			<li role="presentation" id="reservationList"><a
				href="reservationList">예약</a></li>
		</secu:authorize>
	</ul>
</secu:authorize>
