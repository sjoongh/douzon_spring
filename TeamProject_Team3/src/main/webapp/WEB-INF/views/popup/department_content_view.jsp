<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>department_content_view 상세보기 페이지</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1" class="table table-striped">
		<form action=department_modify method="post">
			<tr>
				<td>부서 코드</td>
				<input type="hidden" name="department_code" value="${department_content_view.department_code}" class="form-control" style="width: 150px;">
				<td>${department_content_view.department_code}</td>
			</tr>
			<tr>
				<td>부서 이름</td>
				<td><input type="text" name="department" value="${department_content_view.department}" class="form-control" style="width: 150px;"></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="수정" class="btn btn-primary btn-sm">&nbsp;&nbsp;
					<a href="department_list">목록보기</a>&nbsp;&nbsp;
					
				</td>
			</tr>
		</form>
	</table>

</body>
</html>