<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet"
   href="resources/css/morris.css">
<script
   src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="resources/js/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/broken-axis.js"></script>

<script>
$(function () {
   var xa =Number($("#sumImp").val());;
   var xb=Number($("#sumExp").val());
   var xc=xa-xb;
    console.log("xa="+xa+"xb"+xb);
    $("#searchSumbit").click(
            function() {
              
               var date1=$("#date1").val();
               var date2=$("#date2").val();
               var ac_typename=$("#ac_typename").val();
               $.ajax({
                  type: "post",
                  url : "accountList2",
                  data: {
                     date1 : date1,
                     date2 : date2,
                     ac_typename : ac_typename
                  },
                  success : function(result) {
                     console.log(result);
                     var   content="<table>" ;
                     var list=result['list3'];
                     var content="<table class='table table-hover'>";
                     var list=result['list3'];
                     for (i=0; i< list.length; i++) { 
                    	 if(result.list3[i].ac_typename != 'TEST'){
                    
                        content += "<input type='hidden' value=" + result.list3[i].ac_seq + ">";
                        content += "<tr>";
                        content += "<td width='15%' class='text-center'>"+ result.list3[i].ac_date + "</td>";
                        content += "<td width='15%' class='text-center'>" + result.list3[i].ac_typename + "</td>";
                        content += "<td width='20%' class='text-center'>" + result.list3[i].ac_cont + "</td>";
                        content += "<td width='15%' class='text-center'>" + result.list3[i].ac_imp + "</td>";
                        content += "<td width='15%' class='text-center'>" + result.list3[i].ac_exp + "</td>";
                        content += "<td width='10%' class='text-center'>" + "<a href='accountModify?ac_seq=" + result.list3[i].ac_seq +"' class='btn btn-warning btn-xs'>수정</a></td>";
                        content += "<td width='10%' class='text-center'>" + "<a href='accountDelete?ac_seq=" + result.list3[i].ac_seq+ "' class='btn btn-danger btn-xs'>삭제</a></td>";
                        content += "</tr>";
                    	 }
                     }
                     content += "<tr><td colspan='7' class='thick-line'></td></tr>"
                     content += "</table>"
                     /* alert("success"); */

                     console.log(content);

                     $("#cont").html(content);

                     var content2 = "<table class='table table-bordered' style='margin-top: 50px;'>";
                     var list2 = result['list2'];
                     for (j = 0; j < list2.length; j++) {
                        content2 += "<tr><th class='text-center'>총 수입</th>";
                        content2 += "<td class='text-right'>"+ result.list2[j].sum_ac_imp+ "</td>";
                        content2 += "</tr>";
                        content2 += "<tr><th class='text-center'>총 지출</th>";
                        content2 += "<td class='text-right'>" + result.list2[j].sum_ac_exp + "</td>";
                        content2 += "</tr>";
                        content2 += "<tr><th class='text-center'>총 매출</th>";
                        content2 += "<td class='text-right'>" + (result.list2[j].sum_ac_imp - result.list2[j].sum_ac_exp) + "</td>";
                        content2 += "</tr>";
                        $("#sumImp").val(result.list2[0].sum_ac_imp);
                        $("#sumExp").val(result.list2[0].sum_ac_exp);
                     }
                        content2 += "</table>";
                        $("#select1").html(content2);
                       var xa =Number($("#sumImp").val());;
                      var xb=Number($("#sumExp").val());
                      var xc=xa-xb;
                        $('#container').highcharts({
                            
                            chart: {
                                type: 'column'
                            },
                             title: {
                                title: false,
                            }, 
                            xAxis: {
                                categories: ['이번달']
                            },
                            yAxis: {
                                lineColor: 'black',
                                lineWidth: 3,
                                title: false,
                                tickInterval: 100,
                            },
                            series: [{
                                name: '총수입',
                                data: [xa]
                            }, {
                                name: '총지출',
                                data: [xb]
                            },
                            {
                                name: '총매출',
                                data: [xc]
                            }
                            ]
                        });
                  },
                  
                  error : function(err) {
                     console.log(err);
                     alert(err);
                  }
               });
           });
   
   /*  $(function highcharts(){ */
     $('#container').highcharts({
        
         chart: {
             type: 'column'
         },
          title: {
             title: false,
         }, 
         xAxis: {
             categories: ['이번달']
         },
         yAxis: {
             lineColor: 'black',
             lineWidth: 3,
             title: false,
             tickInterval: 100,
         },
         series: [{
             name: '총수입',
             data: [xa]
         }, {
             name: '총지출',
             data: [xb]
         
         },
         {
             name: '총매출',
             data: [xc]
         }
         ]
     });
    
     
            });

    
