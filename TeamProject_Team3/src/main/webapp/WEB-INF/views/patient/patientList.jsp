<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="secu" uri="http://www.springframework.org/security/tags" %>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">환자 목록</h3>
	</div>
	<div class="panel-body" style="padding-top: 30px;">
		<div class="col-md-4 col-md-offset-4 form-group table-responsive">


			<form action="" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="c_name" class="col-md-4 control-label"> 이 름 </label>
					<div class="col-md-5">
						<input type="text" name="c_name" class="form-control" required="required">
					</div>
					<div class="col-md-3">
						<input type="submit" value="검색" class="btn btn-default">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive" id="table">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">고유번호</th>
						<th class="text-center">이 름</th>
						<th class="text-center">성 별</th>
						<th class="text-center">생년월일</th>
						<th class="text-center">전화번호</th>
						<th class="text-center">담당의사</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ customer_list }" var="cl">

						<tr>
							<td class="text-center">${ cl.c_no }</td>
							<td class="text-center">
							<secu:authorize
			access="hasAnyRole('ROLE_patient_page1_master','ROLE_patient_page1_anything','ROLE_patient_page1_readWrite')">
			
							<a href="patientView?t_date=&c_no=${cl.c_no}">${ cl.c_name }</a></secu:authorize>
							<secu:authorize
			access="hasRole('ROLE_patient_page1_readOnly')">${ cl.c_name }
			</secu:authorize>
							</td>
							<td class="text-center">${ cl.c_gender }</td>
							<td class="text-center">${ cl.c_jumin1 }</td>
							<td class="text-center">${ cl.c_phone }</td>
							<td class="text-center">${ cl.c_doctor }</td>
							<td class="text-center">${ cl.c_mdate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="7" class="thick-line"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>