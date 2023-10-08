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
	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 헤더 -->

	<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
			<main>
				<!-- 내용들어가는곳 -->
<form id="branchReg" name="branchReg" >
				<h1>지점 추가</h1>
<!-- 지점명 -->
<br> 
<label for="branch_name_label"><b>지점명</b></label>  
<input type="text" name="branch_name" id="branch_name">점
<br> 
<br>

<!--  사업자 등록 --> 
<br> 
<label for="branch_num_label"><b>사업자 등록 번호</b></label> 
<input type="text" name="branch_reg" id="branch_reg"> 
<br> 
<br>

<!-- 대표자 -->
<br>
<label for="branch_ceo_label"><b>대표자명</b></label> 
<input type="text" name="branch_ceo" id="branch_ceo">
<br> 
<br>

<!-- 지점 연락처 -->
<br> 
<label for="branch_phone_label"><b>지점연락처</b></label>
<input type="text" name="branch_phone" id="branch_phone"> 
<br> 
<br>

<!-- 가맹담당자 => 본사 직원 -->
<!-- 부서 영업팀 => 팝업창 => 리스트 출력 => 선택 / 드롭다운? => 선택 -->

<br>
<label for="branch_phone_label"><b>가맹 담당자</b></label> 
<input type="text" name="emp_num" id="emp_num" placeholder="담당자검색" readonly>
<input type="button" name="search" id="search" value="조회"><br>
<br>

		<!-- 주소 -->
		<br>
		<label for="postalCode_label"><b>주소검색</b></label> 
		<input type="text" name="branch_post" id="branch_post" placeholder="우편번호">
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
		<br>

<!-- 지점 이메일 -->
<br> 
<label for="email_id_label"><b>이메일</b></label> 
<input type="text" name="email_id" id="email_id"> @ 
<input type="text" name="email_dns" id="email_dns" value="naver.com">
<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
<option value="">직접 입력</option>
<option value="hanmail.net">DAUM</option>
<option value="gmail.com">GOOGLE</option>
</select> <br> 
<br>
<br>

<span id="msg"></span>
<div id="bottomContainer"> 
		<!-- 등록 버튼 -->
			<input type="button" id="btn" value="등록">			
		</div>
<input type="hidden" id="branch_email" name="branch_email" value="">
<input type="hidden" id="branch_add" name="branch_add" value="">

</form>

<!-- 내용들어가는곳 -->
</main>

<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->

<!-- J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 카카오 우편번호 API호출 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- sweetalert2 API 호출 -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- 담당자 검색기능 -->
<script type="text/javascript">


// 팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}

$(document).ready(function() {
    // 사원 검색 팝업 열기
    $("#search").click(function() {
        var url = '${pageContext.request.contextPath}/member/memberListPopUp';
        openPopup(url);
    });
});

//팝업 창에서 선택된 emp_num 값을 받아서 표시하는 함수
function receiveSelectedEmpNum(empNum) {
    document.getElementById('emp_num').value = empNum;
}


//우편번호 API 호출
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
            document.getElementById('branch_post').value = data.zonecode;
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

