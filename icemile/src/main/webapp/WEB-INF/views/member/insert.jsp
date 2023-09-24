<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
<h1>사원 추가</h1>
<form action="${pageContext.request.contextPath }/member/insert" method="post">
이름<br>
<input type="text" name="emp_num" id="emp_num" value="">
<br>
생년월일<br>
<input type="text" name="birthdate" id="birthdate" placeholder="생일을 선택해 주십시오" readonly>
<br>

부서<br>
<select name="dept_name" id="dept_name">
	<option>부서를 선택하십시오</option>
    <option value="1">인사</option>
    <option value="2">영업</option>
    <option value="3">생산</option>
    <option value="4">물류</option>
</select>
<br>

직급<br>
<select name="position" id="position">
	<option>직급을 선택하십시오</option>
    <option value="1">사원</option>
    <option value="2">대리</option>
    <option value="3">과장</option>
    <option value="4">차장</option>
    <option value="5">부장</option>
</select>
<br>

권한<br>
<label for="dept1">
	<input type="checkbox" id="dept1" name="role" value="1" disabled>인사
</label>
<label for="dept2">
	<input type="checkbox" id="dept2" name="role" value="2" disabled>영업
</label>
<label for="dept3">
	<input type="checkbox" id="dept3" name="role" value="4" disabled>생산
</label>
<label for="dept4">
	<input type="checkbox" id="dept4" name="role" value="8" disabled>물류
</label>
<br>
<input type="hidden" id="permission" name="permission" value="">
<input type="submit" value="등록">
</form>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">
<script>
//전역변수 선언
var selectedDept = '';

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
    
    $('form').on('submit', function () {
        // 체크된 체크박스들의 값을 합산할 변수 초기화
        var sum = 0;
        
        // 체크된 체크박스들을 순회하며 값을 합산
        $('[name="role"]:checked').each(function () {
            sum += parseInt($(this).val());
        });
        
        // 합산된 값을 permission 입력 필드에 설정
        $('#permission').val(sum);
    });

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
    	  defaultDate: new Date(1900, 0, 1) // 1900년 1월 1일을 초기 날짜로 설정
    });
    
});
</script>
</body>
</html>