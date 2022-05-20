<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<form action="accountModify" method="post">
 <table width="500" cellpadding="0" cellspacing="0" border="1" class="table table-striped">
<input type="hidden" name="ac_seq" value="${modify_form.ac_seq}"/>
  <tr>
   <td>날짜</td>
   <td>분류명</td>
   <td>내역</td>
   <td>수입</td>
   <td>지출</td>
  </tr>
	
  <tr>
    <td>
    <input type="date" name="ac_date"
    value="${ modify_form.ac_date }" required="required" class="form-control" style="width: 180px;"/>
    </td>	
        
    <td>
    <select name="ac_typename" class="form-control input-sm" id="ac_typename">
          <c:forEach items="${type_code}" var="tc">
          <option value="${tc.type_name}" ${ tc.type_name eq modify_form.ac_typename ? 'selected' : '' }>${tc.type_name}</option>
          </c:forEach>
    </select>
    </td>								
    
     <td>
    <input type="text" name="ac_cont"
    value="${ modify_form.ac_cont }" required="required" class="form-control" style="width: 100px;">
    </td>
    
    <td>
    <input type="text" name="ac_imp"
    value="${ modify_form.ac_imp }" required="required" class="form-control" style="width: 100px;">
    </td>
    
    <td>
    <input type="text" name="ac_exp"
    value="${ modify_form.ac_exp }" required="required" class="form-control" style="width: 100px;">
    </td>
    
    <td>
    <input type="submit" value="수정" class="btn btn-primary btn-sm">
    </td>
  </tr>

 </table>
</form>