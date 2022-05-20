<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#imgInp").on('change', function() {
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
						<td><input type="text" name="h_name" required="required" class="form-control input-sm"> <input
							type="hidden" name="h_name1" class="col-md-3"></td>
						<td class="text-center gr col-md-2"><strong>병원장 이름</strong></td>
						<td><input type="text" name="h_master" required="required" class="col-md-5 form-control input-sm"></td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>병원 연락처</strong></td>
						<td><input type="text" name="h_tel" required="required" class="form-control input-sm"></td>
						<td class="text-center gr"><strong>병원장 연락처</strong></td>
						<td><input type="text" name="h_master_tel" required="required" class="form-control input-sm"></td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>사업자등록증</strong></td>
						<td><input type="text" name="h_lnum" required="required" class="form-control input-sm"></td>
						<td class="text-center gr"><strong>병원 로고</strong></td>
						<td>
							<form id="form1" runat="server">
								<input type="file" name="files[0]" required="required" readonly="readonly" id="imgInp" class="form-control input-sm"><br>
								<img id="blah" src="#" alt="" width="150px">
							</form>
						</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>병원 위치</strong></td>
						<td colspan="3"><textarea rows="1" cols="90" name="h_map" required="required" class="form-control input-sm"></textarea></td>
					</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-md-2 col-md-offset-10">
						<input type="submit" value="등록" class="btn btn-success btn-sm">
						&nbsp;&nbsp; <input type="button" value="뒤로가기"
							class="btn btn-primary btn-sm"
							onclick="location.href='hospital_info'">
					</div>
				</div>
			</div>
		</div>
	</div>
</form>





