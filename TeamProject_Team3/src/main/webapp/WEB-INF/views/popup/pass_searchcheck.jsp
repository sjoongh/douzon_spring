<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/totalcss.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script language="javascript">
function pass_check(){
	var pwd = eval("document.pwd");
if(pwd.u_pwd.value!=pwd.u_pwd2.value){
	alert("비밀번호가 옳바르지 않습니다.");
	pwd.u_pwd.focus();
	return false;
}
alert("비밀번호가 변경되었습니다.");
return true;
}
</script>
<body>

	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>비밀번호 찾기</h2>
			</div>
			<div class="col-md-4  col-md-offset-4">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="POST"
						action="pass_searchupdate" name="pwd" onsubmit="return pass_check()">
						<input type="hidden" name="u_name" value="${u_name}">
						<legend>비밀번호수정</legend>
						<div class="form-group">
							<label for="u_pwd">변경 할 비밀번호</label> <input name="u_pwd" id="u_pwd"
								type="password" class="form-control" required="required" />

						</div>
						
							<div class="form-group">
							<label for="u_pwd2">변경 할 비밀번호 확인</label> <input name="u_pwd2" id="u_pwd2"
								type="password" class="form-control" required="required" />

						</div>
						
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="비밀번호 변경" />
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