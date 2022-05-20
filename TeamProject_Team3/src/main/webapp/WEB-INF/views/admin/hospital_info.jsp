<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">병원 정보</h3>
	</div>
	<div class="panel-body">
		<div id="table" class="table-responsive">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="text-center gr col-md-2"><strong>병원명</strong></td>
						<td class="text-center col-md-3">${ hospital.h_name }</td>
						<td class="text-center col-md-2 gr"><strong>병원장 이름</strong></td>
						<td class="text-center col-md-5">${ hospital.h_master }</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>병원 연락처</strong></td>
						<td class="text-center">${ hospital.h_tel }</td>
						<td class="text-center gr"><strong>병원장 연락처</strong></td>
						<td class="text-center">${ hospital.h_master_tel }</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>사업자등록증</strong></td>
						<td class="text-center">${ hospital.h_lnum }</td>
						<td class="text-center gr"><strong>병원 로고</strong></td>
						<td class="text-center">
							<div align="center">
								<c:if test="${sessionScope.logo != null}">
									<img src="resources/upload/${ sessionScope.logo }"
										id="logo_image" class="img-responsive img-circle">
								</c:if>
								<c:if test="${sessionScope.logo == null}">
									<img src="resources/images/essence1.png" id="logo_image"
										class="img-responsive img-circle">
								</c:if>
								<div class="caption">
									<a href="downloadFile?fileName=/${ hospital.h_logo }"><input
										type="button" value="다운로드" class="btn btn-link"></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>병원 위치</strong></td>
						<td colspan="3 text-center" class="text-center">${ hospital.h_map }</td>
					</tr>
				</tbody>
			</table>
			<div align="right">
				<c:if test="${check==1}">
				<secu:authorize
						access="hasAnyRole('ROLE_admin_page1_master','ROLE_admin_page1_anything','ROLE_admin_page1_readWrite')">
						
					<input type="button" value="수정" class="btn btn-warning btn-sm"
						onclick="location.href='hospital_info_modify'"></secu:authorize> &nbsp;&nbsp;
				</c:if>
				<c:if test="${check==0}">
					<secu:authorize
						access="hasAnyRole('ROLE_admin_page1_master','ROLE_admin_page1_anything','ROLE_admin_page1_readWrite')">
						<input type="button" value="신규" class="btn btn-success btn-sm"
							onclick="location.href='hospital_info_new'"> &nbsp;&nbsp;
			</secu:authorize>
				</c:if>
			</div>

		</div>
	</div>
</div>

