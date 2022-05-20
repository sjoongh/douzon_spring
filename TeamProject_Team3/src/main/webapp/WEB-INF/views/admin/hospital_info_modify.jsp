<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#file_logo").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<form action="" method="post" enctype="multipart/form-data">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">병원 정보 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive" id="table">
				<table class="table table-bordered">
					<tr>
						<td class="text-center gr col-md-2"><strong>병원명</strong></td>
						<td class="col-md-3"><input type="text" name="h_name" 
							value="${hospital.h_name}" required="required" class="form-control input-sm"> <input type="hidden"
							name="h_name1" value="${hospital.h_name}"></td>
						<td class="text-center gr col-md-2"><strong>병원장 이름</strong></td>
						<td class="col-md-5"><input type="text" name="h_master" required="required" class="form-control input-sm" 
							value="${hospital.h_master}"></td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>병원 연락처</strong></td>
						<td><input type="text" name="h_tel" value="${hospital.h_tel}" required="required" class="form-control input-sm"></td>
						<td class="text-center gr"><strong>병원장 연락처</strong></td>
						<td><input type="text" name="h_master_tel" class="form-control input-sm"
							value="${hospital.h_master_tel}"></td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>사업자등록증</strong></td>
						<td><input type="text" name="h_lnum" required="required" class="form-control input-sm"
							value="${hospital.h_lnum}"></td>
						<td class="text-center gr"><strong>병원 로고</strong></td>
						<td>
							<form id="form1" runat="server">
								<input type="file" name="files[0]" required="required" class="form-control input-sm"
									readonly="readonly" id="file_logo"><br> <c:if test="${sessionScope.logo != null}">
									<img src="resources/upload/${ sessionScope.logo }"
										id="logo_image" class="img-responsive img-circle">
								</c:if>
								<c:if test="${sessionScope.logo == null}">
									<img src="resources/images/essence1.png" id="logo_image" style="float: left;"
										class="img-responsive img-circle">
								</c:if>
								&nbsp; <img id="blah" src="#" alt="수정할 이미지" width="150px">
							</form>
						</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>병원 위치</strong></td>
						<td colspan="3"><textarea rows="1" cols="90" name="h_map" required="required" class="form-control input-sm">${hospital.h_map}</textarea></td>
					</tr>
					</tbody>
				</table>


				<div class="row">
					<div class="col-md-1">
						<secu:authorize
							access="hasRole('ROLE_admin_page1_master')">
							<input type="button" value="삭제" class="btn btn-danger btn-sm"
								onclick="location.href='hospital_info_delete?h_name1=${hospital.h_name}'">
						</secu:authorize>
					</div>
					<div class="col-md-2 col-md-offset-9">
						<input type="submit" value="수정" class="btn btn-warning btn-sm">
						&nbsp;&nbsp; <input type="button" value="뒤로가기"
							onclick="location.href='hospital_info'"
							class="btn btn-primary btn-sm">
					</div>
				</div>
			</div>
		</div>
	</div>



</form>

<script>

</script>