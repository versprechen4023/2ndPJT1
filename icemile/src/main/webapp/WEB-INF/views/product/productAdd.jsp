<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
	
	<style>
 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
        text-align: center;
  }
  

</style>
</head>

<body class="sb-nav-fixed">
<main>

<h1>품목 추가</h1>

<form action="#" id="signup" name="signup" method="POST">
<input type="submit" value="등록">
<input type="button" value="취소">
<table border="1">
<tr>
<th>이름</th>
<th>종류</th>
<th>이름</th>
<th>단위</th>
<th>수량</th>
<th>판매단가</th>
<th>유통기한</th>
<th>거래지점</th>
<th>창고</th>
<th>비고</th>
</tr>

<tr>
<!-- 코드 -->
<td><input type="text" name="prod_name" id="prod_name"></td>
<!-- 품목종류 -->
<td>
<select name="type" id="type">
		<option value="">품목종류를 선택하십시오</option>
		<option value="R">원자재</option>
		<option value="P">완제품</option>
</select>
</td>
<!-- 이름 -->
<td>
<select name="prod_type" id="prod_type">
		<option value="">원자재종류를 선택하십시오</option>
		<option value="1">우유</option>
		<option value="2">크림</option>
</select>
</td> 
<!-- 단위 -->
<td><input type="number" name="prod_unit" min="0" size="3"></td>
<!-- 수량 -->
<td><input type="number" name="prod_amount" min="0" size="3"></td>
<!-- 판매단가 -->
<td><input type="number" name="prod_price" min="0" size="5"></td>
<!-- 유통기한 -->
<td><input type="text" name="prod_exp" id="prod_exp" size="13" readonly></td>
<!-- 거래지점 -->
<!-- 지점이 많을 경우 지점 찾기 페이지를 추가, 적을 경우 드롭 다운 -->
<td><input type="text" name="deal_code" size="13"></td>
<!-- 창고 -->
<td>
<input type="text" name="wh_code" size="13">
</td>
<!-- 비고 -->
<td><input type="text" name="prod_note"  size="6"></td>
</tr>

</table>
</form>
				
			</main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        
<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- sweetalert2 API 호출 -->
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
// 전역 변수 선언
var currentDate = new Date();
// J쿼리 함수 시작 지점
$(document).ready(function() {
	
	//서브밋 제어
    $('#signup').submit(function(event) {
    	
    	if($('#emp_pw').val() == ""){
    		return false;
    	}
    	
    	 // 다입력되었다면 AJAX 폼태그 데이터 제출시작
    	 event.preventDefault(); // 기본 폼 제출 동작을 막음
    		
    	 // 폼 데이터 직렬화
    	 var formData = $('#signup').serialize();
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/product_ajax/productInsert",
             data: formData,
             success: function(response) {
            	 
            	 const result = $.trim(response);
            	 
                 if (result == "true") {
                	 Swal.fire('품목 추가가 완료되었습니다.', '성공', 'success').then(result => {
					 	if(result.isConfirmed)
						window.close(); // 성공 시 창 닫기
					 });
                 } else {
                	 Swal.fire('품목 추가에 문제가 발생했습니다.', '실패', 'error');
                 }
             },
             error: function () {
            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             }
         });
    	
    });//submit기능 제어 끝
    
	//유통기한 데이트 피커
	$("#prod_exp").datepicker({
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
	minDate: currentDate
	});

});
</script>
    </body>
</html>
