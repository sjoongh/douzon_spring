<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset='utf-8' />

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
/* var list = '${json}';
var jsonObj = JSON.parse(list); */
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
							columnFormat: {


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
						});		
		getEvents_Absence();
	});
	
	 function getEvents_Absence() {
		$.get("get_events_absence", {
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
    /* padding-bottom: 2px; */ /* matches the space above the events */
  }
/* body {
      margin: 20px 1px;
      padding: 0;
      font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
      font-size: 14px;
   } */
#calendar {
	max-width: 750px;
	margin: 0 auto;
}
</style>


	<h1 align="center" >사원 전체 결근 달력(관리자)</h1>
	<h5 align="center" ><font color="red">자세한 결근 내역은 결근 사유 관리에서 확인하세요.</font>
	<a href="commute_holyday_process_view?year=2016&month=06">
	<input type='button' value="결근 사유 관리" class="btn btn-info btn-sm">
	</a>
	
	</h5>
	<div id='calendar'></div>

