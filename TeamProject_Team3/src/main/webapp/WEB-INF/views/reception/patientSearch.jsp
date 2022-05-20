<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="secu"%>
	
	
 <script language="javascript">	
function checkId() {
    var userinput = eval("document.userinput");
    
    if (!userinput.c_name.value && !userinput.c_jumin1.value) {
        alert("환자 이름 또는 생년월일을 입력하세요.");
        userinput.c_name.focus();
        return false;
     }
}
</script>



<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">환자 검색</h3>
	</div>
	<div class="panel-body">
		<div class="col-md-4 col-md-offset-4 form-group table-responsive">
			<form name="userinput" action="patientSearch" method="post" class="form-horizontal" onSubmit="return checkId()">
				<div class="form-group">
					<label for="st_vendor" class="col-md-4 control-label">이 름</label>
					<div class="col-md-5">
						<input type="text" id="c_name" name="c_name" value="${ c_name }"
							class="form-control">
					</div>
					<div class="col-md-3">
						<secu:authorize
							access="hasAnyRole('ROLE_reservation_page1_master','ROLE_reservation_page1_anything','ROLE_reservation_page1_readWrite')">

							<input type="submit" value="검색" class="btn btn-default">
						</secu:authorize>
					</div>
				</div>
				<div class="form-group">
					<label for="st_vendor" class="col-md-4 control-label">생년월일</label>
					<div class="col-md-5">
						<input type="text" id="c_jumin1" name="c_jumin1" value="${ c_jumin1 }"
							class="form-control">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive" id="table">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="text-center sky col-md-2">환자번호</th>
						<th class="text-center sky col-md-2">이 름</th>
						<th class="text-center sky col-md-2">생년월일</th>
						<th class="text-center sky col-md-2">전화번호</th>
						<th class="text-center sky col-md-2"></th>
						<th class="text-center sky col-md-2"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="l">
						<form action="receptionNew" method="post">
							<tr>
								<td class="text-center">${ l.c_no }<input type="hidden"
									name="c_no" value="${ l.c_no }">
								</td>
								<td class="text-center">${ l.c_name }<input type="hidden"
									name="c_name" value="${ l.c_name }">
								</td>
								<td class="text-center">${ l.c_jumin1 }<input type="hidden"
									name="c_jumin1" value="${ l.c_jumin1 }">
								</td>
								<td class="text-center">${ l.c_phone }<input type="hidden"
									name="c_phone" value="${ l.c_phone }">
								</td>
								<td class="text-center"><secu:authorize
										access="hasAnyRole('ROLE_reservation_page1_master','ROLE_reservation_page1_anything','ROLE_reservation_page1_readWrite')">
										<a href="reservationList?c_no=${ l.c_no }&c_name=${ l.c_name }" class="btn btn-success btn-sm">예
											약</a>
									</secu:authorize></td>
								<td class="text-center"><secu:authorize
										access="hasAnyRole('ROLE_reservation_page1_master','ROLE_reservation_page1_anything','ROLE_reservation_page1_readWrite')">
										<input type="submit" value="접 수" class="btn btn-info btn-sm">
									</secu:authorize></td>
							</tr>
						</form>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<c:if test="${ check == 0 }">
	<div class="panel-body">
		<div class="table-responsive" id="table">
			<table class="table table-hover table-bordered">
				<tr>
					<th class="text-center sky col-md-2">고유번호</th>
					<th class="text-center sky col-md-2">이 름</th>
					<th class="text-center sky col-md-2">성 별</th>
					<th class="text-center sky col-md-2" colspan="2">주민등록번호</th>
					<th class="text-center sky col-md-2">주 소</th>
					<th class="text-center sky col-md-2">전화번호</th>
				</tr>
				<c:forEach items="${ medical }" var="m">
				<form action="patientAdd" method="post">
					<tr>
						<td class="text-center">${ m.m_no }<input type="hidden" name="c_no"
							value="${ m.m_no }">
						</td>
						<td class="text-center">${ m.m_name }<input type="hidden" name="c_name"
							value="${ m.m_name }">
						</td>
						<td class="text-center">${ m.m_gender }<input type="hidden" name="c_gender"
							value="${ m.m_gender }">
						</td>
						<td class="text-center">${ m.m_jumin1 }<input type="hidden" name="c_jumin1"
							value="${ m.m_jumin1 }">
						</td>
						<td class="text-center">${ m.m_jumin2 }<input type="hidden" name="c_jumin2"
							value="${ m.m_jumin2 }">
						</td>
						<td class="text-center">${ m.m_address }<input type="hidden" name="c_address"
							value="${ m.m_address }">
						</td>
						<td class="text-center">${ m.m_phone }<input type="hidden" name="c_phone"
							value="${ m.m_phone }">
						</td>
					</tr>
					<tr>
						<td class="text-center" colspan="6"><span class="col-md-3 col-md-offset-3 text-right"><h4>담당의사 :</h4></span><span class="col-md-3" style="padding-top: 5px;"> <select name="c_doctor" class="form-control input-sm" ">
								<c:forEach items="${ doctor }" var="dc">
									<option value="${ dc.emp_name }"
										${ dc.emp_name eq c_doctor ? 'selected' : '' }>${ dc.emp_name }</option>
								</c:forEach>
						</select></span>
						</td>
						<td class="text-center"><input type="submit" value="등록(추가)" class="btn btn-info btn-sm"></td>
					</tr>
					</form>
				</c:forEach>
			</table>
	</c:if>
</div>