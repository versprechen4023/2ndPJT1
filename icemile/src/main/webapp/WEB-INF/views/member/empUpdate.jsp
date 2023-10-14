<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form action="#" id="signup" name="signup" method="POST" enctype="multipart/form-data">
		<h1>사원 정보 수정</h1>

<table>
<tr><td  class="tdbold">사진</td><td>
		 <img src="" alt="미리보기" id="preview" style="max-width: 100px; max-height: 100px; display: none;">
		  <input type="file" id="file" name="file"></td></tr>

<tr><td class="tdbold">이름</td><td><input type="text" name="emp_name" id="emp_name" value="${memberDTO.emp_name }" readonly></td></tr>

<tr><td class="tdbold">생년월일</td><td><input type="text" name="birthdate" id="birthdate" value="${memberDTO.birthdate }" readonly></td></tr>

<tr><td class="tdbold">부서</td><td><input type="text" name="dept_name" id="dept_name" value="${memberDTO.dept_name}" readonly> </td></tr>

<tr><td class="tdbold">직급</td><td><input type="text" name="position" id="position" value="${memberDTO.position }" readonly></td></tr>
		
<tr><td class="tdbold">전화번호</td><td><input type="text" name="phone_num" id="phone_num" value="${memberDTO.phone_num }"></td></tr>
		
<tr><td class="tdbold">내선번호</td><td><input type="text" name="hotline" id="hotline" value="${memberDTO.hotline}" readonly></td></tr>

<tr><td class="tdbold">이메일</td><td><input type="text" name="email_id" id="email_id"> @ 
		<input type="text" name="email_dns" id="email_dns"> 
		<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
			<option value="">직접 입력</option>
			<option value="hanmail.net">DAUM</option>
			<option value="gmail.com">GOOGLE</option>
		</select></td></tr>

<tr><td class="tdbold">주소 검색</td><td><input type="text" name="emp_post" id="emp_post" placeholder="우편번호" value="${memberDTO.emp_post }">
		<button type="button" id="call_api" onclick="call_Post_API()">우편번호 찾기</button></td></tr>

<tr><td class="tdbold">주소</td><td><input type="text" name="addr1" id="addr1" placeholder="기본주소"> 
		<input type="text" name="addr2" id="addr2" placeholder="동명"></td></tr>
		
<tr><td class="tdbold">상세주소</td><td><input type="text" name="addr3" id="addr3" placeholder="상세주소"></td></tr>

<tr><td class="tdbold">입사일</td><td><input type="text" name="hire_date" id="hire_date" value="${memberDTO.hire_date }" readonly></td></tr>

<tr><td class="tdbold">권한설정</td><td><label for="dept1">
			<input type="checkbox" id="dept1" name="role" value="1000" 
			<c:if test="${memberDTO.emp_role.charAt(0).toString() eq '1' }">checked</c:if>
			disabled>인사
		</label>
		<label for="dept2">
			<input type="checkbox" id="dept2" name="role" value="100" 
			<c:if test="${memberDTO.emp_role.charAt(1).toString() eq '1' }">checked</c:if>
			disabled>영업
		</label>
		<label for="dept3">
			<input type="checkbox" id="dept3" name="role" value="10" 
			<c:if test="${memberDTO.emp_role.charAt(2).toString() eq '1' }">checked</c:if>
			disabled>생산
		</label>
		<label for="dept4">
			<input type="checkbox" id="dept4" name="role" value="1" 
			<c:if test="${memberDTO.emp_role.charAt(3).toString() eq '1' }">checked</c:if>
			disabled>물류
		</label></td></tr>
</table>

		<span id="msg"></span>

		<div id="bottomContainer"> 
		<!-- 수정 버튼 -->
			<input type="button" id="btn" value="수정">		
		</div>
		

		<input type="hidden" id="emp_num" name="emp_num" value="${memberDTO.emp_num }">
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
var currentDate = new Date();
var email = '${memberDTO.email}';
var address = '${memberDTO.address}';

// 기존값 필드설정 관련

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
    
	// 서브밋 될때 실행
    function mergeData() {
        
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
    	var myEmail = $("#email").val();
    	
    	// 결과값 반환을 위한 변수선언
    	var myBoolean = true;
    	
    	// 기존 이메일과 일치하다면 그대로 실행
    	if(myEmail == email){
    		return false;
    	}
    	
    	$.ajax({
		  	type: "GET",
	        url: "${pageContext.request.contextPath}/member_ajax/searchEmail",
	        data: {"email": myEmail},
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
    	var myPhone = $("#phone_num").val();
		// 결과값 반환을 위한 변수선언
    	var myBoolean = true;
		
		// 기존전화번호를 가져온다
		var phone = '${memberDTO.phone_num}';
    	// 기존 전화번호와 일치하다면 그대로 실행
    	if(myPhone == phone){
    		return false;
    	}
    	
    	$.ajax({
		  	type: "GET",
	        url: "${pageContext.request.contextPath}/member_ajax/searchPhone",
	        data: {"phone_num": myPhone},
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
    	
    	if($('#phone_num').val() == ""){
    		$('#msg').text("전화번호를 입력해주세요.");
    		$('#phone_num').focus();
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
    	
    	// 정규식 검사
    	// 검사를 위한 변수선언
		var regEmail = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		var regPhone = /^[0-9]{9,11}$/;
		
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
		
		if(isCanUseEmail()){
			$('#msg').text("이미 등록된 이메일입니다.");
			return false;
		}
		if(isCanUsePhone()){
			$('#msg').text("이미 등록된 전화번호 입니다.");
			$('#phone_num').focus();
			return false;
		}
    		
    	 // 폼 데이터 객체생성
    	 var formData = new FormData(document.getElementById('signup'));
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/member_ajax/userUpdate",
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