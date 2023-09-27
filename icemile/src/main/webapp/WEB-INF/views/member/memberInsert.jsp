<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
	<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 높이 100%로 설정하여 수직 중앙 정렬 */
	margin: 0; /* 페이지 바깥 여백 제거 */
}
h1 {
	text-align: center; /* 가로 중앙 정렬 */
}
#btn {
	text-align: center; /* 가로 중앙 정렬 */
	margin: 10px; /* 버튼 간격 설정 */
	font-size: 16px; /* 버튼 텍스트 크기 설정 */
	padding: 10px 20px; /* 버튼 안 여백 설정 */
}
</style>
</head>
<body class="sb-nav-fixed">
				<!-- 내용들어가는곳 -->
	<form action="${pageContext.request.contextPath }/member/memberInsert" id="signup" name="signup" method="POST" enctype="multipart/form-data">
		<h1>
			<b>사원등록</b>
		</h1>

		<!-- 사진 등록 -->
		 <img src="" alt="미리보기" id="preview" style="max-width: 100px; max-height: 100px; display: none;"> <br>
		  <input type="file" id="file" name="file"> <br><br>
    
    <br><br>

		<!-- 이름 -->
		<b>이름:</b> <input type="text" name="emp_name" id="emp_name">
		<br>
		<span id="namemsg"></span>
		<br>
		<!-- 생년월일 -->
		<label for="birthdate"><b>생년월일:</b></label>
		<input type="text" name="birthdate" id="birthdate" placeholder="생일을 선택해 주십시오" readonly>
		<br>
		<span id="birthmsg"></span>
		<br>

		<!-- 부서 -->
		<label for="department_label"><b>부서 선택:</b></label>
		<select name="dept_name" id="dept_name">
			<option value="">부서를 선택하십시오</option>
   			<option value="1">인사팀</option>
    		<option value="2">영업팀</option>
    		<option value="3">생산팀</option>
    		<option value="4">물류팀</option>
		</select> 
		<br> 
		<span id="deptmsg"></span>
		<br>

		<!-- 직급 -->
		<label for="position_label"><b>직급 선택:</b></label> 
		<select name="position" id="position">
			<option value="">직급을 선택하십시오</option>
    		<option value="1">사원</option>
    		<option value="2">대리</option>
    		<option value="3">과장</option>
    		<option value="4">차장</option>
    		<option value="5">부장</option>
		</select> 
		<br>
		<span id="positionmsg"></span>
		<br>
		
		<!-- 전화번호 -->
		<label for="phone_num_label"><b>전화번호:</b></label> 
		<input type="text" name="phone_num" id="phone_num">
		<br> 
		<span id="phonemsg"></span>
		<br>
		
		<!-- 내선번호 -->
		<label for="hotline_label"><b>내선번호:</b></label> 
		<input type="text" name="hotline" id="hotline">
		<br> 
		<span id="hotlinemsg"></span>
		<br>

		<label for="email_label"><b>이메일</b></label> 
		<input type="text" name="email_id" id="email_id"> @ 
		<input type="text" name="email_dns" id="email_dns"> 
		<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
			<option value="">직접 입력</option>
			<option value="hanmail.net">DAUM</option>
			<option value="gmail.com">GOOGLE</option>
		</select>
		<br>
		<span id="emailmsg"></span>
		<br>



		<!-- 주소 -->
		<label for="postalCode_label"><b>주소검색</b></label> 
		<input type="text" name="emp_post" id="emp_post" placeholder="우편번호">
		<button type="button" id="call_api" onclick="call_Post_API()">우편번호 찾기</button>
		<br> 
		<label for="addr1_label"><b>주소</b></label> 
		<input type="text" name="addr1" id="addr1" placeholder="기본주소"> 
		<label for="addr2_label"></label> 
		<input type="text" name="addr2" id="addr2" placeholder="동명">
		<br>
		<label for="addr3_label"><b>상세주소</b></label> 
		<input type="text" name="addr3" id="addr3" placeholder="상세주소"> 
		<br>
		<span id="addressmsg"></span>
		<br>

		<!-- 입사일 -->
		<label for="hire_date_label"><b>입사일:</b></label> 
		<input type="text" name="hire_date" id="hire_date" readonly>
		<br>
		<span id="hiremsg"></span>
		<br>


		<!-- 권한 설정 -->
		<label for="emp_role_label"><b>권한설정:</b></label> 
		<label for="dept1">
			<input type="checkbox" id="dept1" name="role" value="1000" disabled>인사
		</label>
		<label for="dept2">
			<input type="checkbox" id="dept2" name="role" value="100" disabled>영업
		</label>
		<label for="dept3">
			<input type="checkbox" id="dept3" name="role" value="10" disabled>생산
		</label>
		<label for="dept4">
			<input type="checkbox" id="dept4" name="role" value="1" disabled>물류
		</label>
		<br>
		<span id="rolemsg"></span>
		<br>


		<!-- 등록 버튼 -->
		<div id="btn">
			<input type="submit" id="btn" value="등록">
		</div>
		<input type="hidden" id="emp_role" name="emp_role" value="">
		<input type="hidden" id="email" name="email" value="">
		<input type="hidden" id="address" name="address" value="">
	</form>

<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- 카카오 우편번호 API호출 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//전역변수 선언
var selectedDept = '';
var currentDate = new Date();

