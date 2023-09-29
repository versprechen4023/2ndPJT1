<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form action="#" id="signup" name="signup" method="POST" enctype="multipart/form-data">
		<h1>
			<b>사원정보수정</b>
		</h1>

		<!-- 사진 등록 -->
		 <img src="" alt="미리보기" id="preview" style="max-width: 100px; max-height: 100px; display: none;"> <br>
		  <input type="file" id="file" name="file"> <br><br>
    
    <br><br>

		<!-- 이름 -->
		<b>이름:</b> <input type="text" name="emp_name" id="emp_name" value="${memberDTO.emp_name }" readonly>
		<br>
		<span id="namemsg"></span>
		<br>
		<!-- 생년월일 -->
		<label for="birthdate"><b>생년월일:</b></label>
		<input type="text" name="birthdate" id="birthdate" value="${memberDTO.birthdate }" readonly>
		<br>
		<span id="birthmsg"></span>
		<br>

		<!-- 부서 -->
		<label for="department_label"><b>부서 선택:</b></label>
		<select name="dept_name" id="dept_name">
			<option value="">부서를 선택하십시오</option>
			<option value="0">관리자</option>
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
			<option value="0">관리자</option>
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
		<input type="text" name="phone_num" id="phone_num" value="${memberDTO.phone_num }">
		<br> 
		<span id="phonemsg"></span>
		<br>
		
		<!-- 내선번호 -->
		<label for="hotline_label"><b>내선번호:</b></label> 
		<input type="text" name="hotline" id="hotline" value="${memberDTO.hotline}" readonly>
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
		<input type="text" name="emp_post" id="emp_post" placeholder="우편번호" value="${memberDTO.emp_post }">
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
		<input type="text" name="hire_date" id="hire_date" value="${memberDTO.hire_date }" readonly>
		<br>
		<span id="hiremsg"></span>
		<br>


		<!-- 권한 설정 -->
		<label for="emp_role_label"><b>권한설정:</b></label> 
		<label for="dept1">
			<input type="checkbox" id="dept1" name="role" value="1000" 
			<c:if test="${memberDTO.emp_role.charAt(0).toString() eq '1' }">checked</c:if>
			<c:if test="${memberDTO.position != '5' && memberDTO.position != '0'}">disabled</c:if>>인사
		</label>
		<label for="dept2">
			<input type="checkbox" id="dept2" name="role" value="100" 
			<c:if test="${memberDTO.emp_role.charAt(1).toString() eq '1' }">checked</c:if>
			<c:if test="${memberDTO.position != '5' && memberDTO.position != '0'}">disabled</c:if>>영업
		</label>
		<label for="dept3">
			<input type="checkbox" id="dept3" name="role" value="10" 
			<c:if test="${memberDTO.emp_role.charAt(2).toString() eq '1' }">checked</c:if>
			<c:if test="${memberDTO.position != '5' && memberDTO.position != '0'}">disabled</c:if>>생산
		</label>
		<label for="dept4">
			<input type="checkbox" id="dept4" name="role" value="1" 
			<c:if test="${memberDTO.emp_role.charAt(3).toString() eq '1' }">checked</c:if>
			<c:if test="${memberDTO.position != '5' && memberDTO.position != '0'}">disabled</c:if>>물류
		</label>
		<br>
		<span id="rolemsg"></span>
		<br>


		<!-- 등록 버튼 -->
		<div id="btn">
			<input type="submit" id="btn" value="등록">
		</div>
		<input type="hidden" id="emp_num" name="emp_num" value="${memberDTO.emp_num }">
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

<!-- sweetalert2 API 호출 -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>
//전역변수 선언
var selectedDept = '${memberDTO.dept_name}';
var currentDate = new Date();
var position = '${memberDTO.position}';
var email = '${memberDTO.email}';
var address = '${memberDTO.address}';
var emp_role = '${memberDTO.emp_role}';

// 기존값 필드설정 관련

// 직급, 부서 기존값에 따라 필드에 설정
document.getElementById("dept_name").value = selectedDept;
document.getElementById("position").value = position;

// 기존 이메일 처리

// "@"를 기준으로 이메일 주소 분리해서 변수에 저장
var parts = email.split("@");
var email_id = parts[0]; // 이메일 아이디 부분
var email_dns = parts[1]; // 이메일 도메인 부분

// 이메일 아이디와 이메일 도메인을 각각의 입력 필드에 설정
document.getElementById("email_id").value = email_id;
document.getElementById("email_dns").value = email_dns;

// 기존 주소 처리
// 주소를 동명 기준으로 분리
// 정규식을 이용하여 문자열 분리
var dong = address.match(/\((.*?)\)/);

// 동명이없는 경우에는 기준점이 없으므로 처리할수없음
if(dong != null){
// 기준점은 동명()괄호가 된다
var parts = address.split(dong[0]);

// 분리된 주소를 각각의 입력 필드에 설정
document.getElementById("addr1").value = parts[0].trim(); // 주소 앞 부분
document.getElementById("addr2").value = dong[0]; // 동 문자
document.getElementById("addr3").value = parts[1].trim(); // 주소 뒷 부분
} else {
	document.getElementById("addr1").value = address;
}

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
            // 상세주소 필드를 초기화한다
            document.getElementById("addr3").value = '';
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
        selectedDept = $(this).val();
        
     	// 권한 초기화
        $('[name="role"]').prop('checked', false);
     
     	// 해당 부서에 대한 권한 체크박스 checked로 변경
        // 관리자일경우에는 전체체크 및 직급 관리자 자동 설정
        if(selectedDept == '0'){
        	$('[name="role"]').prop('checked', true);
        	
        	// 선택자 지정후 변수에 담기
        	var positionSelect = document.getElementById("position").value = 0;
        	// 관리자 선택
        	positionSelect.value = "0";
        } else {
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
    
  	//서브밋 제어
    $('#signup').submit(function(event) {
    	
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
    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 event.preventDefault(); // 기본 폼 제출 동작을 막음
    		
    	 // 폼 데이터 객체생성
    	 var formData = new FormData(this);
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/member_ajax/update",
             data: formData,
             contentType: false, // 멀티파트를 처리하기위해 객체를 직렬화하지 않고 직접 AJAX 통신할 수 있도록 설정
             processData: false, 
             success: function (response) {
            	 
            	 const result = $.trim(response);
            	 
                 if (result == "true") {
                	 Swal.fire('정보 수정이 완료되었습니다.', '성공', 'success').then(result => {
					 	if(result.isConfirmed)
						// 완료 창을 닫으면 부모창 새로고침
						window.opener.location.reload();
						window.close(); // 성공 시 창 닫기
					 });
                 } else {
                	 Swal.fire('수정에 실패했습니다.', '실패', 'error');
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
	
</body>
</html>