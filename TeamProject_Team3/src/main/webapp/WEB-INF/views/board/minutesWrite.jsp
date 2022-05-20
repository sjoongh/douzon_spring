<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table class="table table-bordered" table width="500" cellpadding="0" cellspacing="0" border="1">
	<form action="minutesWrite" method="post" enctype="multipart/form-data">
		<tr> 
			<td class="active" align="center">이름</td>
			<td><input type="text" name="m_name" required="required" size="50" class="form-control"></td>
		</tr>
		<tr>
			<td class="active" align="center">제목</td>
			<td><input type="text" name="m_title" required="required" size="50" class="form-control"></td>
		</tr>
		<tr>
			<td class="active" align="center">내용</td>
			<td><textarea name="m_content" required="required" rows="10" class="form-control"></textarea></td>
		</tr>
		<tr>
			<td class="active" align="center" >첨부파일</td>
			<td>
				<input type="file" name="files[0]" readonly="readonly" class="form-control">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="입력" class="btn btn-success"> &nbsp;
				<input type="button" value="목록" onclick="location.href='minutesList'" class="btn btn-info">
			</td>
		</tr>
	</form>
</table>
