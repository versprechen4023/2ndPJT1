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
	<form action="${pageContext.request.contextPath }/buy/buyInsertPro" id="registration" name="registration" method="POST" enctype="multipart/form-data">
		<h1>
			<b>거래처 등록</b>
		</h1>

		<br>

		<!-- 상호명 -->
		<label for="buy_name_label"><b>상호명:</b> </label>
		<input type="text" name="buy_name" id="buy_name">
		<br>
		<span id="buy_name_msg"></span>
		<br>
		<!-- 사업자 등록번호 -->
		<label for="buy_reg_label"><b>사업자 등록번호:</b></label> 
		<input type="text" name="buy_reg" id="buy_reg">
		<br> 
		<span id="buy_reg_msg"></span>
		<br>

		<!-- 대표자 -->
		<label for="buy_ceo_label"><b>대표자:</b> </label>
		<input type="text" name="buy_ceo" id="buy_ceo">
		<br>
		<span id="buy_ceo_msg"></span>
		<br>
		
		<!-- 거래처 직원 -->
		<label for="buy_emp_label"><b>거래처 직원:</b> </label>
		<input type="text" name="buy_emp" id="buy_emp">
		<br>
		<span id="buy_emp_msg"></span>
		<br>
		
		<!-- 본사 구매 담당자 / 추후에 부서별 리스트를 뽑아 그중에서 고를 수 있도록 수정? -->
		<label for="emp_num_label"><b>구매담당자:</b> </label>
		<input type="text" name="emp_num" id="emp_num">
		<br>
		<span id="emp_num_msg"></span>
		<br>
		

		<!-- 업종 유형 -->
		<label for="buy_type_label"><b>업종 유형:</b></label> 
		<select name="buy_type" id="buy_type">
			<option value="">업종 유형을 선택하십시오</option>
			<option value="우유">우유</option>
    		<option value="크림">크림</option>
    		<option value="설탕">설탕</option>
    		<option value="파우더">파우더</option>
    		<option value="조미료">조미료</option>
    		<option value="포장">포장</option>
		</select> 
		<br>
		<span id="buy_type_msg"></span>
		<br>
		
		<!-- 전화번호 -->
		<label for="buy_phone_label"><b>연락처:</b></label> 
		<input type="text" name="buy_phone" id="buy_phone">
		<br> 
		<span id="buy_phone_msg"></span>
		<br>
		
		<!-- 주소 -->
		<label for="buy_add_label"><b>주소검색</b></label> 
		<input type="text" name="buy_post" id="buy_post" placeholder="우편번호">
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
		<span id="buy_add_msg"></span>
		<br>
		
		<!-- 이메일 -->
		<label for="buy_email_label"><b>이메일</b></label> 
		<input type="text" name="email_id" id="email_id"> @ 
		<input type="text" name="email_dns" id="email_dns"> 
		<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
			<option value="">직접 입력</option>
			<option value="hanmail.net">DAUM</option>
			<option value="gmail.com">GOOGLE</option>
		</select>
		<br>
		<span id="buy_email_msg"></span>
		<br>








		<!-- 등록 버튼 -->
		<div id="btn">
			<input type="submit" id="btn" value="등록">
		</div>
		<input type="hidden" id="buy_email" name="buy_email" value="">
		<input type="hidden" id="buy_add" name="buy_add" value="">
	</form>


<!-- 카카오 우편번호 API호출 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            document.getElementById('buy_post').value = data.zonecode;
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
	



    
    // 서브밋 될때 실행
    $('form').on('submit', function () {
        // 체크된 체크박스들의 값을 합산할 변수 초기화
        var sum = 0;
        
        
      
        // 이메일 값 합산 설정
        // 입력이메일을 가져오기위한 변수선언
        var emailId = $("#email_id").val();
        var emailDns = $("#email_dns").val();
		
        // email_id와 email_dns를 합쳐서 email 필드에 저장
        $("#buy_email").val(emailId + "@" + emailDns);
        
        //주소값 합산 설정
        // 주소값을 가져오기위한 변수선언
        var addr1 = $("#addr1").val();
        var addr2 = $("#addr2").val();
        var addr3 = $("#addr3").val();
        
        // 주소값을 합쳐서 address 필드에 저장
        $("#buy_add").val(addr1 + "" + addr2 + " " + addr3);
        var buy_add = $("#buy_add").val();
//         alert(buy_add);
    });
	
    

    
  	//서브밋 제어
    $('#registration').submit(function(event) {
    	
       	if($('#buy_name').val() == ""){
    		$('#buy_name_msg').css('color','red');
    		$('#buy_name_msg').text("상호명을 입력하십시오."); 
    		$('#buy_name').focus();
    		return false;
    	}
    	
    	if($('#buy_reg').val() == ""){
    		$('#buy_reg_msg').css('color','red');
    		$('#buy_reg_msg').text("사업자 등록번호을 입력하십시오.");
    		$('#buy_reg').focus();
    		return false;
    	}
    	
    	if($('#buy_ceo').val() == ""){
    		$('#buy_ceo_msg').css('color','red');
    		$('#buy_ceo_msg').text("대표자를 입력하십시오.");  
    		$('#buy_ceo').focus();
    		return false;
    	}
    	
    	if($('#buy_emp').val() == ""){
    		$('#buy_emp_msg').css('color','red');
    		$('#buy_emp_msg').text("거래처 직원을 입력하십시오.");
    		$('#buy_emp').focus();
    		return false;
    	}
    	
    	if($('#emp_num').val() == ""){
    		$('#emp_num_msg').css('color','red');
    		$('#emp_num_msg').text("구매 담당자를 입력하십시오.");
    		$('#emp_num').focus();
    		return false;
    	}
    	
    	if($('#buy_type').val() == ""){
    		$('#buy_type_msg').css('color','red');
    		$('#buy_type_msg').text("업종 유형을 선택하십시오.");
    		$('#buy_type').focus();
    		return false;
    	}
    	
    	if($('#hbuy_phone').val() == ""){
    		$('#buy_phone_msg').css('color','red');
    		$('#buy_phone_msg').text("전화번호를 입력하십시오.");
    		$('#buy_phone').focus();
    		return false;
    	}
    	

    	
    	if($('#buy_post').val() == "" || $('#addr1').val() == ""){
    		$('#buy_add_msg').css('color','red');
    		$('#buy_add_msg').text("주소를 입력하십시오.");
    		return false;
    	}
    	
    	if($('#email_id').val() == "" || $('#email_dns').val() == ""){
    		$('#emailmsg').css('color','red');
    		$('#emailmsg').text("이메일을 입력하십시오.");
    		return false;
    	}
    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 event.preventDefault(); // 기본 폼 제출 동작을 막음
    		
    	 // 폼 데이터 객체생성
    	 var formData = new FormData(this);
         
    	 $.ajax({
    		    type: "POST",
    		    url: "${pageContext.request.contextPath}/buy_ajax/insert",
    		    data: formData,
    		    contentType: false,
    		    processData: false,
    		    success: function(response) {
    		        if (response === "true") {
    		            Swal.fire('정보 입력이 완료되었습니다.', '성공', 'success').then(result => {
    		                if (result.isConfirmed) {
    		                    window.opener.location.reload();
    		                    window.close();
    		                }
    		            });
    		        } else {
    		            Swal.fire('정보 입력에 실패했습니다.', '실패', 'error');
    		        }
    		    },
    		    error: function() {
    		        Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
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