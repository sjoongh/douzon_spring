<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!— Latest compiled and minified CSS —>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="resources/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/calendar.js"></script> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인적사항등록</title>
</head>
<body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
 <script language="javascript">
/* function windowClose()
{
	   document.member_sign_up.submit(); 
}  */
function checkId() {
    var userinput = eval("document.member_sign_up");
    
    if (!userinput.emp_num.value) {
        alert("사원번호를 입력하세요.");
        userinput.emp_num.focus();
        return false;
     }
    
    if (!userinput.emp_name.value) {
        alert("사원이름을 입력하세요.");
        userinput.emp_name.focus();
        return false;
     }
    
    if (!userinput.telephone.value) {
        alert("전화번호를 입력하세요.");
        userinput.telephone.focus();
        return false;
     }
    
    if (!userinput.telephone11.value) {
        alert("전화번호를 입력하세요.");
        userinput.telephone11.focus();
        return false;
     }
    
    if (!userinput.telephone10.value) {
        alert("전화번호를 입력하세요.");
        userinput.telephone10.focus();
        return false;
     }
    
    if (!userinput.department_code.value) {
        alert("부서코드를 입력하세요.");
        userinput.department_code.focus();
        return false;
     }
    
    if (!userinput.department.value) {
        alert("부서이름을 입력하세요.");
        userinput.department.focus();
        return false;
     }
    
    if (!userinput.duty_responsibility_name.value) {
        alert("직책이름을 입력하세요.");
        userinput.d1uty_responsibility_name.focus();
        return false;
     }
    if (!userinput.join_date.value) {
        alert("입사일자를 입력하세요.");
        userinput.join_date.focus();
        return false;
     }
}

function windowAddressSearch(){
    daum.postcode.load(function(){
         new daum.Postcode({
             oncomplete: function(data) {
                document.getElementsByName("address_number")[0].value = data.zonecode;
             document.getElementsByName("address")[0].value = data.roadAddress;
             }
         }).open();
     });
 }