//J쿼리 함수 시작지점
$(document).ready(function() {

	// 서브밋 될때 실행
    function mergeData() {
        
        // 이메일 값 합산 설정
	        // 입력이메일을 가져오기위한 변수선언
	        var emailId = $("#email_id").val();
	        var emailDns = $("#email_dns").val();
	        // email_id와 email_dns를 합쳐서 email 필드에 저장
	        var branch_email = $("#branch_email").val();
			
	        branch_email = (emailId + "@" + emailDns);
	        
	        $("#branch_email").val(branch_email);
	        
	        //주소값 합산 설정
	        // 주소값을 가져오기위한 변수선언
	        var addr1 = $("#addr1").val();
	        var addr2 = $("#addr2").val();
	        var addr3 = $("#addr3").val();
	        
	        // 주소값을 합쳐서 address 필드에 저장
	        $("#branch_add").val(addr1 + "" + addr2 + " " + addr3);
    } 


// 중복검사 관련함수
    function isCanUseEmail() {
    	
    	// 검증할 이메일을 가져온다
    	var email = $("#branch_email").val();
    	
    	// 결과값 반환을 위한 변수선언
    	var myBoolean = true;
    	
    	$.ajax({
		  	type: "GET",
	        url: "${pageContext.request.contextPath}/sell_ajax/searchEmail",
	        data: {"branch_email": email},
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
    	var phone = $("#branch_phone").val();
		// 결과값 반환을 위한 변수선언
    	var myBoolean = true;
    	$.ajax({
		  	type: "GET",
	        url: "${pageContext.request.contextPath}/sell_ajax/searchPhone",
	        data: {"branch_phone": phone},
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
	        	myBoolean = true;
            }
	  	});// end ajax
	  	
		return myBoolean;
	} // end function
	
  	//서브밋 제어
    $('#btn').click(function() {
    	
    	// 데이터 병합실행
   	 	mergeData();
    	 
    	if($('#branch_name').val() == ""){
    		$('#msg').text("지점명을 입력하십시오."); 
    		$('#branch_name').focus();
    		return false;
    	}
    	
    	if($('#branch_reg').val() == ""){
    		$('#msg').text("사업자 등록번호를 입력하십시오.");
    		$('#branch_reg').focus();
    		return false;
    	}
    	
    	if($('#branch_ceo').val() == ""){
    		$('#msg').text("대표자명을 입력하십시오.");  
    		$('#branch_ceo').focus();
    		return false;
    	}
    	
    	if($('#branch_phone').val() == ""){
    		$('#msg').text("지점 번호를 입력하십시오.");
    		$('#branch_phone').focus();
    		return false;
    	}
    	
    	if($('#emp_num').val() == ""){
    		$('#msg').text("가맹 담당자를 선택하십시오.");
    		$('#emp_num').focus();
    		return false;
    	}
    	
    	if($('#branch_post').val() == ""){
    		$('#msg').text("우편번호를 입력해주세요.");
    		$('#branch_post').focus();
    		return false;
    	}

	if($('#addr1').val() == "" || $('#addr1').val() == ""){
    		$('#msg').text("주소를 입력하십시오.");
    		return false;
    	}
    	
    	if($('#email_id').val() == "" || $('#email_dns').val() == ""){
    		$('#msg').text("이메일을 입력하십시오.");
    		return false;
    	}
    	
    	// 정규식 검사
    	// 검사를 위한 변수선언
		var regName = /^[a-zA-Z가-힣]+$/;
		var regEmail = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		var regPhone = /^[0-9]{9,11}$/;

		if (!regName.test($('#branch_name').val())) {
			$('#msg').text("올바른 이름을 입력해주세요 한글, 영/대소문자만 입력가능 합니다.");
			$('#branch_name').focus();
    		return false;
		}
		
		if (!regEmail.test($('#email_dns').val())) {
			$('#msg').text("유효한 이메일 주소를 입력해주세요.");
			$('#email_dns').focus();
    		return false;
		}
		
		if (!regPhone.test($('#branch_phone').val())) {
			$('#msg').text("- 없이 올바른 전화번호를 입력해주십시오.");
			$('#branch_phone').focus();
    		return false;
		}
		
		if(isCanUseEmail()){
			$('#msg').text("이미 등록된 이메일입니다.");
			return false;
		}
		if(isCanUsePhone()){
			$('#msg').text("이미 등록된 전화번호 입니다.");
			$('#branch_phone').focus();
			return false;
		}
		
		// 정규식 검사 끝
		
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 
		// 폼 데이터 객체생성
    	 var formData = new FormData(document.getElementById('branchReg'));
          
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/sell_ajax/insert",
             data: formData,
             processData: false,
             contentType: false,
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
				   

}); // end JQuery;

</script>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	
</body>
</html>