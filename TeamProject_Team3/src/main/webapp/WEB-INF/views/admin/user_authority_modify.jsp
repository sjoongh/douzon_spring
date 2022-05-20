<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<style>
tr td {
	padding-left: 2 !important;
	padding-right: 2 !important;
}

select {
	font-size: 11px !important;
}
</style>
<secu:authorize access="hasRole('ROLE_admin_page2_master')">

	<form name="role_selected" method="POST" action="user_authority_insert">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<input type="hidden" value="${c_id}" name="c_id">사원번호(ID)
					${ c_id }의 권한 수정
				</h3>
			</div>
			<div class="panel-body container">
				<div class="row">
					<div class="col-md-11" align="center">
						<table class="table table-bordered table-responsive">
							<thead>
								<tr class="bg-primary">
									<th class="text-center col-md-1" colspan="2">접수/예약</th>
									<th class="text-center col-md-1" colspan="2">환자</th>
									<th class="text-center col-md-1" colspan="2">재고</th>
									<th class="text-center col-md-1" colspan="2">회계</th>
									<th class="text-center col-md-1" colspan="2">인사</th>
									<th class="text-center col-md-1" colspan="2">게시판</th>
									<th class="text-center col-md-1" colspan="2">관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-center"><small>검색</small></td>
									<!-- 예약 -->
									<td class="text-center"><input type="hidden"
										value="reservation_page1" name="reservation_page1"> <select
										name="reservation_page1" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq reservation_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>

									<td class="text-center"><small>환자<br>목록
									</small></td>
									<!-- 환자 -->
									<td class="text-center"><input type="hidden"
										value="patient_page1" name="patient_page1"> <select
										name="patient_page1" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq patient_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>재고<br>등록
									</small></td>
									<!-- 재고 -->
									<td class="text-center"><input type="hidden"
										value="inventory_page1" name="inventory_page1"> <select
										name="inventory_page1" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq inventory_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>회계<br>내역
									</small></td>
									<!-- 회계 -->
									<td class="text-center"><input type="hidden"
										value="accounting_page1" name="accounting_page1"> <select
										name="accounting_page1" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq accounting_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>인사<br>관리
									</small></td>
									<!-- 인사 -->
									<td class="text-center"><input type="hidden"
										value="human_resources_page1" name="human_resources_page1">
										<select name="human_resources_page1"
										class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq human_resources_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>공지</small></td>
									<!-- 게시판-->
									<td class="text-center"><input type="hidden"
										value="board_page1" name="board_page1"> <select
										name="board_page1" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq board_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>병원<br>정보
									</small></td>
									<!-- 관리 -->
									<td class="text-center"><input type="hidden"
										value="admin_page1" name="admin_page1"><select
										name="admin_page1" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq admin_page_1 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
								</tr>

								<tr>
									<td class="text-center"><small>접수</small></td>
									<!-- 예약 -->
									<td class="text-center"><input type="hidden"
										value="reservation_page2" name="reservation_page2"> <select
										name="reservation_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq reservation_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>진료<br>관리
									</small></td>
									<!-- 환자 -->
									<td class="text-center"><input type="hidden"
										value="patient_page2" name="patient_page2"> <select
										name="patient_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq patient_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>구매<br>내역
									</small></td>
									<!-- 재고 -->
									<td class="text-center"><input type="hidden"
										value="inventory_page2" name="inventory_page2"><select
										name="inventory_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq inventory_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>결제<br>대기
									</small></td>
									<!-- 회계 -->
									<td class="text-center"><input type="hidden"
										value="accounting_page2" name="accounting_page2"><select
										name="accounting_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq accounting_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>

									<td class="text-center"><small>출근<br>관리
									</small></td>
									<!-- 인사 -->
									<td class="text-center"><input type="hidden"
										value="human_resources_page2" name="human_resources_page2"><select
										name="human_resources_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq human_resources_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>업무<br>보고서
									</small></td>
									<!-- 게시판-->
									<td class="text-center"><input type="hidden"
										value="board_page2" name="board_page2"><select
										name="board_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq board_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>계정<br>관리
									</small></td>
									<!-- 관리 -->
									<td class="text-center"><input type="hidden"
										value="admin_page2" name="admin_page2"><select
										name="admin_page2" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq admin_page_2 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
								</tr>


								<tr>
									<td class="text-center"><small>예약</small></td>
									<!-- 예약 -->
									<td class="text-center"><input type="hidden"
										value="reservation_page3" name="reservation_page3"><select
										name="reservation_page3" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq reservation_page_3 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>

									<td class="text-center"><small>처방<br>관리
									</small></td>
									<!-- 환자 -->
									<td class="text-center"><input type="hidden"
										value="patient_page3" name="patient_page3"><select
										name="patient_page3" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq patient_page_3 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>

									<td class="text-center"><small>거래처<br>목록
									</small></td>
									<!-- 재고 -->
									<td class="text-center"><input type="hidden"
										value="inventory_page3" name="inventory_page3"><select
										name="inventory_page3" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq inventory_page_3 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>

									<!-- 회계 -->
									<td class="text-center" colspan="2"></td>

									<td class="text-center"><small>급여<br>관리
									</small></td>
									<!-- 인사 -->
									<td class="text-center"><input type="hidden"
										value="human_resources_page3" name="human_resources_page3"><select
										name="human_resources_page3" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq human_resources_page_3 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>
									<td class="text-center"><small>회의록</small></td>
									<!-- 게시판-->
									<td class="text-center"><input type="hidden"
										value="board_page3" name="board_page3"><select
										name="board_page3" class="form-control input-sm">
											<c:forEach items="${authority}" var="au">
												<option value="${au.code}"
													${ au.authority eq board_page_3 ? 'selected' : '' }>${au.authority}</option>
											</c:forEach>
									</select></td>

									<!-- 관리 -->
									<td class="text-center" colspan="2"></td>


								</tr>
								<!-- 	<tr>
									<td colspan="2"></td>
									<td colspan="2"></td>
									<td colspan="2"></td>
									<td colspan="2"></td>
									인사
									<td class="text-center"><small>관리자</small></td>
									<td class="text-center"><input type="hidden"
										value="human_resources_page4" name="human_resources_page4"> <select
										class="form-control input-sm" name="human_resources_page4">
											<option value="master">관리자</option>
											<option value="anything">모든권한</option>
											<option value="readWrite">읽기/쓰기</option>
											<option value="readOnly">읽기</option>
											<option value="nothing">권한없음</option>
									</select></td>


									
									<td colspan="2"></td>
									<td colspan="2"></td>


								</tr> -->



								<tr>
									<!-- 예약 -->
									<td class="text-center" colspan="2">
									<input type="hidden" value="reservation_page" name="reservation_page0">
									<label>
									<span class="text-primary">
									<input type="radio" onclick="" class="view" value="view" name="reservation_page0" ${ reservation_page eq '사용가능' ? 'checked' : '' }>사용가능</span>
									</label>
									<label>
									<span style="color: red;">
									<input type="radio" onclick="" class="nothing"  value="nothing" name="reservation_page0" ${ reservation_page eq '권한없음' ? 'checked' : '' }>
												접근불가</span>
									</label></td>
									<!-- 환자 -->
									<td class="text-center" colspan="2"><input type="hidden"
										value="patient_page" name="patient_page0"><label><span
											class="text-primary"><input type="radio" ${ patient_page eq '사용가능' ? 'checked' : '' }
												value="view" name="patient_page0"> 사용가능</span></label> <label><span
											style="color: red;"><input type="radio" ${ patient_page eq '권한없음' ? 'checked' : '' }
												value="nothing" name="patient_page0"> 접근불가</span></label></td>

									<!-- 재고 -->
									<td class="text-center" colspan="2"><input type="hidden" 
										value="inventory_page" name="inventory_page0"> <label><span
											class="text-primary"> <input type="radio"  ${ inventory_page eq '사용가능' ? 'checked' : '' }
												value="view" name="inventory_page0"> 사용가능
										</span> </label><label> <span style="color: red;"><input
												type="radio" onclick="" value="nothing" ${ inventory_page eq '권한없음' ? 'checked' : '' }
												name="inventory_page0"> 접근불가</span></label></td>
									<!-- 회계 -->
									<td class="text-center" colspan="2"><input type="hidden"
										value="accounting_page" name="accounting_page0"><label><span
											class="text-primary"><input type="radio" ${ accounting_page eq '사용가능' ? 'checked' : '' }
												value="view" name="accounting_page0"> 사용가능</span> </label><label>
											<span style="color: red;"><input type="radio" class="nothing" value="nothing" name="accounting_page0" ${ accounting_page eq '권한없음' ? 'checked' : '' }>
												접근불가</span>
									</label></td>

									<!-- 인사 -->
									<td class="text-center" colspan="2"><input type="hidden"
										value="human_resources_page" name="human_resources_page0">
										<label><span class="text-primary"><input
												type="radio" onclick="" value="view"  ${ human_resources_page eq '사용가능' ? 'checked' : '' }
												name="human_resources_page0" > 사용가능</span></label><label> <span
											style="color: red;"> <input type="radio" ${ human_resources_page eq '권한없음' ? 'checked' : '' }
												value="nothing" name="human_resources_page0"> 접근불가
										</span>
									</label></td>
									<!-- 게시판-->
									<td class="text-center" colspan="2"><input type="hidden"
										value="board_page" name="board_page0"><label><span
											class="text-primary"><input type="radio" ${ board_page eq '사용가능' ? 'checked' : '' }
												value="view" name="board_page0" > 사용가능</span></label><label>
											<span style="color: red;"> <input type="radio"  ${ board_page eq '권한없음' ? 'checked' : '' }
												onclick="" value="nothing" name="board_page0"> 접근불가
										</span>
									</label></td>

									<!-- 관리 -->
									<td class="text-center" colspan="2"><input type="hidden"
										value="admin_page" name="admin_page0"><label><span
											class="text-primary"><input type="radio" ${ admin_page eq '사용가능' ? 'checked' : '' }
												value="view" name="admin_page0" > 사용가능</span></label><label>
											<span style="color: red;"><input type="radio"  ${ admin_page eq '권한없음' ? 'checked' : '' }
												onclick="" value="nothing" name="admin_page0"> 접근불가</span>
									</label></td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</form>

	<div class="col-md-3 col-md-offset-9">
		<input type="hidden" value="${c_id}" name="u_id" id="u_id"> <input
			type="button" onclick="form_submit()" value="전송"
			class="btn btn-info btn-sm"> &nbsp;&nbsp;&nbsp;&nbsp; <input
			type="button" onclick="form_reset()" value="초기화"
			class="btn btn-warning btn-sm"> &nbsp;&nbsp;&nbsp;&nbsp; <input
			type="button" onclick="backPage()" value="뒤로가기"
			class="btn btn-danger btn-sm">
	</div>
	<script type="text/javascript">
		function form_submit() {
			document.role_selected.submit();
		}
		function form_reset() {
			document.role_selected.reset();
		}
		function backPage() {
			document.location.href = "user_admin?pageNum=1";
		}

	</script>
</secu:authorize>