// 우편번호 API 호출
function call_Post_API() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addr2").value = extraAddr;
            
            } else {
                document.getElementById("addr2").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('emp_post').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr3").focus();
        }
    }).open();
}

//select을 이용한 이메일 값을 email_dns에 적용할려고 하면
function updateEmailDns() {
	var emailSel = document.getElementById('email_sel');
	var emailDns = document.getElementById('email_dns');

	// 선택한 도메인 값 가져오기
	var selectedDomain = emailSel.options[emailSel.selectedIndex].value;

	// 선택한 도메인 값을 email_dns 입력 필드에 설정
	emailDns.value = selectedDomain;
}

//서브밋 제어
$('#signup').submit(function() {
	
	if($('#emp_name').val() == ""){
		$('#namemsg').css('color','red');
		$('#namemsg').text("이름을 입력하십시오."); 
		$('#emp_name').focus();
		return false;
	}
	
	if($('#birthdate').val() == ""){
		$('#birthmsg').css('color','red');
		$('#birthmsg').text("생일을 입력하십시오.");
		$('#birthdate').focus();
		return false;
	}
	
	if($('#dept_name').val() == ""){
		$('#deptmsg').css('color','red');
		$('#deptmsg').text("부서를 선택하십시오.");  
		$('#dept_name').focus();
		return false;
	}
	
	if($('#position').val() == ""){
		$('#positionmsg').css('color','red');
		$('#positionmsg').text("직급을 선택하십시오.");
		$('#position').focus();
		return false;
	}
	
	if($('#phone_num').val() == ""){
		$('#phonemsg').css('color','red');
		$('#phonemsg').text("전화번호를 입력해주세요.");
		$('#phone_num').focus();
		return false;
	}
	
	if($('#hotline').val() == ""){
		$('#hotlinemsg').css('color','red');
		$('#hotlinemsg').text("내선번호를 입력하십시오.");
		$('#hotline').focus();
		return false;
	}
	
	if($('#email_id').val() == "" || $('#email_dns').val() == ""){
		$('#emailmsg').css('color','red');
		$('#emailmsg').text("이메일을 입력하십시오.");
		return false;
	}
	
	if($('#emp_post').val() == "" || $('#addr1').val() == ""){
		$('#addressmsg').css('color','red');
		$('#addressmsg').text("주소를 입력하십시오.");
		return false;
	}
	
	if($('#hire_date').val() == ""){
		$('#hiremsg').css('color','red');
		$('#hiremsg').text("입사일을 입력하십시오.");
		$('#hire_date').focus();
		return false;
	}

});//submit기능 제어 끝

// J쿼리 함수 시작지점
$(document).ready(function() {
	
	// 부서 선택이 변경되었을 때
    $('#dept_name').on('change', function () {
        selectedDept = $(this).val();
        
     	// 권한 초기화
        $('[name="role"]').prop('checked', false);
     
        // 해당 부서에 대한 권한 체크박스 checked로 변경
        $('#dept' + selectedDept).prop('checked', true);
    });

    // 직급 선택이 변경되었을 때
    $('#position').on('change', function () {
        var selectedPosition = $(this).val();
        
        if (selectedPosition === '5') {
        	// 선택된 직급이 부장일 경우 모든 체크박스를 선택 할 수 있다
        	$('[name="role"]').prop('disabled', false);
        } else {
        	$('[name="role"]').prop('disabled', true);
            $('[name="role"]').prop('checked', false);
            $('#dept' + selectedDept).prop('checked', true);
        }
    });
    
    // 서브밋 될때 실행
    $('form').on('submit', function () {
        // 체크된 체크박스들의 값을 합산할 변수 초기화
        var sum = 0;
        
        // 체크된 체크박스들을 순회하며 값을 합산
        $('[name="role"]:checked').each(function () {
            sum += parseInt($(this).val());
        });
        
        // 합산된 값을 emp_role 입력 필드에 설정
        $('#emp_role').val(sum);
        
        // 이메일 값 합산 설정
        // 입력이메일을 가져오기위한 변수선언
        var emailId = $("#email_id").val();
        var emailDns = $("#email_dns").val();
		
        // email_id와 email_dns를 합쳐서 email 필드에 저장
        $("#email").val(emailId + "@" + emailDns);
        
        //주소값 합산 설정
        // 주소값을 가져오기위한 변수선언
        var addr1 = $("#addr1").val();
        var addr2 = $("#addr2").val();
        var addr3 = $("#addr3").val();
        
        // 주소값을 합쳐서 address 필드에 저장
        $("#address").val(addr1 + "" + addr2 + " " + addr3);
    });
	
    // 생년월일 데이트피커
    $("#birthdate").datepicker({
    	  dateFormat: 'yy-mm-dd',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	  dayNames: ['일','월','화','수','목','금','토'],
    	  dayNamesShort: ['일','월','화','수','목','금','토'],
    	  dayNamesMin: ['일','월','화','수','목','금','토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년',
    	  changeYear: true,
    	  changeMonth: true,
    	  yearRange: "1900:2010",
    	  defaultDate: new Date(1960, 0, 1) // 1960년 1월 1일을 초기 날짜로 설정
    });
    
    // 입사일 데이트 피커
	$("#hire_date").datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    maxDate: currentDate
	
	});
    
    // 이미지 파일 관리
    $("#file").change(function () {
        var input = this;
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#preview").attr("src", e.target.result);
                $("#preview").show();
            };
            reader.readAsDataURL(input.files[0]);
        }
    });
});
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	
</body>
</html>