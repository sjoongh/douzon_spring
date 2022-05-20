<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script language="javascript">
function search_info(){
	var search = eval("document.search");
if(!search.u_id.value ){
	alert("아이디를 입력하세요.");
	search.u_id.focus();
	return false;
}
if(!search.u_name.value ){
	alert("이름을 입력하세요.");
	search.u_name.focus();
	return false;
}
if(!search.u_email.value ){
	alert("이메일을 입력하세요.");
	search.u_email.focus();
	return false;
}
alert("인증번호가 전송되었습니다.");
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
					<form accept-charset="UTF-8" role="form" method="post"
						action="pass_search" name="search" onsubmit="return search_info()">
						<legend>비밀번호찾기</legend>
						<div class="form-group">
							<label for="userid">ID (사번)</label> <input name="u_id"
								id="username" placeholder="ID를 입력하세요." type="text"
								class="form-control" />
						
						</div>
						<div class="form-group">
							<label for="username">이름</label> <input name="u_name" id="userid"
								placeholder="이름을 입력하세요." type="text" class="form-control" />
							
						</div>
						<div class="form-group">
							<label for="useremail">이메일</label> <input name="u_email"
								id="useremail" placeholder="이메일을 입력하세요." type="text"
								class="form-control" />
							
						</div>

						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="인증번호 받기" />
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