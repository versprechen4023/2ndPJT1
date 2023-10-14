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
	<form id="branchUpdate" name="branchUpdate" >
		<h1>지점 수정</h1>
<table>

<tr><td class="tdbold">지점명</td><td><input type="text" name="branch_name" id="branch_name" value="${sellDTO.branch_name }">점</td></tr>
<tr><td class="tdbold">사업자등록번호</td><td><input type="text" name="branch_reg" id="branch_reg" value="${sellDTO.branch_reg }" ></td></tr>
<tr><td class="tdbold">대표자</td><td><input type="text" name="branch_ceo" id="branch_ceo" value="${sellDTO.branch_ceo }" ></td></tr>
<tr><td class="tdbold">지점 연락처</td><td><input type="text" name="branch_phone" id="branch_phone" value="${sellDTO.branch_phone }"></td></tr>
<tr><td class="tdbold">가맹 담당자</td><td><input type="text" name="emp_num" id="emp_num" value="${sellDTO.emp_num} " readonly>
									   <input type="button" name="search" id="search" value="조회"></td></tr>
<tr><td class="tdbold">주소검색</td><td><input type="text" name="branch_post" id="branch_post" placeholder="우편번호" value="${sellDTO.branch_post }">
							     <button type="button" id="call_api" onclick="call_Post_API()">우편번호 찾기</button></td></tr>
<tr><td class="tdbold">주소</td><td>
                          <input type="text" name="addr1" id="addr1" placeholder="기본주소"> 
                          <input type="text" name="addr2" id="addr2" placeholder="동명"></td></tr>
<tr><td class="tdbold">상세주소</td><td><input type="text" name="addr3" id="addr3" placeholder="상세주소"></td></tr>
<tr><td class="tdbold">이메일</td><td><input type="text" name="email_id" id="email_id"> @ 
									<input type="text" name="email_dns" id="email_dns" value="naver.com">
									<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
										<option value="">직접 입력</option>
										<option value="hanmail.net">HANMAIL</option>
										<option value="gmail.com">GOOGLE</option>
										<option value="daum.net">DAUM</option>
										<option value="yahoo.com">YAHOO</option>			
									</select></td></tr>

</table>	


		<span id="msg"></span>
		<div id="bottomContainer"> 
		<!-- 등록 버튼 -->
			<input type="button" id="btn" value="수정">
		</div>
		<input type="hidden" id="branch_code" name="branch_code" value="${sellDTO.branch_code }">
		<input type="hidden" id="branch_email" name="branch_email" value="">
		<input type="hidden" id=branch_add name="branch_add" value="">
	</form>
	
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->	
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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


//전역변수 선언
var email = '${sellDTO.branch_email}';
var address = '${sellDTO.branch_add}';


// 기존값 필드설정 관련

// 기존 이메일 처리

// "@"를 기준으로 이메일 주소 분리해서 변수에 저장
var parts = email.split("@");
var branch_email = parts[0]; // 이메일 아이디 부분
var email_dns = parts[1]; // 이메일 도메인 부분

// 이메일 아이디와 이메일 도메인을 각각의 입력 필드에 설정
document.getElementById("email_id").value = branch_email;
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
            document.getElementById('branch_post').value = data.zonecode;
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
        $("#branch_email").val(emailId + "@" + emailDns);
        
        //주소값 합산 설정
        // 주소값을 가져오기위한 변수선언
        var addr1 = $("#addr1").val();
        var addr2 = $("#addr2").val();
        var addr3 = $("#addr3").val();
        
        // 주소값을 합쳐서 address 필드에 저장
        $("#branch_add").val(addr1 + "" + addr2 + " " + addr3);


    };
    
 
	
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
		
// 		if(isCanUseEmail()){
// 			$('#msg').text("이미 등록된 이메일입니다.");
// 			return false;
// 		}
// 		if(isCanUsePhone()){
// 			$('#msg').text("이미 등록된 전화번호 입니다.");
// 			$('#branch_phone').focus();
// 			return false;
// 		}
		
		// 정규식 검사 끝
    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    		
    	// 데이터를 전송하기위한 폼 데이터 직렬화
     	var formData = $('#branchUpdate').serialize();
    	 
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/sell_ajax/update",
             data: formData,
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