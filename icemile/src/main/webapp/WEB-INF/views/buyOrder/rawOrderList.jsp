<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
    </head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
<form id="rawOrderList">
                <main>
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">발주</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
							<input type="button" value="발주추가" id="rawOrderAdd">
							<input type="button" value="수정" id="updateRawOr">
							<input type="button" value="삭제" id="deleteRawOr">
							<input type="button" value="취소" id="cancelRawOr" disabled>
							<input type="button" value="저장" id="saveRawOr" disabled>
						</c:if>
						</div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
                            <br>
                            
                            발주일자
                            <input type="text" name="rawOrderBegin" id="rawOrderBegin"> ~
                            <input type="text" name="rawOrderEnd" id="rawOrderEnd" disabled>
                            <br>
                            
                            입고예정일
                            <input type="text" name="rawOrderInBegin" id="rawOrderInBegin"> ~
                            <input type="text" name="rawOrderInEnd" id="rawOrderInEnd" disabled>
                            <br>
                            
                            발주상태
							<select id="category">
  								<option value="rawOrderAll">전체</option>
  								<option value="rawOrderUn">발주중</option>
  								<option value="rawOrderCom">발주확정</option>
							</select>
							<input type="text" name="content" size=60 placeholder="자재명을 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="productSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllRawOrderId"></th>
                                        	<th>발주코드</th>
                                            <th>원자재코드</th>
                                            <th>원자재명</th>
                                            <th>원자재종류</th>
                                            <th>매입처코드</th>
                                            <th>매입처명</th>
                                            <th>발주량</th>
                                            <th>단가</th>
                                            <th>총금액</th>
                                            <th>발주 일자</th>
                                            <th>입고 예정일</th>
                                            <th>진행 상황</th>
                                            <th>담당자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="RowOrderListDTO" items="${rawOrderList}">
                                        <tr>
                      						<td><input type="checkbox" name="selectedRawOrderId" value="${RowOrderListDTO.raw_order_code}"></td>
                                        	<td>${RowOrderListDTO.raw_order_code}</td>
                                            <td>${RowOrderListDTO.raw_code}</td>
                                            <td>${RowOrderListDTO.raw_name}</td>
                                            <td>${RowOrderListDTO.raw_type}</td>
                                            <td>${RowOrderListDTO.buy_code}</td>
                                            <td>${RowOrderListDTO.buy_name}</td>
                                            <td>${RowOrderListDTO.raw_order_amount}</td>
                                            <td>${RowOrderListDTO.raw_price}</td>
                                            <td>${RowOrderListDTO.raw_fullprice}</td>
                                            <td>${RowOrderListDTO.raw_order_date}</td>
                                            <td>${RowOrderListDTO.in_plan_date}</td>
                                            <c:if test="${RowOrderListDTO.raw_status eq 1}">
                                            	<td>발주중</td>
                                            </c:if>
                                            <c:if test="${RowOrderListDTO.raw_status eq 2}">
                                            	<td>발주확정</td>
                                            </c:if>
                                            <td>${RowOrderListDTO.emp_num}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
</form>
                            </div>
                        </div>
                        <input type="button" value="엑셀파일다운" id="excelRawOrder">
                    </div>
                <!-- 내용 들어가는 곳 -->
                </main>
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 --> 
                
            </div>
        </div>
<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- 모달 alert를 위한 sweetalert 호출 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/productList_im.js"></script>
	
<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script>
//추가, 수정 을 구분하기위한 전역변수선언
var status = "";

//날짜 계산 함수
function getDate() {
	// 현재 날짜를 변수에 담는다
	const currentDate = new Date();
	// 년도를 구한다 Date을 String으로 변환하여 변수에 저장한다
	const currentYear = currentDate.getFullYear().toString();
	// 달을 구한다 Date형식은 0부터 시작하므로 올바른 월을 구하기위해 +1을 해줘야한다 이후 LPAD로 2자리를 명시하고 나머지부분은 0으로 채운다
	const currentMonth = (currentDate.getMonth() + 1).toString().padStart(2, '0');
	// 일을 구한다 LPAD로 2자리를 명시하고 나머지부분은 0으로 채운다
	const currentDateVal = currentDate.getDate().toString().padStart(2, '0');
	
	// 포맷된 날짜를 변수에 저장한다 YY-MM-DD의 형식이다
	const formattedDate = currentYear + '-' + currentMonth + '-' + currentDateVal;
	// 포맷된 날짜를 리턴한다
	return formattedDate;
}// end function

