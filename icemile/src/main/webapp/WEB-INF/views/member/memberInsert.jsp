<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이스마일</title>
	  	 <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 		 <link href="../resources/css/addTableVertical.css" rel="stylesheet" />

</head>
<body>
				<!-- 내용들어가는곳 -->
	<form id="signup" name="signup">
		<h1>
			사원등록
		</h1>
    
<table>
<tr><td class="tdbold">사진</td><td>
								<img src="" alt="미리보기" id="preview" style="max-width: 100px; max-height: 100px; display: none;"> 
		 					    <input type="file" id="file" name="file"> 
		 					  </td></tr>
<tr><td class="tdbold">이름</td><td><input type="text" name="emp_name" id="emp_name"></td></tr>
<tr><td class="tdbold">생년월일</td><td><input type="text" name="birthdate" id="birthdate" placeholder="생일을 선택해 주십시오" readonly></td></tr>
<tr><td class="tdbold">부서</td><td><select name="dept_name" id="dept_name">
								<option value="">부서를 선택하십시오</option>
								<option value="0">관리자</option>
   								<option value="1">인사팀</option>
    							<option value="2">영업팀</option>
    							<option value="3">생산팀</option>
    							<option value="4">물류팀</option>
								</select> </td></tr>
<tr><td class="tdbold">직급</td><td><select name="position" id="position">
								<option value="">직급을 선택하십시오</option>
    							<option value="1">사원</option>
    							<option value="2">대리</option>
    							<option value="3">과장</option>
    							<option value="4">차장</option>
    							<option value="5">부장</option>
								</select> </td></tr>
<tr><td class="tdbold">전화번호</td><td><input type="text" name="phone_num" id="phone_num" maxlength="11"></td></tr>
<tr><td class="tdbold">내선번호</td><td><input type="text" name="hotline" id="hotline" maxlength="11"></td></tr>
<tr><td class="tdbold">이메일</td><td>	<input type="text" name="email_id" id="email_id"> @ 
										<input type="text" name="email_dns" id="email_dns"> 
								<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
								<option value="">직접 입력</option>
								<option value="hanmail.net">DAUM</option>
								<option value="gmail.com">GOOGLE</option>
								</select></td></tr>
<tr><td class="tdbold">주소검색</td><td><input type="text" name="emp_post" id="emp_post" placeholder="우편번호">
									       <button type="button" id="call_api" onclick="call_Post_API()">우편번호 찾기</button></td></tr>
<tr><td class="tdbold">주소</td><td>
                          <input type="text" name="addr1" id="addr1" placeholder="기본주소"> 
                          <input type="text" name="addr2" id="addr2" placeholder="동명"></td></tr>
<tr><td class="tdbold">상세주소</td><td><input type="text" name="addr3" id="addr3" placeholder="상세주소"></td></tr>
<tr><td class="tdbold">입사일</td><td><input type="text" name="hire_date" id="hire_date" readonly></td></tr>
<tr><td class="tdbold">권한설정</td><td><label for="dept1">
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
	                                 	</label>	</td></tr>
</table>	

			<span id="msg"></span>
		
		<div id="bottomContainer"> 
		<!-- 등록 버튼 -->
			<input type="button" id="btn" value="등록">			
		</div>
		
		<input type="hidden" id="emp_role" name="emp_role" value="">
		<input type="hidden" id="email" name="email" value="">
		<input type="hidden" id="address" name="address" value="">
	</form>
	
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->
		

<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- 카카오 우편번호 API호출 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- sweetalert2 API 호출 -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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