</script>

<script type="text/javascript">
   function psss(x) {
      var dt = new Date();
      var s = leadingZeros(dt.getFullYear(), 4) + '-'
            + leadingZeros(dt.getMonth() + 1, 2) + '-'
            + leadingZeros(dt.getDate(), 2);
      /* alert(s); */
      document.search.date2.value = s;
      switch (x) {
      /* 당월 */
      case 1:
         var s = leadingZeros(dt.getFullYear(), 4) + '-'
               + leadingZeros(dt.getMonth() + 1, 2) + '-01';
         document.search.date1.value = s;
         break;
      /* 당일 */
      case 2:
         var s = leadingZeros(dt.getFullYear(), 4) + '-'
               + leadingZeros(dt.getMonth() + 1, 2) + '-'
               + leadingZeros(dt.getDate(), 2);
         document.search.date1.value = s;
         break;
      /* 1주일  */
      case 3:
         var sd = dt;
         sd.setDate(dt.getDate() - 7);
         var s = leadingZeros(sd.getFullYear(), 4) + '-'
               + leadingZeros(sd.getMonth() + 1, 2) + '-'
               + leadingZeros(sd.getDate(), 2);
         document.search.date1.value = s;
         break;
      /* 3개월 */
      case 4:
         var sd = dt;
         sd.setMonth(dt.getMonth() - 7);
         var s = leadingZeros(sd.getFullYear(), 4) + '-'
               + leadingZeros(sd.getMonth() + 1, 2) + '-'
               + leadingZeros(sd.getDate(), 2);
         document.search.date1.value = s;
         break;
      }
   }

   function leadingZeros(n, digits) {
      var zero = '';
      n = n.toString();

      if (n.length < digits) {
         for (i = 0; i < digits - n.length; i++)
            zero += '0';
      }
      return zero + n;
   }
   function winOpen() {
      //var f = document.getElementById("seqValue").value();
      window
            .open("accountModify", "newWin",
                  "width=700, height=500, toolbar=no, scrollbars=yes,location=no");
   }