//함수 시작지점
$(document).ready(function() {
	
	// 정규식 제어함수
	function formTest(formData){
		// 결과값 반환을 위한 변수선언
		var result = true;
		
		// &을 기준으로 끊고 배열 변수를 선언한다 이후 배열에 따라 반복문을 시행한다
		// 기준 데이터는 아래와같다 "content=&type=&prod_name="...
		var formArray = formData.split("&");

	    // 사용자에게 알려주기위해 영문 키값을 한글로 매핑한다
	    // 매핑을 위한 JSON 변수선언
	    var koreanNames = {
	  		"raw_code": "원자재 코드",
	  		"buy_code": "매입처 코드",
	  		"raw_order_amount": "발주량",
	  		"in_plan_date": "입고예정일",
	  		"emp_num": "담당자"
		};
		// 반복문을 사용하여 각 항목을 검사한다
		for (var i = 0; i < formArray.length; i++) {
		  
		  // 키값의 기준점은 = 이된다
		  var keyValue = formArray[i].split("=");
		  // 키변수에 키값을 담는다
		  var key = decodeURIComponent(keyValue[0]);
		  console.log(key);
		  // 밸류 변수에 키의 리터럴 값을 담는다
		  var value = decodeURIComponent(keyValue[1]);
		  console.log(value);
		  // 제외할 값을 담을 변수선언
		  var isOk = (key === "rawOrderBegin" || key === "rawOrderEnd" || key === "rawOrderInBegin" 
				      || key === "rawOrderInEnd" || key === "content" || key === "raw_order_code"
				      || key === "raw_fullprice")
		  // 제외할 값은 반복문을 무시하고 진행한다
		  if (isOk && value === ""){
			  continue;
		  }
		  
		  if (value === "" || value == 0) {
		    // 값이 비어 있는 경우 결과값은 false가 된다
		    Swal.fire(koreanNames[key]+' 값을 입력해주십시오.', '', 'info');
		    result = false;
		    break; // 비어있는 필드를 발견하면 반복문을 종료하고 false를 반환한다
		  }

		}// end for
		
		// 결과값 반환
		return result;
		
	}// end function
	// 정규식 제어함수 끝

	// 추가, 삭제, 수정등 기능 구현 함수 시작지점
	
	// 추가 버튼 누를 시 실행되는 함수
	$("#rawOrderAdd").click(function(){
		 // 상태를 저장으로 변경
		 status = "save";
		 
		 // tr에 값을 삽입하기위한 변수선언
		 var $tr = $('<tr>');
		 
		 //tr 에 내용추가
	  	 $tr.append(
	  		'<td><input type="checkbox" name="selectedRawOrderId" disabled></td>',
	  		'<td><input type="text" id="raw_order_code" name="raw_order_code" placeholder="(자동으로 부여)" readonly></td>',
	  		'<td><input type="text" id="raw_code" name="raw_code" readonly></td>',
	  		'<td><input type="text" id="raw_name" name="raw_name" readonly></td>',
	  		'<td><input type="text" id="raw_type" name="raw_type" readonly></td>',
	  		'<td><input type="text" id="buy_code" name="buy_code"></td>',
	  		'<td><input type="text" id="buy_name" name="buy_name"></td>',
	  		'<td><input type="text" id="raw_order_amount" name="raw_order_amount" value ="0"></td>',
	  		'<td><input type="text" id="raw_price" name="raw_price" readonly></td>',
	  		'<td><input type="text" id="raw_fullprice" name="raw_fullprice" placeholder="(자동으로 계산됨)" readonly></td>',
	  		'<td><input type="text" id="raw_order_date" name="raw_order_date" value="'+getDate()+'"></td>',
	  		'<td><input type="text" id="in_plan_date" name="in_plan_date" readonly></td>',
	  		'<td><input type="text" id="raw_status_name" name="raw_status_name" value="발주전" readonly></td>',
	  		'<td><input type="text" id="emp_num" name="emp_num" readonly></td>',
	  		);
	  	// 생성한 <tr> 요소를 tbody에 추가
	  	$('tbody tr:nth-child(1)').before($tr);
	  	
	  	// 발주추가중에 발주추가,수정,삭제 버튼을 비활성화한다
	  	$("#rawOrderAdd").attr('disabled','disabled');
	  	$("#updateRawOr").attr('disabled','disabled');
		$("#deleteRawOr").attr('disabled','disabled');
		
		// 발주추가중에 취소, 저장 버튼입력이 가능하다
		$("#cancelRawOr").removeAttr("disabled");
		$("#saveRawOr").removeAttr("disabled");
		
	});// end function
	
	// 수정 버튼 누를 시 실행되는 함수
	$("#updateRawOr").click(function(){
		
		// 상태를 업데이트로 변경한다
		status = "update";
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedRawOrderId']:checked");
		
		// 발주상태를 확인하기위한 변수선언
		var tdText = selectedCheckbox.closest("tr").find('td:eq(12)').text();
		
		// 발주 확정 상태라면 에러가 발생한다
		if(tdText === "발주확정"){
			Swal.fire('발주확정된 상태에서는 수정 할 수 없습니다.', '실패', 'error');
			return false;
		}
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			
			// 텍스트태그를 추가할 tr태그를 선택한다
			var row = selectedCheckbox.closest("tr");
			
			// input type의 name 값 지정
			var cellNames = [
				"raw_order_code", 
				"raw_code", 
				"raw_name", 
				"raw_type",
				"buy_code",
				"buy_name",
				"raw_order_amount",
				"raw_price",
				"raw_fullprice",
				"raw_order_date",
				"in_plan_date",
				"raw_status",
				"emp_num"
			];
			
			// input type의 id 값 지정
			var cellIds = [
				"raw_order_code", 
				"raw_code",
				"raw_name",
				"raw_type",
				"buy_code",
				"buy_name",
				"raw_order_amount",
				"raw_price",
				"raw_fullprice",
				"raw_order_date",
				"in_plan_date",
				"raw_status",
				"emp_num"
			];
			
			// 셀렉트 태그를 위한 변수선언
			var select = "";
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
			row.find("td:not(:first-child)").each(function(index) {
				
				// 기존 텍스트 값을 변수에 저장한다
				var cellValue = $(this).text();
				// 삼항연산자 6번째 행(주문량)과 10번째행(종류)을 제외하고는 리드온리로 변경할 수 없다
				var cellOption = index === 6 || index === 10 ? "" : "readonly";
				// 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
				var cellName = cellNames[index];
				// 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
				var cellId = cellIds[index];
				
				// 반복문에 따라 이너 html 실행 모든 입력칸을 텍스트태그로 바꾼다 단 11행은 셀렉트태그
				if(index === 11){
					select = '<td>'+
					'<select id="'+cellId+'">'+
						'<option value="1">발주중</option>'+
						'<option value="2">발주확정</option>'+
					'</select>'+
					'<td>'
					$(this).html(select);
				} else {
					$(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');
				}
			});// end_find(행 검색 반복문 종료지점)
		
		  	// 발주수정중에 발주추가,수정,삭제 버튼을 비활성화한다
		  	$("#rawOrderAdd").attr('disabled','disabled');
		  	$("#updateRawOr").attr('disabled','disabled');
			$("#deleteRawOr").attr('disabled','disabled');
			
			// 발주수정중에 취소, 저장 버튼입력이 가능하다
			$("#cancelRawOr").removeAttr("disabled");
			$("#saveRawOr").removeAttr("disabled");
			
		} // end if
		
		// 체크박스가 선택되어있지않으면 에러가 발생한다
		else if (selectedCheckbox.length === 0){
			Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
		// 여러개가 체크되어있으면 에러가 발생한다
		} else {
			Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');
		} // end else
	}); // end function
	
	// 취소 버튼 누를 시 실행되는 함수
	$("#cancelRawOr").click(function(){
			
			// 상태가 수정인경우 초기화 작업 실행
		    if(status === "update"){
		    	
			// 테이블 모든행에 따라 반복작업 실행
			$("#datatablesSimple tr").each(function() {
				
			// 행 위치를 얻기위한 변수선언
			var row = $(this);
			
			// 폼태그안의 모든 데이터를 초기값으로 리셋한다
			$("#rawOrderList")[0].reset();
			
				// 각 셀의 값을 원래 상태로 되돌린다(마찬가지로 첫번째 셀은 제외한다)
				row.find("td:not(:first-child)").each(function(index) {
					
					// 텍스트 태그의 값을 찾는다
					var cellValue = $(this).find("input").val();
					
					if ($(this).find("select").length) {
						// 셀렉트 텍스트값(발주중)을 변수에 삽입한다
						var selected = $(this).find("select option:selected").text();
						// 셀렉트가 있는 경우 셀렉트가 선택된 옵션의 텍스트로 변경 한다
						$(this).html(selected);
					}else {
						// 텍스트 태그를 삭제하고 값만 td태그에 삽입한다
						$(this).html(cellValue);
					}
					
				});// end_find(행 검색 반복문 종료지점)
			});// end_each(행 반복문 종료지점)
			
			// 상태가 저장인경우 삭제작업 실행
		    } else if(status === "save"){
		    	// 추가한 행을 삭제한다
		    	$("tbody tr:nth-child(1)").remove();
		    }// end_if
		    
		 	// 취소가 완료되면 취소, 저장 버튼을 비활성화한다
		  	$("#cancelRawOr").attr('disabled','disabled');
		  	$("#saveRawOr").attr('disabled','disabled');
			
			// 다시 발주등록, 수정, 삭제를 할 수 있게 활성화한다
			$("#rawOrderAdd").removeAttr("disabled");
			$("#updateRawOr").removeAttr("disabled");
			$("#deleteRawOr").removeAttr("disabled");
			
	});// end function
	
	// 저장 버튼 누를 시 실행되는 함수
	$("#saveRawOr").click(function() {

			// 상태가 수정인경우 수정 작업 실행
	    	if(status === "update"){
	     	
	     	// 동적으로 생성된 셀렉트태그는 인식되지않으므로 셀렉트 태그의 값은 직접가져온다
	     	var selectValue = $('#raw_status').val();
	     	
	    	// 데이터를 전송하기위한 폼 데이터 직렬화 및 셀렉트 태그 값을 직접 추가한다
	    	var formData = $('#rawOrderList').serialize() + '&' + $.param({ raw_status: selectValue });
	    	
	    	// AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
			if(formTest(formData)){
	    		// ajax 실행
	        	$.ajax({
	            	type: "POST",
	            	url: "${pageContext.request.contextPath}/buyOrder/rawOrderUpdate",
	            	data: formData,
	            	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
	            	success: function(response) {
	            		// 공백을 제거한다
	            		const result = $.trim(response);
	            	 
	                 	if (result == "true") {
	                	 	Swal.fire('발주 수정이 완료되었습니다.', '성공', 'success').then(result => {
						 	 	// 사용자가 확인창을 누르면 실행
	                		 	if(result.isConfirmed){
						 			location.reload(); // 성공 시 새로고침한다						
						 		}// end alert_if
						 });// end alert
	                 } else {
	                	 Swal.fire('발주 수정에 문제가 발생했습니다.', '실패', 'error');
	                 }
	             },
	             error: function () {
	            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
	             }
	         });//endAJAX(물품 수정)
			}// end 정규식검사
			
	      	// 상태가 추가인경우 추가 작업 실행
	    	} else if(status === "save"){
	    		 // 데이터를 전송하기위한 폼 데이터 직렬화
	        	 var formData = $('#rawOrderList').serialize();
	    		 
	    		 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
				 if(formTest(formData)){
	        	 	// ajax 실행
	             	$.ajax({
	                 	type: "POST",
	                 	url: "${pageContext.request.contextPath}/buyOrder/rawOrderInsert",
	                 	data: formData,
	                 	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
	                 	success: function(response) {
	                	 	// 공백을 제거한다
	                	 	const result = $.trim(response);
	                	 
	                     	if (result == "true") {
	                    		 Swal.fire('발주 추가가 완료되었습니다.', '성공', 'success').then(result => {
	    					 	 	// 사용자가 확인창을 누르면 실행
	                    		 	if(result.isConfirmed){
	    					 			location.reload(); // 성공 시 새로고침한다
	    					 		}// end alert_if
	    					 	});// end alert
	                     	} else {
	                    	 	Swal.fire('발주 추가에 문제가 발생했습니다.', '실패', 'error');
	                     	}
	                 	},
	                 	error: function () {
	                	 	Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
	                 	}
	             	});// endAJAX(물품 추가)
	    	 	}// end 정규식검사
	    	 }// end else_if
	});// end function
	
	// 삭제 버튼 누를 시 실행되는 함수
	$("#deleteRawOr").click(function() {
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedRawOrderId']:checked");
		
		// 체크박스가 선택되어있지않다면 에러가 발생한다
		if (selectedCheckbox.length === 0){
			Swal.fire('삭제할 행을 선택해 주십시오.', '실패', 'error');
			return false;
		}
		
		// 체크박스가 선택되어있다면 함수실행
			
			 // 데이터를 전송하기위한 폼 데이터 직렬화
	    	 var formData = $('#rawOrderList').serialize();
			 
	    	 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
			 if(formTest(formData)){
	    	 	// 문제없다면 ajax 실행
	         	$.ajax({
	             	type: "POST",
	             	url: "${pageContext.request.contextPath}/buyOrder/rawOrderDelete",
	             	data: formData,
	             	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
	             	success: function(response) {
	            	 	// 공백을 제거한다
	            	 	const result = $.trim(response);
	            	 
	                 	if (result == "true") {
	                	 	Swal.fire('발주 삭제가 완료되었습니다.', '성공', 'success').then(result => {
	                			// 사용자가 확인창을 누르면 실행
	                		 	if(result.isConfirmed){
						 			location.reload(); // 성공 시 새로고침 한다
						 		}
								
						 	});// end alert
	                 	} else {
	                	 	Swal.fire('발주 삭제에 문제가 발생했습니다.', '실패', 'error');
	                 	}
	             	},
	             	error: function () {
	            	 	Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
	             	}
	        	});// endAJAX(물품 삭제)
			 }// end 정규식검사
			
	});//end function
	// 기능 함수 종료
	
	
	// 이벤트 관련 함수 시작지점
	
	// 원자재 코드를 입력하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='raw_code']", function() {
		window.open('${pageContext.request.contextPath }/product/rawListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function
	
	// 담당자를 입력하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='emp_num']", function() {
		window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function
	
	// 숫자만 입력되야하는 텍스트필드의 이벤트 리스너
	// 인풋 이벤트 대상이 되는 선택자 리스너 변수선언
	var inputSelector = 'input[name="raw_order_amount"]';

	// 숫자 제어 이벤트리스너 함수
	$('tbody').on('input', inputSelector, function() {
		
		  // 이벤트 발생 대상의 밸류값을 가져온다
		  var inputValue = parseInt($(this).val());
		  
		  // 숫자가 아니라면 강제로 0으로 설정한다
		  if (isNaN(inputValue)) {
		    inputValue = 0;
		  }
		  
		  // 0보다 적은 숫자라면 강제로 0으로 설정한다
		  if (inputValue < 0) {
		    inputValue = 0;
		  } 
		  // 밸류값을 업데이트한다
		  $(this).val(inputValue);
	});// end function
	
	// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
	$('input[name="selectedAllRawOrderId"]').click(function() {
	    // 모든 selectedProId 체크박스의 상태를 selectedAllRawOrderId와 동일하게 설정한다
	    // $this로 AllProId의 상태를 가져온다
	    $('input[name="selectedRawOrderId"]').prop('checked', $(this).prop('checked'));
	});// end function

	//엑셀 버튼 누를 시 실행되는 함수
	$("#excelRawOrder").click(function(){
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedRawOrderId']:checked");
		
		if (selectedCheckbox.length === 0) {
			Swal.fire('엑셀파일로 다운받을 행을 선택해주십시오', '', 'info');
			return false;
		}
		
		// 엑셀에 데이터를 삽입하기위한 배열 변수선언
		var excelData = [];
		
		// 엑셀의 헤더가 되는 값을 삽입하기위한 변수선언
		var headers = [];
		
			// table의 th태그만큼 반복문을 실행하되 첫번째 체크박스행은 제외한다
			$("#datatablesSimple th:not(:first)").each(function(){
				// 헤더에 텍스트값(th) 삽입
				headers.push($(this).text());
			});
			// 엑셀 데이터 변수에 헤더값을 삽입한다
			excelData.push(headers);
		
			// 체크박스가 체크된 행 만큼 엑셀 행삽입 반복문을 시행한다
			selectedCheckbox.each(function () {
			
				// 엑셀의 행값을 담기위한 배열 변수선언
		    	var row = [];
				// tr태그를 찾아서 반복문을 실행하되 첫번째 td태그(체크박스)는 제외한다
		    	$(this).closest("tr").find("td:not(:first-child)").each(function () {
		    		// 행 변수에 테이블 행(td)태그의 텍스트 값을 삽입한다
		        	row.push($(this).text());
		    	});
				// 엑셀 데이터 변수에 행값을 삽입한다
		   		excelData.push(row);
			});
			
			// 워크북을 생성한다
			var workbook = XLSX.utils.book_new();
			// 엑셀 데이터(헤더, 행)값을 시트로 변환한다
			var worksheet = XLSX.utils.aoa_to_sheet(excelData);
			// 데이터와 워크북 시트를 워크북에 추가한다
			XLSX.utils.book_append_sheet(workbook, worksheet, "발주 리스트");
			
			// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
			var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
			saveAs(
				new Blob([workbookOutput], { type: "application/octet-stream" }),
				"발주 리스트.xlsx"
			);
		
	});// end function
	// 이벤트 관련 함수 종료
	
	// 데이트피커 초기화 관련함수
	
	// 동적 생성 태그 데이트 피커 제어 함수
	$(document).on('focus', '#in_plan_date', function () {
    	$(this).datepicker({
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
    	    minDate: new Date()
    	});// end 데이트피커
	});// end function
	
	// 기존 태그 데이트 피커 제어 함수
    // 발주일자 시작점
	$("#rawOrderBegin").datepicker({
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
    onSelect: function(selectedDate) {
    	
    	// 발주일자 끝점을 초기화한다
    	$("#rawOrderEnd").datepicker({
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
        minDate: selectedDate
    	}); // end 끝점 데이트피커
    	
    	// 발주일자 끝점을 선택할 수 있게한다
    	$("#rawOrderEnd").removeAttr("disabled");
    	
    }// end OnSelect
	
	}); // end 데이트피커
	
	// 입고예정일 시작점
	$("#rawOrderInBegin").datepicker({
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
    onSelect: function(selectedDate) {
    	
    	// 입고예정일 끝점을 초기화한다
    	$("#rawOrderInEnd").datepicker({
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
        minDate: selectedDate
    	}); // end 끝점 데이트피커
    	
    	// 발주일자 끝점을 선택할 수 있게한다
    	$("#rawOrderInEnd").removeAttr("disabled");
    	
    }// end OnSelect
	
	}); // end 데이트피커
	
	
});// end 함수
</script>
    </body>
</html>