// J쿼리 함수 시작지점
$(document).ready(function() {
	
	// 부서 선택이 변경되었을 때
    $('#dept_name').on('change', function () {
    	
    	// 이벤트가 발생하는 첫번째 셀렉트 태그를 선택한다
        selectedDept = $(this).val();
        // 두번째 셀렉트 태그(직급)를 변수에 담는다
        var $position = $('#position');
        
     	// 권한 초기화
        $('[name="role"]').prop('checked', false);
     
        // 해당 부서에 대한 권한 체크박스 checked로 변경
        // 관리자일경우에는 전체체크 및 직급 관리자 자동 설정
        if(selectedDept == '0'){
        	$('[name="role"]').prop('checked', true);
        	
        	// 직급 선택 초기화
        	$position.empty();
        	
        	var $option = $('<option>', {
        		value: "0",
        		text: "관리자"
      			});//end var
    			
    		// 최종값을 셀렉트 태그에 추가한다
      		$position.append($option);
      			
        	// 선택자 지정후 변수에 담기
        	var positionSelect = document.getElementById("position").value = 0;
        	// 관리자 선택
        	positionSelect.value = "0";
        } else {
        	
        	// 직급 선택 초기화
        	$position.empty();
        	
        	// 셀렉트 값에 담을 배열 변수 선언
       		var options = [
       			{ value: "", text: "직급을 선택하십시오" },
          		{ value: "1", text: "사원" },
          		{ value: "2", text: "대리" },
          		{ value: "3", text: "과장" },
          		{ value: "4", text: "차장" },
          		{ value: "5", text: "부장" },
        	];
        
        	// 옵션을 배열에서 반복하여 추가
        	for (var i = 0; i < options.length; i++) {
        		
        		// 타입은 옵션 밸류값과 텍스트값은 배열에서 가져온다
          		var $option = $('<option>', {
            		value: options[i].value,
            		text: options[i].text
          			});
        			
        			// 최종값을 셀렉트 태그에 추가한다
          			$position.append($option);
        	}// end for
      			
       		$('#dept' + selectedDept).prop('checked', true);
        }
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
    function mergeData() {
		
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
    }
	
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
    
    // 중복검사 관련함수
    function isCanUseEmail() {
    	
    	// 검증할 이메일을 가져온다
    	var email = $("#email").val();
    	
    	// 결과값 반환을 위한 변수선언
    	var myBoolean = true;
    	
    	$.ajax({
		  	type: "GET",
	        url: "${pageContext.request.contextPath}/member_ajax/searchEmail",
	        data: {"email": email},
	        // 조건문 발동을 위해 비동기로 처리
	        async: false,
	        success: function(response) {
	        	// 공백을 제거한다
        		const result = $.trim(response);
        		// 이미 값이 존재한다면 true 를 반환한다
	        	if(result == "true"){
	        		myBoolean = true;
	        	} else {
	        		myBoolean = false;
	        	}
	        	
	        },//success 콜백함수 종료지점
	        error: function () {
	        	myBoolean = true;
	        }
	  	});// end ajax
	  	
    	return myBoolean;
	} // end function
	
	function isCanUsePhone() {
    	
		// 검증할 전화번호를 가져온다
    	var phone = $("#phone_num").val();
		// 결과값 반환을 위한 변수선언
    	var myBoolean = true;
    	$.ajax({
		  	type: "GET",
	        url: "${pageContext.request.contextPath}/member_ajax/searchPhone",
	        data: {"phone_num": phone},
	        // 조건문 발동을 위해 비동기로 처리
	        async: false,
	        success: function(response) {
	        	// 공백을 제거한다
        		const result= $.trim(response);
	        	// 이미 값이 존재한다면 true 를 반환한다
	        	if(result == "true"){
	        		myBoolean = true;
	        	} else {
	        		myBoolean = false;
	        	}
	        	
	        },//success 콜백함수 종료지점
	        error: function () {
	        	myboolean = true;
            }
	  	});// end ajax
	  	
		return myBoolean;
	} // end function
	
  	//서브밋 제어
    $('#btn').click(function() {
    	
    	// 데이터 병합실행
   	 	mergeData();
    	 
    	if($('#emp_name').val() == ""){
    		$('#msg').text("이름을 입력하십시오."); 
    		$('#emp_name').focus();
    		return false;
    	}
    	
    	if($('#birthdate').val() == ""){
    		$('#msg').text("생일을 입력하십시오.");
    		$('#birthdate').focus();
    		return false;
    	}
    	
    	if($('#dept_name').val() == ""){
    		$('#msg').text("부서를 선택하십시오.");  
    		$('#dept_name').focus();
    		return false;
    	}
    	
    	if($('#position').val() == ""){
    		$('#msg').text("직급을 선택하십시오.");
    		$('#position').focus();
    		return false;
    	}
    	
    	if($('#phone_num').val() == ""){
    		$('#msg').text("전화번호를 입력해주세요.");
    		$('#phone_num').focus();
    		return false;
    	}
    	
    	if($('#hotline').val() == ""){
    		$('#msg').text("내선번호를 입력하십시오.");
    		$('#hotline').focus();
    		return false;
    	}
    	
    	if($('#email_id').val() == "" || $('#email_dns').val() == ""){
    		$('#msg').text("이메일을 입력하십시오.");
    		return false;
    	}
    	
    	if($('#emp_post').val() == "" || $('#addr1').val() == ""){
    		$('#msg').text("주소를 입력하십시오.");
    		return false;
    	}
    	
    	if($('#hire_date').val() == ""){
    		$('#msg').text("입사일을 입력하십시오.");
    		$('#hire_date').focus();
    		return false;
    	}
    	
    	// 정규식 검사
    	// 검사를 위한 변수선언
		var regName = /^[a-zA-Z가-힣]+$/;
		var regEmail = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		var regPhone = /^[0-9]{9,11}$/;

		if (!regName.test($('#emp_name').val())) {
			$('#msg').text("올바른 이름을 입력해주세요 한글, 영/대소문자만 입력가능 합니다.");
			$('#emp_name').focus();
    		return false;
		}
		
		if (!regEmail.test($('#email_dns').val())) {
			$('#msg').text("유효한 이메일 주소를 입력해주세요.");
			$('#email_dns').focus();
    		return false;
		}
		
		if (!regPhone.test($('#phone_num').val())) {
			$('#msg').text("- 없이 올바른 전화번호를 입력해주십시오.");
			$('#phone_num').focus();
    		return false;
		}
		
		if (!regPhone.test($('#hotline').val())) {
			$('#msg').text("- 없이 올바른 전화번호를 입력해주십시오.");
			$('#hotline').focus();
    		return false;
		}
		
		if(isCanUseEmail()){
			$('#msg').text("이미 등록된 이메일입니다.");
			return false;
		}
		if(isCanUsePhone()){
			$('#msg').text("이미 등록된 전화번호 입니다.");
			$('#phone_num').focus();
			return false;
		}
		
		// 정규식 검사 끝
		
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 
    	 // 폼 데이터 객체생성
    	 var formData = new FormData(document.getElementById('signup'));
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/member_ajax/insert",
             data: formData,
             contentType: false, // 멀티파트를 처리하기위해 객체를 직렬화하지 않고 직접 AJAX 통신할 수 있도록 설정
             processData: false, // 데이터를 스트링화 하지않고 전달함
             success: function (response) {
            	 
            	 const result = $.trim(response);
            	 
                 if (result == "true") {
                	 Swal.fire('정보 입력이 완료되었습니다.', '성공', 'success').then(result => {
					 	if(result.isConfirmed)
						// 완료 창을 닫으면 부모창 새로고침
						window.opener.location.reload();
						window.close(); // 성공 시 창 닫기
					 });
                 } else {
                	 Swal.fire('정보 입력에 실패했습니다.', '실패', 'error');
                 }
             },
             error: function () {
            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             }
         });
    	
    });//submit기능 제어 끝
});
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	
</body>
</html>