<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<h3>account write</h3>
 <script language="javascript">	
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
</script> 

<form action="accountWrite" name="form1" method="post">
	<table class="table table-striped">

		<tr>
			<td>날짜</td>
			<td><input type="date" name="ac_date" required="required" class="form-control" style="width: 200px;"></td>
		</tr>
		<tr>
			<td>분류코드</td>
			<td>
				<select name="ac_typename" class="form-control" style="width: 200px;">
					<c:forEach items="${type_code}" var="tc">
						<option value="${tc.type_name}"/>${tc.type_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>내역</td>
			<td><input type="text" name="ac_cont" required="required" class="form-control" style="width: 200px;"></td>
		</tr>
		<tr>
			<td>수입</td>
			<td><input type="number" name="ac_imp" value="0" required="required" onkeydown="return onlyNumber(event)" class="form-control" style="width: 200px;"></td>
		</tr>
		<tr>
			<td>지출</td>
			<td><input type="number" name="ac_exp" value="0" required="required" onkeydown="return onlyNumber(event)" class="form-control" style="width: 200px;"></td>
		</tr>
		<tr>
			<td><input type="submit" value="추가" required="required" class="btn btn-primary btn-sm"></td>
		</tr>

	</table>
</form>