function windowDutySearch()
{
	window.open("duty_search_list", "newWin2", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
function windowDepartSearch()
{
	window.open("depart_search_list", "newWin5", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
function windowBankSearch()
{
	window.open("bank_search_list", "newWin6", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
function windowOverlapSearch()
{
	window.open("emp_num_search_overlap_view", "newWin1", "width=500, height=500, toolbar=no, scrollbars=yes,location=no");
} 
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
</script> 
	<form name="member_sign_up" action="sign" method="post" onSubmit="return checkId()" enctype="multipart/form-data">
	<table class="table" width="400" border="1" cellspacing="0" cellpadding="3" align="center" class="table table-striped" >
		<h3 align="center" >[[ 인적사항등록 ]]</h3>
		<tr><td>사원번호 : <input type="text" readonly="readonly" id="emp_num" name="emp_num" size="5" maxlength="5" required="required" onkeydown="return onlyNumber(event)"/>&nbsp;<input type="button" value="중복 검색" OnClick="javascript:windowOverlapSearch();"  class="btn btn-primary btn-sm"/></td></tr>
		<tr><td>이름 : <input type="text" name="emp_name" required="required"></td></tr>
		<tr><td>전화번호 : 
		<select name="telephone" required="required" checked>
		<option value="">선택</option>
        <option value="010">010</option>
        <option value="02">02</option>
        <option value="051">051</option>
        <option value="053">053</option>
        <option value="032">032</option>
        <option value="062">062</option>
        <option value="042">042</option>
        <option value="052">052</option>
        <option value="044">044</option>
        <option value="031">031</option>
        <option value="033">033</option>
        <option value="043">043</option>
        <option value="041">041</option>
        <option value="063">063</option>
        <option value="061">061</option>
        <option value="054">054</option>
        <option value="055">055</option>
        <option value="064">064</option>
        </select>
         ㅡ<input type="text" name="telephone10" size="5" maxlength="4" required="required" onkeydown="return onlyNumber(event)">
        ㅡ<input type="text" name="telephone11" size="5" maxlength="4" required="required" onkeydown="return onlyNumber(event)">
        </td></tr>
		<tr><td>
		비상연락망 : 
		<select name="telephone2" >
		<option value="">선택</option>
        <option value="010">010</option>
        <option value="02">02</option>
        <option value="051">051</option>
        <option value="053">053</option>
        <option value="032">032</option>
        <option value="062">062</option>
        <option value="042">042</option>
        <option value="052">052</option>
        <option value="044">044</option>
        <option value="031">031</option>
        <option value="033">033</option>
        <option value="043">043</option>
        <option value="041">041</option>
        <option value="063">063</option>
        <option value="061">061</option>
        <option value="054">054</option>
        <option value="055">055</option>
        <option value="064">064</option>
        </select>
         ㅡ<input type="text" name="telephone20" size="5" maxlength="4"  onkeydown="return onlyNumber(event)">
        ㅡ<input type="text" name="telephone21" size="5" maxlength="4"  onkeydown="return onlyNumber(event)">
		</td></tr>
		<tr>
		<td>부서코드 : <input type="text" id="department_code" name="department_code" readonly="readonly"  required="required" style="width: 170px;" placeholder="부서 검색창을 눌러주세요"/>&nbsp;<input type="button"  class="btn btn-primary btn-sm" value="부서 검색" OnClick="javascript:windowDepartSearch();" /></td>
		</tr>
		<tr>
		<td>부서이름 : <input type="text" id="department" name="department" required="required" readonly="readonly" /></td>
		</tr>
		<tr>
		<td>
		우편번호 : <input type="text" id="address_number" name="address_number" style="width: 170px;" readonly="readonly" placeholder="주소 검색창을 눌러주세요"/>&nbsp;<input type="button" value="주소검색" OnClick="javascript:windowAddressSearch();"  class="btn btn-primary btn-sm"/>
		</td>
		</tr>
		<tr><td>주소 : <input type="text" name="address" style="width: 250px;" /></td></tr>
		<tr><td>
		주민번호 : <input type="text" name="jumin_number" size="6" maxlength="6" onkeydown="return onlyNumber(event)"/> 
		 ㅡ<input type="text" name="jumin_number2" size="7" maxlength="7" onkeydown="return onlyNumber(event)"/>
		</td></tr>
		<tr><td>성별 : <input type="radio" name="gender" value="남자" checked>남자<input type="radio" name="gender" value="여자">여자</td></tr>
		<tr><td>입사일자 : <input  type="date" name="join_date"  placeholder="입사 날짜를 선택해주세요" /></td></tr><!-- onclick="fnPopUpCalendar(join_date,join_date,'yyyy/mm/dd')" -->
		<tr><td><input type="hidden" name="retire_date" placeholder="퇴사 날짜를 선택해주세요" /></td></tr>
		<tr><td>email : <input type="text" name="email"></td></tr>
		<tr><td><input type="hidden" id="duty_responsibility_code"></td></tr>
		<tr><td>직책 : <input type="text" id="duty_responsibility_name" name="duty_responsibility" readonly="readonly" style="width: 170px;" required="required" placeholder="직책 검색창을 눌러주세요"/>&nbsp;<input type="button" value="직책 검색" OnClick="javascript:windowDutySearch();" class="btn btn-primary btn-sm" /></td></tr>
		<tr><td>직급 : <input type="text" name="rank_position"/></td></tr>
		<input type="hidden" name="continuous_service_date"/>
		<tr><td>결혼여부 : <input type="radio" name="marital_status" value="기혼">기혼<input type="radio" name="marital_status" value="미혼" checked>미혼</td></tr>
		<tr><td>거래은행 : <input type="text" id="bank_name" name="bank_name" readonly="readonly" style="width: 170px;" placeholder="은행 검색창을 눌러주세요" />&nbsp;<input type="button" class="btn btn-primary btn-sm" value="은행 검색" OnClick="javascript:windowBankSearch();" /></td></tr>
		<tr><td>예금주 : <input type="text" name="account_holder"/></td></tr>
		<tr><td>계좌번호 : <input type="text" name="account_number"  onkeydown="return onlyNumber(event)"/></td></tr>
		<tr><td>사진 : <input type="file" name="files[0]" readonly="readonly"></td></tr>
		<!-- <tr><td>첨부파일 : <input type="file" name="files[1]" readonly="readonly"></td></tr> -->
		<tr><td>경력여부 : <input type="radio" name="join_company_division" value="신입" checked/>신입<input type="radio" name="join_company_division" value="경력" >경력</td></tr>
		<tr><td><input type=submit value="인적사항 등록" onClick="javascript:windowClose()" class="btn btn-primary btn-sm"/>
					  <input type='button' value="창닫기" onClick='window.close()' class="btn btn-danger btn-sm">
		</td></tr>
		</table>
	</form>
</body>
</html>