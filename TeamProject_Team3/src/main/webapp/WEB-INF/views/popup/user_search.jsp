<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/totalcss.css">
<title></title>
</head>

<body>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">계정 추가</h3>
		</div>

		<div id="popup_layer" class="panel-body">
			<form class="form-horizontal" action="user_search" method="post">
				<div class="form-group">
					<label for="user_name"
						class="col-sm-2 col-sm-offset-3 control-label">검색할 이름</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="user_name"
							name="u_name">
					</div>
					<div class="col-sm-1">
						<input type="submit" class="btn btn-default" value="전송">
					</div>
				</div>
			</form>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<div class="panel-body">
						<div class="table-responsive" id="table">
							<table class="table table-condensed table-hover">
								<thead>
									<tr>
										<th class="text-center">사번</th>
										<th class="text-center">이름</th>
										<th class="text-center">연락처</th>
										<th class="text-center">부서</th>
										<th class="text-center"></th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ list }" var="dto" begin="0" varStatus="loop">
										<tr>
											<td class="text-center">${dto.u_id}<input type="hidden"
												name="u_id" id="u_id${loop.index}" value="${dto.u_id}">
											</td>
											<td class="text-center">${dto.u_name }</td>
											<td class="text-center">${dto.u_phone }</td>
											<td class="text-center">${dto.u_team }</td>
											<td><input type="button" value="확인" 
												onclick="UserSearch_submit(${loop.index})"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<script src="resources/js/bootstrap.min.js"></script>
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="resources/js/total_js.js"></script>

		</div>
	</div>

	<script type="text/javascript">
		function UserSearch_submit(index) {
			 var f = document.getElementById("u_id"+index).value;
			window.opener.location.href = "user_insert2?u_id=" + f; 
/* 			document.User_search_table.submit();  */
			self.close();
		}
	</script>
</body>
</html>