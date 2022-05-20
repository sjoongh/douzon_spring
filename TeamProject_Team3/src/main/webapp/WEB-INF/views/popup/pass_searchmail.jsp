<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<script language="javascript">
	function innum_check() {
		var innu = eval("document.innu");
		if (innu.num.value != innu.innum.value) {
			alert("인증번호가 옳바르지 않습니다.");
			return false;
		}
		alert("인증번호이 완료되었습니다.");
		return true;
	}
</script>
<link rel="stylesheet" href="resources/css/totalcss.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>비밀번호 찾기</h2>
			</div>
			<div class="col-md-4  col-md-offset-4">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="POST"
						action="pass_searchcheck" name="innu"
						onsubmit="return innum_check()">
						<legend>인증번호</legend>
						<div class="form-group">
							<input type="hidden" name="num" value="${num}">
								<label for="userid">ID (사번)</label>
								<input name="u_id" id="u_id"
								type="text" class="form-control" value="${u_id}" />
						</div>
						<div class="form-group">
							<label for="username">이름</label> <input name="u_name" id="u_name"
								type="text" class="form-control" value="${u_name}" />

						</div>
						<div class="form-group">
							<label for="useremail">이메일</label> <input name="u_email"
								id="u_email" type="text" class="form-control" value="${u_email}" />

						</div>
						<div class="form-group">
							<label for="innum">인증번호</label> <input name="innum" id="innum"
								type="text" class="form-control" />

						</div>

						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="인증받기" />
						</div>


						<hr />

					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/total_js.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>