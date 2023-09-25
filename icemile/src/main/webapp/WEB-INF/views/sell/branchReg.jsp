<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이스마일</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
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
<form action="${pageContext.request.contextPath }/sell/branch" method="POST" enctype="multipart/form-data">
				<h1>지점 추가</h1>
<!-- 지점명 -->
<br> 
<label for="branch_name_label"><b>지점명</b></label>  
<input type="text" name="branch_name" id="branch_name"> 
<br> 

<!--  사업자 등록 --> 
<br> 
<label for="branch_num_label"><b>사업자 등록 번호</b></label> 
<input type="tel" name="branch_num" id="branch_num"> 
<br> 

<!-- 대표자 -->
<br>
<label for="branch_ceo_label"><b>대표자명</b></label> 
<input type="text" name="branch_ceo" id="branch_ceo">
<br> 

<!-- 지점 연락처 -->
<br> 
<label for="emp_num_label"><b>지점연락처</b></label>
<input type="tel" name="emp_num" id="emp_num"> 
<br> 

<!-- 가맹담당자 => 본사 직원 -->
<!-- 부서 영업팀 => 팝업창 => 리스트 출력 => 선택 / 드롭다운? => 선택 -->

<br>
<label for="branch_phone_label"><b>가맹 담당자</b></label> 
<input type="text" name="branch_phone" id="branch_phone">
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

<!-- 지점 이메일 -->
<br> 
<label for="email_id"><b>이메일</b></label> 
<input type="text" name="branch_email" id="branch_email"> @ 
<input type="text" name="email_dns" id="email_dns" value="naver.com">
<select name="email_sel" id="email_sel" onchange="updateEmailDns()">
<option value="">직접 입력</option>
<option value="hanmail.net">DAUM</option>
<option value="gmail.com">GOOGLE</option>
</select> <br> 
<br>

<!-- 버튼 --> 
<input type="hidden" id="permission" name="permission" value=""> 
<input type="submit" value="등록"> 
<input type="reset" value="취소">
</form>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


				<!-- 내용들어가는곳 -->
			</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	            <!-- 카카오 우편번호 API호출 -->
	            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	            <script>
	            //전역변수 선언
	            var selectedDept = '';

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
	
</script>

			<!-- 푸터 -->
			<jsp:include page="../include/footer.jsp"></jsp:include>
			<!-- 푸터 -->
		</div>
	</div>
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