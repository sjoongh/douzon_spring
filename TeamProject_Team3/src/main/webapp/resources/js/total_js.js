window.onload = function() {

	/* 주소 가져오기 */

	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
				.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}
	;

	/* 페이징 add class */
	var uid = getParameterByName('pageNum');

	$(function() {
		if (uid == 1) {
			$('ul#pagination li').eq(0).addClass('active');
		} else if (uid == 2 || (uid > 5 & uid % 5 == 1)) {
			$('ul#pagination li').eq(1).addClass('active');
		} else if (uid == 3 || (uid > 5 & uid % 5 == 2)) {
			$('ul#pagination li').eq(2).addClass('active');
		} else if (uid == 4 || (uid > 5 & uid % 5 == 3)) {
			$('ul#pagination li').eq(3).addClass('active');
		} else if (uid == 5 || (uid > 5 & uid % 5 == 4)) {
			$('ul#pagination li').eq(4).addClass('active');
		} else if (uid > 5 & uid % 5 == 0) {
			$('ul#pagination li').eq(5).addClass('active');
		}
	});

	/* 탑메뉴 스크립트 */
	var newURL = $(location).attr('pathname');
	$(function() {
		if (newURL == '/erp/sidemenu_patient' || newURL == '/erp/patientNew'
				|| newURL == '/erp/prescription_insert'
				|| newURL == '/erp/patientList' || newURL == '/erp/patientView'
				|| newURL == '/erp/prescription_update'
				|| newURL == '/erp/treatment_admin'
				|| newURL == '/erp/treatment_insert'
				|| newURL == '/erp/treatment_update'
				|| newURL == '/erp/prescription_admin') {
			$('ul#topmenu #sidemenu_patient').addClass('active');
		} else if (newURL == '/erp/sidemenu_human_resources'
				|| newURL == '/erp/hospital_list'
				|| newURL == '/erp/hospital_search'
				|| newURL == '/erp/hospital_content_array'
				|| newURL == '/erp/hospital_content_view'
				|| newURL == '/erp/commute'
				|| newURL == '/erp/commute_holyday_process_view'
				|| newURL == '/erp/hospital_pay_list'
				|| newURL == '/erp/commute2'
				|| newURL == '/erp/resignation_list') {
			$('ul#topmenu #sidemenu_human_resources').addClass('active');
		} else if (newURL == '/erp/sidemenu_inventory'
				|| newURL == '/erp/invoiceView' || newURL == '/erp/stockModify'
				|| newURL == '/erp/stockList' || newURL == '/erp/invoiceList'
				|| newURL == '/erp/supplierView' || newURL == '/erp/invoiceAdd'
				|| newURL == '/erp/supplierList') {
			$('ul#topmenu #sidemenu_inventory').addClass('active');
		} else if (newURL == '/erp/sidemenu_accounting'
				|| newURL == '/erp/accountList'
				|| newURL == '/erp/acctypeModify'
				|| newURL == '/erp/acctypeAdd	'
				|| newURL == '/erp/accountWrite' || newURL == '/erp/acctypeAdd'
				|| newURL == '/erp/acctypeList' || newURL == '/erp/paymentList') {
			$('ul#topmenu #sidemenu_accounting').addClass('active');
		} else if (newURL == '/erp/sidemenu_admin'
				|| newURL == '/erp/hospital_info'
				|| newURL == '/erp/user_admin'
				|| newURL == '/erp/hospital_info_modify'
				|| newURL == '/erp/hospital_info_new'
				|| newURL == '/erp/user_update' || newURL == '/erp/user_insert'
				|| newURL == '/erp/user_insert2'
				|| newURL == '/erp/user_authority_insert'
				|| newURL == '/erp/user_authority_modify') {
			$('ul#topmenu #sidemenu_admin').addClass('active');
		} else if (newURL == '/erp/sidemenu_reservation'
				|| newURL == '/erp/reservationList'
				|| newURL == '/erp/receptionList'
				|| newURL == '/erp/patientSearch') {
			$('ul#topmenu #sidemenu_reservation').addClass('active');
		} else if (newURL == '/erp/sidemenu_board'
				|| newURL == '/erp/noticeWrite' || newURL == '/erp/noticeView'
				|| newURL == '/erp/noticeList' || newURL == '/erp/bizList'
				|| newURL == '/erp/noticeModify' || newURL == '/erp/bizWrite'
				|| newURL == '/erp/bizView' || newURL == '/erp/bizReply'
				|| newURL == '/erp/bizModify' || newURL == '/erp/minutesWrite'
				|| newURL == '/erp/minutesView'
				|| newURL == '/erp/minutesModify'

				|| newURL == '/erp/minutesList') {
			$('ul#topmenu #sidemenu_board').addClass('active');
		}
	});
	/* 사이드메뉴 스크립트 */
	$(function() {

		if (newURL == '/erp/accountList' || newURL == '/erp/accountWrite') {
			$('#sidemenu_bar ul #accountList').addClass('active');
		} else if (newURL == '/erp/paymentList') {
			$('#sidemenu_bar ul #paymentList').addClass('active');
		} else if (newURL == '/erp/hospital_info'
				|| newURL == '/erp/hospital_info_modify'
				|| newURL == '/erp/hospital_info_new') {
			$('#sidemenu_bar ul #hospital_info').addClass('active');
		} else if (newURL == '/erp/user_admin' || newURL == '/erp/user_insert'
				|| newURL == '/erp/user_update'
				|| newURL == '/erp/user_insert2'
				|| newURL == '/erp/user_authority_modify'
				|| newURL == '/erp/user_authority_insert') {
			$('#sidemenu_bar ul #user_admin').addClass('active');
		} else if (newURL == '/erp/noticeList' || newURL == '/erp/noticeModify'
				|| newURL == '/erp/noticeWrite' || newURL == '/erp/noticeView') {
			$('#sidemenu_bar ul #noticeList').addClass('active');
		} else if (newURL == '/erp/bizList' || newURL == '/erp/bizWrite'
				|| newURL == '/erp/bizView' || newURL == '/erp/bizReply'
				|| newURL == '/erp/bizModify') {
			$('#sidemenu_bar ul #bizList').addClass('active');
		} else if (newURL == '/erp/minutesList'
				|| newURL == '/erp/minutesWrite'
				|| newURL == '/erp/minutesView'
				|| newURL == '/erp/minutesModify') {
			$('#sidemenu_bar ul #minutesList').addClass('active');
		} else if (newURL == '/erp/hospital_list'
				|| newURL == '/erp/hospital_search'
				|| newURL == '/erp/hospital_content_array'
				|| newURL == '/erp/hospital_content_view'
				|| newURL == '/erp/testtest') {
			$('#sidemenu_bar ul #hospital_list').addClass('active');
		} else if (newURL == '/erp/commute') {
			$('#sidemenu_bar ul #commute').addClass('active');
		} else if (newURL == '/erp/hospital_pay_list') {
			$('#sidemenu_bar ul #hospital_pay_list').addClass('active');
		} else if (newURL == '/erp/patientNew') {
			$('#sidemenu_bar ul #patientNew').addClass('active');
		} else if (newURL == '/erp/patientList' || newURL == '/erp/patientView') {
			$('#sidemenu_bar ul #patientList').addClass('active');
		} else if (newURL == '/erp/patientSearch') {
			$('#sidemenu_bar ul #patientSearch').addClass('active');
		} else if (newURL == '/erp/receptionList') {
			$('#sidemenu_bar ul #receptionList').addClass('active');
		} else if (newURL == '/erp/reservationList') {
			$('#sidemenu_bar ul #reservationList').addClass('active');
		} else if (newURL == '/erp/stockList' || newURL == '/erp/stockModify') {
			$('#sidemenu_bar ul #stockList').addClass('active');
		} else if (newURL == '/erp/invoiceList' || newURL == '/erp/invoiceAdd'
				|| newURL == '/erp/invoiceView') {
			$('#sidemenu_bar ul #invoiceList').addClass('active');
		} else if (newURL == '/erp/supplierList'
				|| newURL == '/erp/supplierView') {
			$('#sidemenu_bar ul #supplierList').addClass('active');
		} else if (newURL == '/erp/treatment_admin'
				|| newURL == '/erp/treatment_update'
				|| newURL == '/erp/treatment_insert') {
			$('#sidemenu_bar ul #treatment_admin').addClass('active');
		} else if (newURL == '/erp/prescription_admin'
				|| newURL == '/erp/prescription_update'
				|| newURL == '/erp/prescription_insert') {
			$('#sidemenu_bar ul #prescription_admin').addClass('active');
		} else if (newURL == '/erp/resignation_list'
				|| newURL == '/erp/commute2'
				|| newURL == '/erp/commute_holyday_process_view') {
			$('#sidemenu_bar ul #resignation_list').addClass('active');
		} else if (newURL == '/erp/acctypeList'
				|| newURL == '/erp/acctypeModify'
				|| newURL == '/erp/acctypeAdd') {
			$('#sidemenu_bar ul #acctypeList').addClass('active');
		}

	});

};