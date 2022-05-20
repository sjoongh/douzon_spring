<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="secu" uri="http://www.springframework.org/security/tags" %>

<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>

	function windowAddressSearch() {
		daum.postcode.load(function() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									document.getElementsByName("address_number")[0].value = data.zonecode;
									document.getElementsByName("address")[0].value = data.roadAddress;
								}
							}).open();
				});
	}
	function windowDutySearch() {
		window.open("duty_search_list", "newWin2",
						"width=500, height=500, toolbar=no, scrollbars=yes,location=no");
	}
	function windowBankSearch() {
		window.open("bank_search_list", "newWin6",
						"width=500, height=500, toolbar=no, scrollbars=yes,location=no");
	}
	function windowDepartSearch() {
		window.open("depart_search_list", "newWin5",
						"width=500, height=500, toolbar=no, scrollbars=yes,location=no");
	}
	
</script>
<script type="text/javascript">
 				document.userinput.marital_status.value="${hospital_content_view.marital_status}";
</script>

<form action="hospital_modify" method="post" name="userinput" enctype="multipart/form-data">
<input type="hidden" name="emp_num"	value="${hospital_content_view.emp_num}">
<input type="hidden" id="duty_responsibility_code">
	<table class="table table-bordered">
		<tr>
			<td rowspan="6" class="col-md-2">
			<c:if test="${ hospital_content_view.picture ne null }">
				<center><img src="<c:url value='resources/upload/${hospital_content_view.picture}'/>" width="200px"></center>
			</c:if>
			<c:if test="${ hospital_content_view.picture eq null }">
				<img src="resources/images/essence1.png" alt="Responsive image"
					style="width: 150px; height: 210px; margin-top: 10px;" class="img-thumbnail center-block">
			</c:if>
			</td>
			<th class="text-center col-md-2 sky">이름</th>
			<td class="text-center col-md-3">${hospital_content_view.emp_name}</td>
			<th class="text-center col-md-2 sky">성별</th>
			<td class="text-center col-md-3">${hospital_content_view.gender}</td>
		</tr>
		<tr>
			<th class="text-center sky">사원번호</th>
			<td class="text-center">${hospital_content_view.emp_num}</td>
			<th class="text-center sky">결혼여부</th>
			<td class="text-center"><input type="text" name="marital_status" class="form-control input-sm"
				value="${hospital_content_view.marital_status}"></td>
		</tr>
		<tr>
			<th class="text-center sky">주민등록번호</th>
			<td class="text-center">${hospital_content_view.jumin_number}</td>
			<th class="text-center sky">이메일</th>
			<td class="text-center"><input type="text" name="email" class="form-control input-sm"
				value="${hospital_content_view.email}"></td>
		</tr>
		<tr>
			<th class="text-center sky">전화번호</th>
			<td class="text-center"><input type="text" name="telephone" class="form-control input-sm"
				value="${hospital_content_view.telephone}"></td>
			<th class="text-center sky">비상연락망</th>
			<td class="text-center"><input type="text" name="telephone2" class="form-control input-sm"
				value="${hospital_content_view.telephone2}"></td>
		</tr>
		<tr>
			<th class="text-center sky">우편번호</th>
			<td class="text-center"><span class="col-md-8" style="padding-left: 0"><input type="text" id="address_number" name="address_number" class="form-control input-sm"
				value="${hospital_content_view.address_number}" readonly="readonly"
				placeholder="주소 검색창을 눌러주세요"></span><span class="col-md-2"><input type="button"
				class="btn btn-info btn-sm" value="주소검색"
				OnClick="javascript:windowAddressSearch();"></span></td>
			<th class="text-center sky">사진변경</th>
			<td class="text-center">
				<input type="file" name="files[0]" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th class="text-center sky">주소</th>
			<td colspan="3"><input type="text" name="address" class="form-control input-sm"
				 value="${hospital_content_view.address}"></td>
		</tr>
	</table>


	<table class="table table-bordered">

		<tr>
			<th class="text-center sky col-md-3">부서코드</th>
			<th class="text-center sky col-md-3">부서이름</th>
			<th class="text-center sky col-md-3">직책</th>
			<th class="text-center sky col-md-2">직급</th>
			<th class="text-center sky col-md-1">근속일자</th>
		</tr>
		<tr>
			<td class="text-center"><span class="col-md-8" style="padding-left: 0"><input type="text" id="department_code" class="form-control input-sm"
				name="department_code" readonly="readonly"
				placeholder="부서 검색창을 눌러주세요"
				value="${hospital_content_view.department_code}" /></span><span class="col-md-1" style="padding-left: 0px;"><input
				type="button" value="부서 검색"
				OnClick="javascript:windowDepartSearch();"
				class="btn btn-info btn-sm" /></span></td>
			<td class="text-center"><input type="text" id="department" name="department" class="form-control input-sm"
				readonly="readonly" value="${hospital_content_view.department}" />
			</td>
			<td class="text-center"><span class="col-md-8" style="padding-left: 0"><input type="text" id="duty_responsibility_name" class="form-control input-sm"
				name="duty_responsibility" readonly="readonly"
				value="${hospital_content_view.duty_responsibility}"></span><span class="col-md-1" style="padding-left: 0px;"><input
				type="button" value="직책 검색" OnClick="javascript:windowDutySearch();"
				class="btn btn-info btn-sm"></span></td>
			<td class="text-center"><input type="text" name="rank_position" class="form-control input-sm"
				value="${hospital_content_view.rank_position}"></td>
			<td class="text-center">${hospital_content_view.continuous_service_date}</td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th class="text-center sky col-md-2">입사일자</th>
			<th class="text-center sky col-md-2">퇴사일자</th>
			<th class="text-center sky col-md-3">거래은행</th>
			<th class="text-center sky col-md-1">예금주</th>
			<th class="text-center sky col-md-4">계좌번호</th>
		</tr>
		<tr>
			<td class="text-center"><input type="text" name="join_date" readonly="readonly" class="form-control input-sm"
				value="${hospital_content_view.join_date}" /></td>
			<td class="text-center"><input type="text" name="retire_date" readonly="readonly" class="form-control input-sm"
				value="${hospital_content_view.retire_date}" /></td>
			<td class="text-center"><span class="col-md-8" style="padding-left: 0"><input type="text" id="bank_name" name="bank_name" class="form-control input-sm"
				value="${hospital_content_view.bank_name}" readonly="readonly"
				placeholder="은행 검색창을 눌러주세요" /></span><span class="col-md-1" style="padding-left: 0px;"><input type="button" value="은행 검색"
				OnClick="javascript:windowBankSearch();" class="btn btn-info btn-sm" /></span></td>
			<td class="text-center"><input type="text" name="account_holder" class="form-control input-sm"
				value="${hospital_content_view.account_holder}"></td>
			<td class="text-center"><input type="text" name="account_number" class="form-control input-sm"
				value="${hospital_content_view.account_number}"></td>
		</tr>
	</table>

<div class="col-md-12">
	<div class="col-md-1">
	<secu:authorize
		access="hasAnyRole('ROLE_human_resources_page1_master','ROLE_human_resources_page1_anything')">
		<input type="submit" value="수정" class="btn btn-warning btn-sm">
	</secu:authorize>
	</div>
	<div class="col-md-1 col-md-offset-10">
		<a href="hospital_list"  class="btn btn-success btn-sm">목록보기</a>
	</div>
</div>


</form>

