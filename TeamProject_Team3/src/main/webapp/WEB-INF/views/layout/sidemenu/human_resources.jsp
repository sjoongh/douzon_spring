<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<secu:authorize access="hasAnyRole('ROLE_human_resources_page_view')">
	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_human_resources_page1_master','ROLE_human_resources_page1_anything','ROLE_human_resources_page1_readWrite','ROLE_human_resources_page1_readOnly')">
			<li role="presentation" id="hospital_list"><a
				href="hospital_list?pageNum=1">인사관리</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_human_resources_page2_master','ROLE_human_resources_page2_anything','ROLE_human_resources_page2_readWrite','ROLE_human_resources_page2_readOnly')">
			<c:if test="${sessionScope.login_id != 'admin'}">
				<li role="presentation" id="commute"><a
					href="commute">출퇴근 캘린더(개인)</a></li>
			</c:if>
		</secu:authorize>

		<secu:authorize
			access="hasAnyRole('ROLE_human_resources_page3_master','ROLE_human_resources_page3_anything','ROLE_human_resources_page3_readWrite','ROLE_human_resources_page3_readOnly')">
			<li role="presentation" id="hospital_pay_list"><a
				href="hospital_pay_list?year=2016&month=06">급여관리</a></li>
		</secu:authorize>

		<secu:authorize
			access="hasRole('ROLE_human_resources_page4_master')">
			<li role="presentation" class="dropdown" id="resignation_list"><a href="#"
				 class="dropdown-toggle" data-toggle="dropdown"
				role="button" aria-expanded="false">인사관리자 페이지<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="resignation_list">퇴사 관리</a></li>
							<li><a href="commute2">전체 사원 관리 캘린더(전체)</a></li>
							<li><a href="commute_holyday_process_view?year=2016&month=06&pageNum=1">결근
									사유 관리</a></li>
						</ul></li>
		</secu:authorize>
	</ul>
</secu:authorize>