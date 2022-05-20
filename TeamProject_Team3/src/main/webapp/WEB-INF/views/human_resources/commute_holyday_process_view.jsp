<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<c:if test="${ count > 0 }">
	<fmt:parseNumber var="pageCount"
		value="${count / cri.pageSize + (count % cri.pageSize == 0? 0:1) }"
		integerOnly="true" />
	<c:set var="startPage" value="${1 }" />
	<c:set var="pageBlock" value="${5 }" />

	<fmt:parseNumber var="result" value="${cri.currentPage / pageBlock }"
		integerOnly="true" />

	<c:if test="${cri.currentPage % pageBlock != 0 }">
		<c:set var="startPage" value="${result * pageBlock +1 }" />
	</c:if>
	<c:if test="${cri.currentPage % pageBlock == 0 }">
		<c:set var="startPage" value="${(result-1) * pageBlock +1 }" />
	</c:if>

	<c:set var="endPage" value="${startPage + pageBlock -1 }" />

	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }" />
	</c:if>

</c:if>


 <script>
function windowEmp_Num_Search()
{
	window.open("emp_num_search2", "newWin8", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
function windowAbsence_Search()
{
	window.open("absence_search", "newWin9", "width=600, height=600, toolbar=no, scrollbars=yes,location=no");
} 
function checkId() {
    var userinput = eval("document.commute_holyday_process");
    
    if (!userinput.emp_num.value) {
        alert("사원 번호를 입력하세요.");
        userinput.emp_num.focus();
        return false;
     }
    
    if (!userinput.status.value) {
        alert("결근 사유를 입력하세요.");
        userinput.status.focus();
        return false;
     }
    
}
</script> 

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">결근 사유 입력 페이지(관리자)</h3>
	</div>
	<div class="panel-body">

		<div class="col-md-3">
			<form name="commute_holyday_process" action="commute_holyday_process"
				method="post" onSubmit="return checkId()">
				<table class="table table-condensed table-bordered">
					<tr>
						<td>사원 번호 : <input type="text" id="emp_num" name="emp_num"
							readonly="readonly" class="form-control input-sm"> 
							<div align="right"><input
							type="button" value="사원 번호 검색"
							OnClick="javascript:windowEmp_Num_Search();"
							class="btn btn-primary btn-sm" style="margin-top: 5px;"/>
							</div></td>
					</tr>
					<tr>
						<td>사원 이름 : <input type="text" id="emp_name" name="emp_name"
							readonly="readonly" class="form-control input-sm"
							required="required" />
					<tr>
						<td>결근 사유 : <input type="text" id="status" name="status"
							class="form-control input-sm" readonly="readonly"
							required="required" /><div align="right"><input type="button" value="결근 사유 검색"
							OnClick="javascript:windowAbsence_Search();"
							class="btn btn-primary btn-sm" style="margin-top: 5px;" /></div></td>
					</tr>
					<tr>
						<td>시작 날짜 : <input type="date" name="start_day"
							class="form-control input-sm" required="required" /></td>
					</tr>
					<tr>
						<td>종료 날짜 : <input type="date" name="end_day"
							class="form-control input-sm" required="required" /></td>
					</tr>
					<tr>
						<td class="text-center"><div align="right"><input type=submit value="결근 사유 등록"
							class="btn btn-info btn-sm" /></div></td>
					</tr>
				</table>
			</form>
		</div>
		<form action="commute_holyday_process_view" name="userinput"
			id="userinput" method="get">
			<div class="col-md-3">
				<span class="col-md-5" style="padding-right: 5px; padding-left: 0;"> <select name="year"
					required="required" class="form-control input-sm">
						<option value="2016">2016년</option>
						<option value="2015">2015년</option>
						<option value="2014">2014년</option>
						<option value="2013">2013년</option>
						<option value="2012">2012년</option>
						<option value="2011">2011년</option>
				</select></span> <span class="col-md-5" style="padding-right: 5px; padding-left: 0;"> <select name="month"
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
				</select>
				</span>
				<script type="text/javascript">
					document.userinput.year.value = "${year}";
				</script>
				<script type="text/javascript">
					document.userinput.month.value = "${month}";
				</script>
				<span class="col-md-2" style="padding: 0;"> <input type="submit" value="검색"
					class="btn btn-success btn-sm">
				</span>
				
			</div>
		</form>
		<div class="col-md-9" align="center">
		<h6>현재 결근중인 사원 리스트</h6>
		</div>

		<div class="col-md-9">
<table class="table table-condensed table-bordered" >
		<tr>
			<th class="text-center sky">사원번호</th>
			<th class="text-center sky">사원이름</th>
			<th class="text-center sky">상태</th>
			<th class="text-center sky">날짜</th>
			<th class="text-center sky">전화번호</th>
			<th class="text-center sky"></th>
		</tr>
		<c:forEach items="${emp_absence_list_get}" var="dto">
			<tr>		
				<td class="text-center">	
				<a href="hospital_content_view_popup?emp_num=${dto.emp_num}" onClick="window.open(this.href, '', 'width=530, height=530'); return false;">${dto.emp_num}</a>
				</td>
				<input type="hidden" name="emp_absence_list_code" value="${dto.emp_absence_list_code}"/>
				<td class="text-center">${dto.emp_name }</td>				
				<td class="text-center">${dto.status }</td>
				<td class="text-center">${dto.seday }</td>
				<td class="text-center">${dto.telephone }</td>
				<td class="text-center"><a href="emp_absence_list_delete?emp_absence_list_code=${dto.emp_absence_list_code}&emp_num=${dto.emp_num}&status=${dto.status }">[삭제]</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" class="thick-line">
				<div align="center">
					<nav>
						<ul class="pagination" id="pagination">
							<c:if test="${startPage > pageBlock }">
								<li><a href="commute_holyday_process_view?year=2016&month=06&pageNum=${startPage-5}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<li><a href="commute_holyday_process_view?year=2016&month=06&pageNum=${i }"> ${i } <span
										class="sr-only">(current)</span>
								</a></li>
							</c:forEach>

							<c:if test="${endPage < pageCount }">
								<li><a href="commute_holyday_process_view?year=2016&month=06&pageNum=${startPage+5 }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>
	<hr>
	
	<div class="col-md-12" align="center">
		<h6>결근 신청중인 사원 리스트</h6>
		</div>
	<table class="table table-condensed table-hover table-bordered" >
	<tr>
			<th class="text-center sky">사원번호</th>
			<th class="text-center sky">신청자이름</th>
			<th class="text-center sky">상태</th>
			<th class="text-center sky">신청날짜</th>
			<th class="text-center sky">전화번호</th>
			<th class="text-center sky">승인</th>
			<th class="text-center sky">거절</th>
	</tr>
	<c:forEach items="${emp_absence_list_get2}" var="dto">
			<tr>		
				<td class="text-center">${dto.emp_num}</td>
				<input type="hidden" name="emp_absence_list_code" value="${dto.emp_absence_list_code}"/>
				<td class="text-center">${dto.emp_name }</td>				
				<td class="text-center">${dto.status }</td>
				<td class="text-center">${dto.seday }</td>
				<td class="text-center">${dto.telephone }</td>
				<td class="text-center"><a href="emp_absence_list_approval_input?emp_num=${dto.emp_num}&status=${dto.status }&emp_name=${dto.emp_name}&start_date=${dto.start_date}&end_date=${dto.end_date}&emp_absence_list_code=${emp_absence_list_code}">[승인]</td>
				<td class="text-center"><a href="emp_absence_list_delete3?emp_absence_list_code=${dto.emp_absence_list_code}&emp_num=${dto.emp_num}&status=${dto.status }">[거절]</td>
			</tr>
		</c:forEach>
		
	</table>
</div>
</div>

</div>