</script>
<div class="panel panel-primary">
   <div class="panel-heading">
      <h3 class="panel-title">회계내역</h3>
   </div>
   <div class="panel-body" style="padding-top: 20px;" align="center">
      <div>
         <div id="search" class="col-md-5" style="height: 250px; vertical-align: middle;">
            <form method="post" action="accountList" name="search">
               <h4 style="color: black; margin-bottom: 20px;">조회</h4>
               <div>
                  <span class="col-md-5" style="padding-right: 0;"> 
                     <input type="date" name="date1" id="date1" class="form-control input-sm" value="${date1}" >
                  </span>
                  <span class="col-md-2"> ~ </span>
                  <span class="col-md-5" style="padding-left:0">
                     <input type="date" name="date2" class="form-control input-sm" id="date2" value="${date2}">
                  </span> 
               </div>
               <div class="col-md-4 col-md-offset-8" style="margin-top: 10px; margin-bottom: 15px;">
                  <select name="ac_typename" class="form-control input-sm" id="ac_typename">
                     <option value="">전체</option>
                     <c:forEach items="${type_code}" var="tc">
                     <option value="${tc.type_name}">${tc.type_name}</option>
                     </c:forEach>
                  </select>
               </div>
               <div class="col-md-12">
                  <input type="reset" class="btn btn-primary btn-sm col-md-2" value="초기화" >
                  <input type="button" class="btn btn-info btn-sm col-md-2" value="당  일" onclick="psss(2)"> 
                  <input type="button" class="btn btn-info btn-sm col-md-2" value="당  월" onclick="psss(1)"> 
                  <input type="button" class="btn btn-info btn-sm col-md-2" value="1주일" onclick="psss(3)">
                  <input type="button" class="btn btn-info btn-sm col-md-2" value="3개월" onclick="psss(4)"> 
                  <input type="button" id="searchSumbit" class="btn btn-success btn-sm col-md-2" value="조  회">   
               </div>
            </form>

         </div>

      </div>
      <div id="select" class="col-md-3" style="height: 250px;"
         align="center">
         <c:forEach items="${list2}" var="list2">
         <input type="hidden" id="sumImp" value="${list2.sum_ac_imp}">
         <input type="hidden" id="sumExp" value="${list2.sum_ac_exp}">
         <div id="select1">
         
         <%-- <input type="text" id="sumImp" value="${list2.sum_ac_imp}">
         <input type="text" id="sumExp" value="${list2.sum_ac_exp}"> --%>
            <table class="table table-bordered" style="margin-top: 50px;">
               
                  <tr>
                     <th class="text-center">총 수입</th>
                     <td class="text-right">${list2.sum_ac_imp}</td>
                  </tr>
                  <tr>
                     <th class="text-center">총 지출</th>
                     <td class="text-right">${list2.sum_ac_exp}</td>
                  </tr>
                  <tr>
                     <th class="text-center">총 매출</th>
                     <td class="text-right">${list2.sum_ac_imp - list2.sum_ac_exp}</td>

                  </tr>
               </c:forEach>
            </table>
         </div>

      </div>
      <div class="col-md-4" align="right">
         <div id="container" style="height: 250px;"></div>
      </div>
   </div>
<secu:authorize
			access="hasAnyRole('ROLE_accounting_page1_master','ROLE_accounting_page1_anything')">
			
   <table class="table">
      <tr style="border-top: 1px solid gray; border-bottom: 1px solid gray; background-color: #F0F8FF;">
         <th width='15%' class="text-center">날짜</th>
         <th width="15%" class="text-center">분류코드</th>
         <th width="20%" class="text-center">내역</th>
         <th width="15%" class="text-center">수입</th>
         <th width="15%" class="text-center">지출</th>
         <th width="10%" class="text-center">수정</th>
         <th width="10%" class="text-center">삭제</th>
         <th width="17px;"></th>
      </tr>
   </table>

<div style="overflow-y: scroll;   max-height: 400px; height: 400px"
   id="cont">
   <table class="table table-hover">

      <c:forEach items="${list}" var="list">
         <c:if test="${list.ac_typename != 'TEST' }">
            <input type="hidden" value="${list.ac_seq}" id="seqValue">
            <tr>
               <td width="15%" class="text-center">${list.ac_date}</td>
               <td width="15%" class="text-center">${list.ac_typename}</td>
               <td width="20%" class="text-center">${list.ac_cont}</td>
               <td width="15%" class="text-center">${list.ac_imp}</td>
               <td width="15%" class="text-center">${list.ac_exp}</td>
               <td width="10%" class="text-center"><a href="accountModify?ac_seq=${list.ac_seq }" class="btn btn-warning btn-xs"
                  onClick="window.open(this.href, '', 'width=700, height=500'); return false;">수정</a></td>
               <td width="10%" class="text-center"><a href="accountDelete?ac_seq=${list.ac_seq }" class="btn btn-danger btn-xs">삭제</a></td>
            </tr>
         </c:if>
      </c:forEach>
      <tr>
      <td colspan="7" class="thick-line"></td>
      </tr>
   </table>

</div>
</secu:authorize>
<secu:authorize access="hasAnyRole('ROLE_accounting_page1_master','ROLE_accounting_page1_anything','ROLE_accounting_page1_readWrite')">
			
<a href="accountWrite" class="btn btn-info btn-sm" style="margin-bottom: 10px; margin-left: 10px;">내역추가</a></secu:authorize>
</div>
</body>
