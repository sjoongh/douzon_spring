<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<secu:authorize access="hasRole('ROLE_patient_page_view')">
	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_patient_page1_master','ROLE_patient_page1_anything','ROLE_patient_page1_readWrite','ROLE_patient_page1_readOnly')">
			<li role="presentation" id="patientList"><a href="patientList">환자목록</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_patient_page2_master','ROLE_patient_page2_anything','ROLE_patient_page2_readWrite','ROLE_patient_page2_readOnly')">
				<li role="presentation" id="treatment_admin"><a href="treatment_admin?pageNum=1">진료(검사)코드관리</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_patient_page3_master','ROLE_patient_page3_anything','ROLE_patient_page3_readWrite','ROLE_patient_page3_readOnly')">
		<li role="presentation" id="prescription_admin"><a href="prescription_admin?pageNum=1">처방코드관리</a></li>
		</secu:authorize>

	</ul>
</secu:authorize>