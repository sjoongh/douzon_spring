<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/total_js.js"></script>
<link rel="stylesheet" href="resources/css/totalcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>kosta 109</title>
</head>
<body>
   <form action="" name="qqqq">
      <table class="table table-bordered">
         <tr class="active">
            <th class="text-center"></th>
            <th class="text-center">진료코드</th>
            <th class="text-center">진료이름</th>
            <th class="text-center">진료내용</th>
            <th class="text-center">진료가격</th>
         </tr>
         <c:forEach items="${customer_list}" var="cl">
            <tr>
               <td class="text-center"><input type="checkbox" 
                  class="tr_check" /></td>
               <td class="text-center">${cl.t_code }<%-- <input type="hidden" name="t_code11" value="${cl.t_code}"> --%></td>
               <td class="text-center">${cl.t_name }<%-- <input type="hidden" name="t_name" value="${cl.t_name}"> --%></td>
               <td class="text-center"><input type="text" class="form-control input-sm"
                  value="${cl.t_content }" name="t_content" required="required"></td>
               <td class="text-center">${cl.t_pay }<%-- <input type="hidden" name="t_pay" value="${cl.t_pay}"> --%></td>
            </tr>
         </c:forEach>
      </table>
      <div class="col-md-11">
      <div align="right"><input type="button"  class="btn btn-info btn-sm" id="checkConsole" value="진료 내용 추가하기" /></div></div>
   </form>
   <script type="text/javascript">
      var list = [];
      $(function() {
         $("#checkConsole").click(function() {
            list = [];
            $(".tr_check:checked").each(function(idx, row) {
               var record = $(row).parents("tr");
               var tds = $(record[0]).children();
               tds = $(tds);
               var code = $(tds[1]).text();
               var name = $(tds[2]).text();
               var contentInput = $(tds[3]).children()[0];
               var content = contentInput.value;
               var fee = $(tds[4]).text();
               if(!content){
               	alert('진료내용을 입력해주세요');
                   return;            	
               }
               
               var obj = {
                  code : code,
                  name : name,
                  content : content,
                  fee : fee
               };
                 list.push(obj);
            });
            	opener.recvCheckList(list);
                window.close();
         });
      });
   </script>
</body>
</html>