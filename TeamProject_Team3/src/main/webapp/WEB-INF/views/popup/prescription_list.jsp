<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/totalcss.css">
<script>
function checkId() {
    var userinput = eval("document.pre");
    
    if (!userinput.pre_day.value) {
        alert("사원번호를 입력하세요.");
        userinput.pre_day.focus();
        return false;
     }
}
</script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/total_js.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KOSTA 109</title>
</head>
<body>
   <form action="" name="pre" >
      <table class="table table-bordered">
         <tr class="active">
            <th class="text-center"></th>
            <th class="text-center">처방코드</th>
            <th class="text-center">처방제품</th>
            <th class="text-center">1일투여횟수</th>
            <th class="text-center">총투약일수</th>
            <th class="text-center">처방용법</th>
         </tr>

         <c:forEach items="${prescription_list}" var="pl">
            <tr>
               <td class="text-center"><input type="checkbox" class="pre_check" /></td>
               <td class="text-center">${pl.pre_code}</td>
               <td class="text-center">${pl.pre_name}</td>
               <td class="text-center"><input type="text" value="${pl.pre_day }" name="pre_day"
                   class="form-control input-sm" required="required"></td>
               <td class="text-center"><input type="text" value="${pl.pre_total }"
                  name="pre_total"  class="form-control input-sm" required="required"></td>
               <td class="text-center">${pl.pre_way}</td>
            </tr>
         </c:forEach>
      </table>
            <div class="col-md-11">
      <div align="right"><input type="button" id="checkPre" class="btn btn-info btn-sm"  value="처방 내용 추가하기" /></div></div>
      
   </form>
   
   <script type="text/javascript">
      var list = [];
      $(function() {
         $("#checkPre").click(function() {
            list2 = [];
            $(".pre_check:checked").each(function(idx, row) {
               var record2 = $(row).parents("tr");
               var tdsp = $(record2[0]).children();
               tdsp = $(tdsp);
               var code2 = $(tdsp[1]).text();
               var name2 = $(tdsp[2]).text();
               var dayInput = $(tdsp[3]).children()[0];
               var day = dayInput.value;
               var totalInput = $(tdsp[4]).children()[0];
               var total = totalInput.value;
               var way = $(tdsp[5]).text();
               if(!day){
                   alert('1일 투여횟수를 입력해주세요');
                   return;
                }
                if(!total){
                   alert('총 투약일수를 입력해주세요');
                   return;
                }
               var obj = {
                  code2 : code2,
                  name2 : name2,
                  day : day,
                  total : total,
                  way : way
               };
               list.push(obj);
            
                  
            });
            
            opener.preCheckList(list);
            window.close();
            // TODO close popup
         });
      });
   </script>
</body>
</html>