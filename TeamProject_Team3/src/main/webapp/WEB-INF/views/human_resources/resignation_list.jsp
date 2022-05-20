<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<script language="javascript">
function windowResignationSign()
{
	window.open("resignation_sign", "newWin2", "width=600, height=700, toolbar=no, scrollbars=yes,location=no");
} 

function windowResignationCancel()
{
	window.open("resignation_cancel", "newWin2", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
</script>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">퇴사자 리스트</h3>
	</div>
<div class="panel-body">
	 <div>
	 <input type="button" value="퇴사자 등록" class="btn btn-danger btn-sm" onClick="windowResignationSign()">
	 <input type="button" value="퇴사자 등록 취소" class="btn btn-info btn-sm" onClick="windowResignationCancel()">
	 </div>
	 <h5>"퇴사 처리를 원하시면 "퇴사자 등록 버튼을 눌러주세요"</h5>
	 <h5>"사원의 권익 보호를 위해 퇴사 처리가 완료 되어도 퇴사 일자 기준 180일 후에 사원의 정보를 삭제 가능합니다."</h5>
	 
<table class="table table-condensed table-hover table-bordered">
	<tr>
		<th class="text-center sky">사원번호</th>
		<th class="text-center sky">이름	</th>
		<th class="text-center sky">전화번호</th>
		<th class="text-center sky">이메일</th>
		<th class="text-center sky">부서	</th>
		<th class="text-center sky">직책</th>
		<th class="text-center sky">입사일</th>
		<th class="text-center sky">퇴사일</th>
		<th class="text-center sky">퇴사후기간</th>
		<th class="text-center sky">정보삭제</th>
	</tr>

	<c:forEach items="${ resignation_list }" var="dto">
		<tr>
			<td class="text-center"><a href="hospital_content_view_resignation?emp_num=${dto.emp_num }" onClick="window.open(this.href, '', 'width=530, height=530'); return false;">${dto.emp_num }</a>
			</td>
			<td class="text-center">${dto.emp_name }</td>
			<td class="text-center">${dto.telephone }</td>
			<td class="text-center">${dto.email }</td>
			<td class="text-center">${dto.department}</td>
			<td class="text-center">${dto.duty_responsibility }</td>
			<td class="text-center">${dto.join_date }</td>
			<td class="text-center">${dto.retire_date }</td>
			<td class="text-center">${dto.diffdays}일</td>
			
			<td class="text-center">
			<c:if test="${dto.diffdays >180}">
			<a href="hospital_delete?emp_num=${dto.emp_num}">[삭제]
			</c:if>
			</a>
			
			</td>
		</tr>
	</c:forEach>
	<%-- <c:forEach items="${ resignation_list2 }" var="dto">
		<tr>
		<td class="text-center">${dto.diffdays}</td>
		</tr>
	</c:forEach> --%>
	[퇴사 인원 : ${resignation_list.size()}명]

</table>
