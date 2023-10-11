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
<form id="proOrderList">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">수주</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
							<input type="button" value="수주추가" id="proOrderAdd">
							<input type="button" value="수정" id="updateProOr">
							<input type="button" value="삭제" id="deleteProOr">
							<input type="button" value="취소" id="cancelProOr" disabled>
							<input type="button" value="저장" id="saveProOr" disabled>
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
                            
                            수주일자
                            <input type="text" name="proOrderBegin" id="proOrderBegin" readonly> ~
                            <input type="text" name="proOrderEnd" id="proOrderEnd" readonly disabled>
                            <br>
                            
                            납품예정일
                            <input type="text" name="proOrderOutBegin" id="proOrderOutBegin" readonly> ~
                            <input type="text" name="proOrderOutEnd" id="proOrderOutEnd" readonly disabled>
                            <br>
                            
                            진행상태
							<select id="status">
  								<option value="">전체</option>
  								<option value="1">대기중</option>
  								<option value="2">생산중</option>
  								<option value="3">생산완료</option>
  								<option value="4">납품완료</option>
							</select>
							<input type="text" name="content" size=60 placeholder="담당자 혹은 지점코드를 입력하십시오"
								id="content">
							<input type="button" name="search" value="조회" onclick="proOrderSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllProOrderId"></th>
                                        	<th>수주코드</th>
                                            <th>담당자</th>
                                            <th>지점코드</th>
                                            <th>완제품코드</th>
                                            <th>완제품명</th>
                                            <th>완제품가격</th>
                                            <th>주문량</th>
                                            <th>수주금액</th>
                                            <th>수주 일자</th>
                                            <th>납품 예정일</th>
                                            <th>진행 상황</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                        	<td data-sortable="false"><input type="checkbox" name="selectedProOrderId"></td>
                                        	<td>order_code</td>
                                            <td>emp_num</td>
                                            <td>branch_code</td>
                                            <td>prod_code</td>
                                            <td>prod_name</td>
                                            <td>prod_price</td>
                                            <td>order_amount</td>
                                            <td>order_price</td>
                                            <td>order_date</td>
                                            <td>out_plan_date</td>
                                            <td>생산중</td>
                                        </tr>
                                    </tbody>
                                </table>
