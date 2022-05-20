<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
	

<link rel='stylesheet' href='http://fullcalendar.io/js/fullcalendar-2.7.3/lib/cupertino/jquery-ui.min.css' />
<link rel='stylesheet'
	href='http://fullcalendar.io/js/fullcalendar-2.7.2/fullcalendar.css' />
<link rel='stylesheet'
	href='http://fullcalendar.io/js/fullcalendar-2.7.2/fullcalendar.print.css'
	media='print' />
	
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js'></script>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.2/fullcalendar.min.js'></script>
<script>
var list = '${json}';
var jsonObj = JSON.parse(list);
console.log(jsonObj);
	$(function() {
		$('#calendar')
		     
				.fullCalendar(
						{
							theme: true,
							header : {
								left : 'prev,next, today',
								center : 'title',
								right : 'month,basicWeek,basicDay'
							},
									

								    allDayText: '시간', // 주간,월간

								    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

								    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

								    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],

								    dayNamesShort: ['일','월','화','수','목','금','토'],

								    buttonText: {

								prev: '이전달',

								next: '다음달',

								today: '오늘',

								month: '월간',

								week: '주간',

								day: '일간'

								    },
								    
							 
							editable : true,
							eventLimit : true, // allow "more" link when too many events
							dayRender: function(date, cell) {
								var d=date.format("d");
					            var obj = $(cell);
					            var currentTime = moment();
					            if (d==0 || d==6){
					            	return;
					            }
					            
					            if (date > currentTime) return;    // 현재날짜보다 큰 경우 아무것도 그리지 않음.
					            if (date.format("YYYYMMDD") < currentTime.format("YYYYMMDD")) return;
					            var showAttend = true, showLeave = false;
					            var myFormat = date.format('YYYYMMDD');
					            for(var i = 0; i < jsonObj.length; i++) {
					            	var row = jsonObj[i];
					            	var day = row.day;
					            	
					            	var status = row.status;
					           	 if (status != '출근') {
					            		showAttend = false;
					            		showLeave = false;
					            	}	
					           	 else if(status =='출근' && status !='퇴근' ){
					           		showAttend = false;
					           		showLeave = true;
					           	 }
					           	 else if (status == '출근') {
					            		showAttend = false;
					            		showLeave = true;
					            	}
					            	 else if (status == '퇴근') {
					            		showLeave = false;
					            	} 					            	 
					            }
					            
					            var center = $('<center id="date_' + date.format('YYYYMMDD') + '"><br/><br/><br/>');
					            if (showAttend) {
					            	var attendBtn = $('<input type="button" value="출근" style="margin-top:12px;">');
						            attendBtn.click(function () {
						               clickAttend(date, this);
						            });
						            center.append(attendBtn).append();
					            }
					            if (showLeave) {
					            	var leaveBtn = $('<input type="button" value="퇴근" style="margin-top:12px;">');
						            leaveBtn.click(function () {
						               clickLeave(date, this);
						            });
						            center.append(leaveBtn);
					            }
					            obj.append(center); 
							}
						});
		
		
		getEvents();
	});

	// 출근 버튼 클릭시
	function clickAttend(date, obj) {
		 $.get("commute_check", {
			   status: "0"
		   }, function(data) {
			   if (data.code == 200) {
				   alert('출근 처리되었습니다.');
				
			   } else {
				   alert('error!');
			   }
			   // 출근 버튼을 없앤다
			      $(obj).remove();			      
			   // TODO 출근 이벤트 추가
			      getEvents2();
			      
			      var center=$('#date_'+date.format('YYYYMMDD'));
			      var leaveBtn = $('<input type="button" value="퇴근" style="margin-top:12px;">');
		            leaveBtn.click(function () {
		              clickLeave(date, this);
		            });
		            center.append(leaveBtn);			    			     
		   });
	}
	// 퇴근 버튼 클릭시
	function clickLeave(date, obj) {
		console.log(obj);
	   $.get("commute_check", {
		   status: "1"
	   }, function(data) {
		   //alert(data.code);
		   if (data.code == 200) {
			   alert('퇴근 처리되었습니다.');
			
		   } else {
			   alert('error!');
		   }
		   // 퇴근 버튼을 없앤다
		      $(obj).remove();
		      getEvents3();
		   // TODO 퇴근 이벤트 추가
	   });
	   
	}
	function getEvents() {
		$.get("get_events", {
		}, function (data) {
			// 내 캘린더에 추가			
			console.log(data);
			$('#calendar').fullCalendar( 'addEventSource', data);
		});
	}
	
	function getEvents2() {
		$.get("get_events2", {
		}, function (data) {
			// 내 캘린더에 추가			
			console.log(data);
			$('#calendar').fullCalendar( 'addEventSource', data);
		});
	}
	function getEvents3() {
		$.get("get_events3", {
		}, function (data) {
			// 내 캘린더에 추가			
			console.log(data);
			$('#calendar').fullCalendar( 'addEventSource', data);
		});
	}
</script>
<style>
.fc-row .fc-content-skeleton {
    position: relative;
    z-index: 1;
  }
#calendar {
	max-width: 750px;
	margin: 0 auto;
}
</style>


	<div><h1 align="center" >${name}님 근태 관리 달력</h1>
	<h5 align="center"><secu:authorize
			access="hasAnyRole('ROLE_human_resources_page2_master','ROLE_human_resources_page2_anything','ROLE_human_resources_page2_readWrite')">
			<a href="commute_holy_day_process_popup?emp_num=${emp_num}&emp_name=${name}" onClick="window.open(this.href, '', 'width=400, height=550'); return false;"> <input type="button" value="휴가 및 결근 신청하기" class="btn btn-info btn-sm"/></a></secu:authorize></h5>
	</div>
	<div id='calendar'></div>
     
