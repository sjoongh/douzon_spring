<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<script language="javascript">
function winOpen()
{
       window.open("basic_pay_list", "newWin", "width=700, height=500, toolbar=no, scrollbars=yes,location=no");
} 
</script>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">${month}월급여 리스트</h3>
	</div>
	<div class="col-md-4" style="margin: 10px auto;">
		<form action="hospital_pay_list" name="userinput" method="get">
			<div>
				<span class="col-md-5"> <select name="year"
					required="required" checked class="form-control input-sm">
						<option value="2017">2017년</option>
						<option value="2016">2016년</option>
						<option value="2015">2015년</option>
						<option value="2014">2014년</option>
						<option value="2013">2013년</option>
						<option value="2012">2012년</option>
						<option value="2011">2011년</option>
				</select></span> <span class="col-md-5"><select name="month"
					required="required" checked class="form-control input-sm">
						<option value="">선택</option>
						<option value="01">1월</option>
						<option value="02">2월</option>
						<option value="03">3월</option>
						<option value="04">4월</option>
						<option value="05">5월</option>
						<option value="06">6월</option>
						<option value="07">7월</option>
						<option value="08">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
				</select></span>
				<script type="text/javascript">
					document.userinput.year.value = "${year}";
				</script>
				<script type="text/javascript">
					document.userinput.month.value = "${month}";
				</script>
				<span class="col-md-2"><input type="submit" value="검색"
					class="btn btn-success btn-sm"> </span>
			</div>
		</form>
	</div>

	<%-- ${hospital_pay_list.month} --%>
	<!-- <a href="hospital_pay_list?month=03">[[3월 급여 리스트]]          </a><a href="hospital_pay_list?month=02">[[2월 급여 리스트]]          </a><a href="hospital_pay_list?month=01">[[1월 급여 리스트]]</a></h2> -->
	<div class="panel-body">
	<table class="table table-bordered ">
		<tr>
			<th class="col-md-1 sky text-center">사원번호</th>
			<th class="col-md-1 sky text-center">이름</th>
			<th class="sky text-center">직책</th>
			<th class="col-md-1 sky text-center">기본급</th>
			<th class="sky text-center">출근일</th>
			<th class="col-md-1 sky text-center">실급여</th>
			<th class="col-md-1 sky text-center">총급여</th>
			<th class="col-md-1 sky text-center">소득세</th>
			<th class="col-md-1 sky text-center">주민세</th>
			<th class="col-md-1 sky text-center">건강보험</th>
			<th class="col-md-1 sky text-center">국민연금</th>
			<th class="col-md-1 sky text-center">고용보험</th>
		</tr>

		<c:forEach items="${hospital_pay_list}" var="dto">
			<tr>
				<td class="text-center"><secu:authorize
						access="hasAnyRole('ROLE_human_resources_page3_master','ROLE_human_resources_page3_anything','ROLE_human_resources_page3_readWrite')">

						<a href="hospital_content_view_popup?emp_num=${dto.emp_num}"
							onClick="window.open(this.href, '', 'width=530, height=530'); return false;">${dto.emp_num}</a>
					</secu:authorize> <secu:authorize
						access="hasRole('ROLE_human_resources_page3_readOnly')">${dto.emp_num}
			</secu:authorize></td>
				<td class="text-center">${dto.emp_name }</td>
				<td class="text-center">${dto.duty_responsibility}</td>
				<td class="text-right">${dto.basic_pay}</td>
				<td class="text-center">${dto.cdate}일</td>
				<td class="text-right">${dto.real_pay}</td>
				<td class="text-right">${dto.total_pay}</td>
				<td class="text-right">${dto.nation_pension}</td>
				<td class="text-right">${dto.health_insurance}</td>
				<td class="text-right">${dto.unemployment_insurance}</td>
				<td class="text-right">${dto.income_tax}</td>
				<td class="text-right">${dto.residence_tax}</td>
			</tr>
		</c:forEach>

	<tr>
		<td colspan="11"><secu:authorize
			access="hasAnyRole('ROLE_human_resources_page3_master','ROLE_human_resources_page3_anything')">
			<input type="button" value="직책별 기본급 설정"
			onClick="winOpen();" class="btn btn-primary btn-sm" /></secu:authorize></td>
			<secu:authorize
					access="hasRole('ROLE_human_resources_page3_master')">
					<c:if test="${empty check}">
						<td colspan="1"><a
							href="insert_account?year=${year}&month=${month}&sum=${sum}"><input
								type="button" value="회계 저장" class="btn btn-primary btn-sm" /></a></td>
					</c:if>
				</secu:authorize>
			</tr>
	</table>
	</div>