</form>
                            </div>
                        </div>
                        <input type="button" value="엑셀파일다운" id="excelProOrder">
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
// 추가, 삭제, 수정등 기능 구현 함수 시작지점
	
	// 추가 버튼 누를 시 실행되는 함수
	$("#proOrderAdd").click(function(){
		 // 상태를 저장으로 변경
		 status = "save";
		 
		 // tr에 값을 삽입하기위한 변수선언
		 var $tr = $('<tr>');
		 
		 //tr 에 내용추가
	  	 $tr.append(
	  		'<td><input type="checkbox" name="selectedProOrderId" disabled></td>',
	  		'<td><input type="text" id="order_code" name="order_code" placeholder="(자동으로 부여)" readonly></td>',
	  		'<td><input type="text" id="emp_num" name="emp_num" readonly></td>',
	  		'<td><input type="text" id="branch_code" name="branch_code" readonly></td>',
	  		'<td><input type="text" id="prod_code" name="prod_code" readonly></td>',
	  		'<td><input type="text" id="prod_name" name="prod_name" readonly></td>',
	  		'<td><input type="text" id="prod_price" name="prod_price" readonly></td>',
	  		'<td><input type="text" id="order_amount" name="order_amount" value ="0"></td>',
	  		'<td><input type="text" id="order_price" name="order_price" placeholder="(자동으로 계산됨)" readonly></td>',
	  		'<td><input type="text" id="order_date" name="order_date" value="'+getDate()+'"></td>',
	  		'<td><input type="text" id="out_plan_date" name="out_plan_date" readonly></td>',
	  		'<td><input type="text" id="order_status" name="order_status" value="대기중" readonly></td>'
	  		);
	  	// 생성한 <tr> 요소를 tbody에 추가
	  	$('tbody tr:nth-child(1)').before($tr);
	  	
	  	// 수주추가중에 수주추가,수정,삭제 버튼을 비활성화한다
	  	$("#proOrderAdd").attr('disabled','disabled');
	  	$("#updateProOr").attr('disabled','disabled');
		$("#deleteProOr").attr('disabled','disabled');
		
		// 수주추가중에 취소, 저장 버튼입력이 가능하다
		$("#cancelProOr").removeAttr("disabled");
		$("#saveProOr").removeAttr("disabled");
		
	});// end function
	
	// 수정 버튼 누를 시 실행되는 함수
	$("#updateProOr").click(function(){
		
		// 상태를 업데이트로 변경한다
		status = "update";
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedProOrderId']:checked");
		
		// 진행 상황을 확인하기위한 변수선언
		var tdText = selectedCheckbox.closest("tr").find('td:eq(11)').text();
		console.log("상태확인"+tdText);
		// 납품완료 상태라면 에러가 발생한다
		if(tdText === "납품완료"){
			Swal.fire('납품완료된 상태에서는 수정 할 수 없습니다.', '실패', 'error');
			return false;
		}
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			
			// 텍스트태그를 추가할 tr태그를 선택한다
			var row = selectedCheckbox.closest("tr");
			
			// input type의 name 값 지정
			var cellNames = [
				"order_code",
				"emp_num", 
				"branch_code", 
				"prod_code", 
				"prod_name",
				"prod_price",
				"order_amount",
				"order_price",
				"order_date",
				"out_plan_date",
				"raw_order_date",
				"order_status"
			];
			
			// input type의 id 값 지정
			var cellIds = [
				"order_code",
				"emp_num", 
				"branch_code", 
				"prod_code", 
				"prod_name",
				"prod_price",
				"order_amount",
				"order_price",
				"order_date",
				"out_plan_date",
				"raw_order_date",
				"order_status"
			];
			
			// 셀렉트 태그를 위한 변수선언
			var select = "";
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
			row.find("td:not(:first-child)").each(function(index) {
				
				// 기존 텍스트 값을 변수에 저장한다
				var cellValue = $(this).text();
				// 삼항연산자 6번째 행(주문량)및 1번쨰 행(진행상태)를 제외하고는 리드온리로 변경할 수 없다
				var cellOption = index === 6 || index === 10 ? "" : "readonly";
				// 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
				var cellName = cellNames[index];
				// 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
				var cellId = cellIds[index];
				
				// 반복문에 따라 이너 html 실행 모든 입력칸을 텍스트태그로 바꾼다 단 10행은 셀렉트태그
				// 단 10번째 행은 셀렉트태그로 하며, tdText(기존의 진행상황값)에 따라 selected 옵션을 삼항연산자 조건문으로 부여한다
				if(index === 10){
					select = '<td>'+
					'<select id="'+cellId+'">'+
						'<option value="1" ' + (tdText === '대기중' ? 'selected' : '') + '>대기중</option>'+
						'<option value="2" ' + (tdText === '생산중' ? 'selected' : '') + '>생산중</option>'+
						'<option value="3" ' + (tdText === '생산완료' ? 'selected' : '') + '>생산완료</option>'+
						'<option value="4" ' + (tdText === '납품완료' ? 'selected' : '') + '>납품완료</option>'+
					'</select>'+
					'<td>'
					$(this).html(select);
				} else {
					$(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');
				}
			});// end_find(행 검색 반복문 종료지점)
		
			// 수주추가중에 수주추가,수정,삭제 버튼을 비활성화한다
		  	$("#proOrderAdd").attr('disabled','disabled');
		  	$("#updateProOr").attr('disabled','disabled');
			$("#deleteProOr").attr('disabled','disabled');
			
			// 수주추가중에 취소, 저장 버튼입력이 가능하다
			$("#cancelProOr").removeAttr("disabled");
			$("#saveProOr").removeAttr("disabled");
			
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
	$("#cancelProOr").click(function(){
			
			// 상태가 수정인경우 초기화 작업 실행
		    if(status === "update"){
		    	
			// 테이블 모든행에 따라 반복작업 실행
			$("#datatablesSimple tr").each(function() {
				
			// 행 위치를 얻기위한 변수선언
			var row = $(this);
			
			// 폼태그안의 모든 데이터를 초기값으로 리셋한다
			$("#proOrderList")[0].reset();
			
				// 각 셀의 값을 원래 상태로 되돌린다(마찬가지로 첫번째 셀은 제외한다)
				row.find("td:not(:first-child)").each(function(index) {
					
					// 텍스트 태그의 값을 찾는다
					var cellValue = $(this).find("input").val();
					
					if ($(this).find("select").length) {
						// 셀렉트 텍스트값(발주중)을 변수에 삽입한다
						var selected = $(this).find("select option:selected").text();
						// 셀렉트가 있는 경우 셀렉트가 선택된 옵션의 텍스트로 변경 한다(어짜피 발주확정 상태 에서는 수정할수없으므로 항시 발주중이된다)
						// 만약 발주확정 상태에서도 수정하게 하려면 삼항연산자로 추가 수정등에 selected옵션을 부여해야한다 
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
		  	$("#cancelProOr").attr('disabled','disabled');
		  	$("#saveProOr").attr('disabled','disabled');
			
			// 다시 수주등록, 수정, 삭제를 할 수 있게 활성화한다
			$("#proOrderAdd").removeAttr("disabled");
			$("#updateProOr").removeAttr("disabled");
			$("#deleteProOr").removeAttr("disabled");
			
	});// end function
	
// 이벤트 관련 함수 시작지점
	
	// 완제품 코드를 선택하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='prod_code']", function() {
		window.open('${pageContext.request.contextPath }/product/rawListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function
	
	// 담당자를 선택하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='emp_num']", function() {
		window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function
	
	// 지점코드를 선택하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='branch_code']", function() {
		window.open('${pageContext.request.contextPath }/buy/buyListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function
	
	// 숫자만 입력되야하는 텍스트필드의 이벤트 리스너
	// 인풋 이벤트 대상이 되는 선택자 리스너 변수선언
	var inputSelector = 'input[name="order_amount"]';

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
	
	// 금액 계산
	$(document).on("input", "#order_amount", function() {
		
		// 주문량을 가져온다
		var order_amount = parseInt($(this).val());
		// 단가(완제품가격)를 가져온다
		var prod_price = parseInt($("#prod_price").val());
		// 수주량과 단가를 계산한다
		var result = (order_amount * prod_price) * 1.2;
		
		// 밸류값을 최종가격으로 변경한다
		if(isNaN(result) || result == 0){
			$("#order_price").val("");
		} else {
			$("#order_price").val(result);
		}
		
	});
	
	// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
	$('input[name="selectedAllProOrderId"]').click(function() {
	    // 모든 selectedProId 체크박스의 상태를 selectedAllRawOrderId와 동일하게 설정한다
	    // $this로 AllProId의 상태를 가져온다
	    $('input[name="selectedProOrderId"]').prop('checked', $(this).prop('checked'));
	});// end function

	//엑셀 버튼 누를 시 실행되는 함수
	$("#excelProOrder").click(function(){
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedProOrderId']:checked");
		
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
			XLSX.utils.book_append_sheet(workbook, worksheet, "수주 리스트");
			
			// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
			var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
			saveAs(
				new Blob([workbookOutput], { type: "application/octet-stream" }),
				"수주 리스트.xlsx"
			);
		
	});// end function
	
	// 폼제출을 막고 엔터키로 조회가 가능하게 하는 함수
	// 텍스트타입 제출을 막음
	$('input[type="text"]').keydown(function() {
		// 엔터키 이벤트 발생을 확인한다
		if (event.keyCode === 13) {
			// 폼 태그 제출을 막는다
	 		event.preventDefault();
			// 검색 함수를 실행한다
// 	 		rawOrderSearch();
			// 검색입력창을 초기화한다
	 		$('#content').val("");
		}// end if
	});// end function
	
	// 이벤트 관련 함수 종료
	
	// 데이트피커 초기화 관련함수
	
	// 동적 생성 태그 데이트 피커 제어 함수(수주일자 및 납품예정일)
	$(document).on('focus', '#order_date, #out_plan_date', function () {
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
    // 수주일자 시작점
	$("#proOrderBegin").datepicker({
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
    	
    	// 수주일자 끝점(데이트피커)을 초기화하고 동적변경을 위해 데이트피커의 초기값을 변수에 담는다
    	var mySecondDatePicker = $("#proOrderEnd").datepicker({
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
    	
    	// 수주일자 끝점을 선택할 수 있게한다
    	$("#proOrderEnd").removeAttr("disabled");
    	// 수주일자 끝점을 초기화한다
    	$("#proOrderEnd").val("");
    	// 동적으로 minDate 를 업데이트한다
    	mySecondDatePicker.datepicker("option", "minDate", selectedDate);
    	
    }// end OnSelect
	
	}); // end 데이트피커
	
	// 납품예정일 시작점
	$("#proOrderOutBegin").datepicker({
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
    	
    	// 납품예정일 끝점(데이트피커)을 초기화하고 동적변경을 위해 데이트피커의 초기값을 변수에 담는다
    	var mySecondDatePicker = $("#proOrderOutEnd").datepicker({
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
    	
    	// 납품예정일 끝점을 선택할 수 있게한다
    	$("#proOrderOutEnd").removeAttr("disabled");
    	// 납품예정일 끝점을 초기화한다
    	$("#proOrderOutEnd").val("");
    	// 동적으로 minDate 를 업데이트한다
    	mySecondDatePicker.datepicker("option", "minDate", selectedDate);
    	
    }// end OnSelect
	
	}); // end 데이트피커
});
</script>
    </body>
</html>
