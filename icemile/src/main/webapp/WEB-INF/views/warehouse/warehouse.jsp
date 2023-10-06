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
	        <!-- 로그인이 안되어 있을시 로그인 페이지로 바로가기 -->
            <c:if test="${empty sessionScope.emp_num}"> 
            <c:redirect url="/member/login" />
            </c:if>     
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">  
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
		<form id="warehousList">	
			<main>
				<!-- 내용들어가는곳 -->
				<div class="container-fluid px-4">
					<h1 class="mt-4">창고관리</h1>					
						<ol class="breadcrumb mb-4">
						</ol>
						<div class="bnt">
						
						<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
							<input type="button" value="창고추가" id="whAdd">
							<span>&nbsp;</span>
							<input type="button" value="수정" id="updateWh">
							<span>&nbsp;</span>
							<input type="button" value="삭제" id="deleteWh">
							<span>&nbsp;</span>
							<input type="button" value="취소" id="cancelWh" disabled>
							<span>&nbsp;</span>
							<input type="button" value="저장" id="saveWh" disabled>
						</c:if>
						
						</div>

						<div class="card mb-4">
							<div class="card-body">
                                <!--location.reload() 함수를 호출하여 현재 웹 페이지를 다시 로드하도록 지정합니다. -->
								<input type="button" name="allList" value="전체목록" onclick="location.reload();">
								<select id="category">
									<option value="1">코드</option>
									<option value="2">이름</option>
									<option value="3">종류</option>
									<option value="4">위치</option>
									<option value="5">가용상태</option>
									<option value="6">담당자</option>
								</select> 
								<input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content"> 
								<input type="button" name="search" value="조회" onclick="warehouseSearch()">
								
								<table id="datatablesSimple">
									<thead>
										<tr>
                                            <!-- data-sortable="false":데이터를 테이블에서 정렬할수 있는지 여부를 나타내는것 false로 설정되어 있으므로 이 열은 정렬할수 없는 열 -->
                                            <!-- name="selectedAllProId": 이 속성은 입력 요소에 이름을 부여합니다. 이 경우 "selectedAllProId"로 설정되어 JavaScript나 서버 측 코드에서 이 체크박스를 식별할 수 있습니다. -->
										    <th data-sortable="false"><input type="checkbox" name="selectedAllProId"></th>
											<th>창고 코드</th>
											<th>창고 이름</th>
											<th>창고 종류</th>
											<th>창고 위치</th>
											<th>창고 전화번호</th>
											<th>창고 가용상태</th>
											<th>완제품 코드</th>
											<th>원자재 코드</th>
											<th>창고 담당자</th>
											<th>비고</th>
										</tr>
									</thead>

									<tbody >
										<c:forEach var="WareHouseDTO" items="${houseList}">
											<tr>
                                                <!--체크박스를 선택하면 wh_code가 서버로 이동하면서 checkbox의 값이 지정되어서 체크박스가 어떤행을 선택하게 되는지 알수 있다 -->
											    <td><input type="checkbox"  name="selectedProId"  value="${WareHouseDTO.wh_code}"></td>
												<td>${WareHouseDTO.wh_code}</td>
												<td>${WareHouseDTO.wh_name}</td>
												<td>${WareHouseDTO.wh_type}</td>
												<td>${WareHouseDTO.wh_location}</td>
												<td>${WareHouseDTO.wh_phone}</td>
                                                 
												<c:choose>
													<c:when test="${WareHouseDTO.wh_status == 1}">
														<td>Y</td>
													</c:when>
													<c:when test="${WareHouseDTO.wh_status == 2}">
														<td>N</td>
													</c:when>
												</c:choose>
												
												<td>${WareHouseDTO.prod_code}</td>
												<td>${WareHouseDTO.raw_code}</td>
												<td>${WareHouseDTO.emp_num}</td>
												<td>${WareHouseDTO.wh_note}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								</form>
								
								</div>
							</div>
							
							  <input type="button" value="엑셀파일다운" id="excelProd">
							  
						</div>
				<!-- 내용 들어가는 곳 -->
			</main>

			<!-- 푸터 -->
			<jsp:include page="../include/footer.jsp"></jsp:include>
			<!-- 푸터 -->

		</div>
	</div>
	
<!-- 모달 alert를 위한 sweetalert 호출 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- J쿼리 호출 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	    <script src="../resources/js/warehouse_im.js"></script>
<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script>
//추가, 수정 을 구분하기위한 전역변수선언
var status = "";

// 함수 시작지점:formTest라는 함수가 정의 된다.
$(document).ready(function() {
	
	// 정규식 제어함수
	// formTest 함수를 정의합니다. 이 함수는 formData라는 매개변수를 받으며, 이는 폼 데이터를 나타냅니다.
	function formTest(formData) {

    // 결과값 반환을 위한 변수선언
    // 결과값을 저장할 변수 result를 선언하고 초깃값을 true로 설정합니다. 이 변수는 나중에 함수에서 결과를 저장하는 데 사용됩니다.
    var result = true;

    // 반복문 제어를 위한 변수선언
    // 반복문을 제어하기 위한 변수 continueFor를 선언하고 초깃값을 true로 설정합니다. 이 변수는 반복문의 실행 여부를 제어하는 데 사용됩니다.
    var continueFor = true;

  // &을 기준으로 끊고 배열 변수를 선언한다 이후 배열에 따라 반복문을 시행한다
  // 기준 데이터는 아래와같다 "content=&type=&prod_name="...
  // formData 문자열을 & 문자를 기준으로 분할하여 배열 formArray에 저장합니다. 
  // 이렇게 하면 폼 데이터가 각 필드와 값의 조합으로 구분됩니다.=>필드와 값의 조합으로 구분된다는건 무슨말인가?
  var formArray = formData.split("&");

  // 사용자에게 알려주기위해 영문 키값을 한글로 매핑한다
  // 매핑을 위한 JSON 변수선언
  var koreanNames = {
	"type": "품목종류(코드)",
	"wh_code": "창고(코드)",
	"wh_name": "창고이름",
	"wh_type": "창고 종류",
	"wh_location": "창고 위치",
	"wh_phone": "창고 전화번호",
	"prod_code": "완제품 코드",
	"raw_code": "원자재 코드",
	"emp_num": "담당자",
	"wh_status": "가용상태",
};
  
// 반복문을 사용하여 각 항목을 검사한다
// 반복문을 사용하여 formArray 배열에 있는 각 항목을 검사합니다. 
// 이 배열은 formData를 & 문자로 분할한 결과를 저장하고 있습니다.
	for (var i = 0; i < formArray.length; i++) {
	  
	  // 키값의 기준점은 = 이된다
	  // 이 배열은 필드 이름과 해당 필드의 값으로 분리된 정보를 담고 있다.
	  var keyValue = formArray[i].split("=");
	  
	  // 키변수에 키값을 담는다
	  // keyValue 배열의 첫 번째 요소는 필드 이름을 나타내므로, 이 값을 key 변수에 저장합니다.
	  // decodeURIComponent 함수를 사용하여 필드 이름을 디코딩합니다.
	  var key = decodeURIComponent(keyValue[0]);
	  
	  // 밸류 변수에 키의 리터럴 값을 담는다
	  // 배열의 두 번째 요소는 필드의 값이므로, 이 값을 value 변수에 저장합니다.
	  // 마찬가지로 decodeURIComponent 함수를 사용하여 필드의 값을 디코딩합니다.
	  var value = decodeURIComponent(keyValue[1]);
	  
	  // 비고와 검색칸은 비어있어도 상관없음
	  // 검사에서 제외사항
	  if ((key === "wh_note"|| key === "content") && value === ""){
		  continue;
	  }
	  
	  //이 부분의 코드는 폼 필드의 값이 비어있을 때 실행되며,사용자에게 오류 메세지를 표시하고'result'값을 'false'로 설정하는 역할을 합니다.
	  if (value === "") {
	    // 값이 비어 있는 경우 결과값은 false가 된다
	    Swal.fire(koreanNames[key]+' 값을 입력해주십시오.', '', 'info');
	    //필드 값이 비어있는 경우 'result'변수를 'false'로 설정한다 이렇게 하면 함수가 이후에 false값을 반환
	    result = false;
	    break; // 비어있는 필드를 발견하면 반복문을 종료하고 false를 반환한다
	  }
	  
	  // 중복값 검사수행
	  if (key === "wh_code" && value !== "") {
		  // ajax 호출
		  $.ajax({
			  	type: "GET",
		        url: "${pageContext.request.contextPath}/warehouse_ajax/searchWhcode",
		        //data 매개변수에 wh_code필드의 값을 전달한다.
		        data: {"wh_code": value},
		        //ajax요청이 성공하면 이 함수가 실행됩니다.서버에서 반환된 응답 데이터가 response매개 변수로 전달된다.
		        success: function(response) {
		        	// 서버 응답한 response에서 앞 뒤로 공백을 제거한다
          		const resultAjax = $.trim(response);
          		
		        	//서버 응답 데이터가 false인 경우,중복 값이 발견된 것으로 판단한다
		        	if(resultAjax == "false"){
		        		result = false;
		        		continueFor = false;
		        		Swal.fire('이미 존재하는 코드입니다 다른 이름을 입력하십시오', '', 'info');
		        	} 
		        },//success 콜백함수 종료지점
		        error: function () {
		        	 result = false;
	        		 continueFor = false;
	            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
	            }
		  });// ajax
		  
		  // 중복값이 있다면 반복문을 종료한다
		  if(!continueFor){
			  break;
		  }
	 } // end 중복값 검증

	}// end for
	
	// 결과값 반환
	return result;
	
}// end function
// 정규식 제어함수 끝

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////추가///////////////////////////////////////////////////////////////
$("#whAdd").click(function(){

// tr에 값을 삽입하기위한 변수선언
var row = "<tr>";

//상태를 저장으로 변경
status = "save";

//체크박스
row += "<td>";
row += '<input type="checkbox" name="selectedLineCo" disabled>';
row += "</td>";

//창고 코드 
row += "<td>";
row += "<select name='type' id='type' required class='#datatablesSimple tr'>";
row += "<option value='C'>품목종류를 선택하십시오</option>";
row += "<option value='R'>원자재</option>";
row += "<option value='P'>완제품</option>";
row += "</select>";
row += "</td>";

//창고 이름
row += "<td>";
row += "<input type='text' name='wh_name' id='wh_name' size='5' required class='#datatablesSimple tr'>";
row += "</td>";

//창고 종류 
row += "<td>";
row += "<select name='wh_type' id='wh_type' required class='#datatablesSimple tr'>";
row += "<option value='1'>--선택--</option>";
row += "<option value='R'>R:원자재</option>";
row += "<option value='p'>p:완재품</option>";
row += "</select>";
row += "</td>";

//창고 위치
row += "<td>";
row += "<input type='text' name='wh_location' id='wh_location' size='5' required class='#datatablesSimple tr'>";
row += "</td>";

//창고 전화번호
row += "<td>";
row += "<input type='text' name='wh_phone' id='wh_phone' size='5' required class='#datatablesSimple tr'>";
row += "</td>";

//가용상태
row += "<td>";
row += "<select name='wh_status' id='wh_status'>";
row += "<option value='1'>Y</option>";
row += "<option value='2'>N</option>";
row += "</select>";
row += "</td>";

//완재품 코드
row += "<td>";
row += "<input type='text' name='prod_code' id='prod_code' size='5' required class='#datatablesSimple tr'>"
row += "</td>";

//원자재 코드
row += "<td>";
row += "<input type='text' name='raw_code' id='raw_code' size='5' required class='#datatablesSimple tr'>"
row += "</td>";

//담당자
row += "<td>";
row += "<input type='text' name='emp_num' id='emp_num' size='5' required class='#datatablesSimple tr'>"
row += "</td>";

//비고
row += "<td>";
row += "<input type='text' name='wh_note' id='wh_note' size='5' class='#datatablesSimple tr'>"
row += "</td>";

//상단에 할당한 <tr>태그 닫아 주기
row += "</tr>";

// 생성한 <tr> 요소를 tbody에 추가
//:nth-child(1) 선택자는 <tbody> 내의 첫 번째 자식 요소를 선택하는데 사용됩니다.
// before($tr) 함수를 호출하여 $tr 요소를 선택한 첫 번째 자식 요소 앞에 추가합니다.
$('tbody tr:nth-child(1)').before(row);

// 품목추가중에 품목추가,수정,삭제 버튼을 비활성화한다
$("#whAdd").attr('disabled','disabled');
$("#updateWh").attr('disabled','disabled');
$("#deleteWh").attr('disabled','disabled');

// 품목추가중에 취소, 저장 버튼입력이 가능하다
// disabled(비활성화) 속성 제거(removeAttr)
$("#cancelWh").removeAttr("disabled");
$("#saveWh").removeAttr("disabled");
});// end function


//////////////////////////////////////////////수정/////////////////////////////////////////////////////////////////
$("#updatewh").click(function(){
	
	// 상태를 업데이트로 변경한다
	status = "update";
	
	// 체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='selectedProId']:checked");
	
	// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	// === 조항과 우항이 정확이 일치하는가? 
	if (selectedCheckbox.length === 1) {
		
		// 텍스트태그를 추가할 tr태그를 선택한다
		// JavaScript에서 선택한 체크박스 또는 요소(selectedCheckbox)가 속한 가장 가까운 <tr>(테이블 행) 요소를 찾아 row 변수에 할당하는 코드입니다.

        // selectedCheckbox: 이 변수는 JavaScript로 선택된 체크박스 또는 요소를 나타냅니다.

        // .closest("tr"): closest() 메서드는 선택한 요소에서 시작하여 가장 가까운 상위 조상 요소를 찾는 메서드입니다.
        // 여기서는 "tr"을 인수로 전달하여 가장 가까운 <tr>(테이블 행) 요소를 찾습니다.
        
		var row = selectedCheckbox.closest("tr");
		
		// input type의 name 값 지정
		//
		var cellNames = [
			"prod_code", 
			"prod_name", 
			"prod_type", 
			"prod_unit",
			"prod_amount",
			"prod_price",
			"prod_exp",
			"deal_code",
			"wh_code",
			"prod_note"
		];
		
		// input type의 id 값 지정
		var cellIds = [
			"prod_code", 
			"prod_name", 
			"prod_type", 
			"prod_unit",
			"prod_amount",
			"prod_price",
			"prod_exp",
			"deal_code",
			"wh_code",
			"prod_note"
		];
		
		
		// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
		row.find("td:not(:first-child)").each(function(index) {
			
			// 기존 텍스트 값을 변수에 저장한다
			var cellValue = $(this).text();
			// 삼항연산자 0번째 행(코드)와 2번째행(종류)는 리드온리로 변경할 수 없다
			var cellOption = index === 0 || index === 2 ? "readonly" : "";
			// 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
			var cellName = cellNames[index];
			// 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
			var cellId = cellIds[index];
			
			// 반복문에 따라 이너 html 실행 모든 입력칸을 텍스트태그로 바꾼다
			$(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');
		});// end_find(행 검색 반복문 종료지점)
	
		// 품목수정중에 품목추가,수정,삭제 버튼을 비활성화한다
	  	$("#productAdd").attr('disabled','disabled');
	  	$("#updateProd").attr('disabled','disabled');
		$("#deleteProd").attr('disabled','disabled');
		
		// 품목수정중에 취소, 저장 버튼입력이 가능하다
		$("#cancelProd").removeAttr("disabled");
		$("#saveProd").removeAttr("disabled");
		
	} // end if
	
	// 체크박스가 선택되어있지않으면 에러가 발생한다
	else if (selectedCheckbox.length === 0){
		Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
	// 여러개가 체크되어있으면 에러가 발생한다
	} else {
		Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');
	} // end else
}); // end function


///////////////////////////////////////////////////////////저장//////////////////////////////////////////////////// 
$("#saveWh").click(function() {
	
		// 상태가 수정인경우 수정 작업 실행
    	if(status === "update"){
    		
    	// 데이터를 전송하기위한 폼 데이터 직렬화
    	// serialize()는 jQuery에서 제공하는 메서드로, HTML 폼(form) 요소 내의 입력 필드들의 값을 쿼리 문자열로 직렬화합니다
    	//warehouseName=Warehouse+1&location=Location+A&capacity=1000
    	var formData = $('#warehousList').serialize();
    	
    	// AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
		if(formTest(formData)){
    		// ajax 실행
        	$.ajax({
            	type: "POST",
            	url: "${pageContext.request.contextPath}/warehouse_ajax/whUpdate",
            	data: formData,
            	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
            	success: function(response) {
            		// 공백을 제거한다
            		//const를 사용하여 선언된 변수는 상수로 취급되며, 한 번 할당된 값을 변경할 수 없습니다. 
            		const result = $.trim(response);
            	 
                 	if (result == "true") {
                 		//.then() 함수를 사용하여 사용자가 알림 창을 확인할 때 실행할 콜백 함수를 정의할 수 있습니다
                	 	Swal.fire('창고 수정이 완료되었습니다.', '성공', 'success').then(result => {
					 	 	// 사용자가 확인창을 누르면 실행
                		 	if(result.isConfirmed){
					 			location.reload(); // 성공 시 새로고침한다
					 		
						 		// 저장이 완료되면 취소, 저장 버튼을 비활성화한다
						  		$("#cancelwh").attr('disabled','disabled');
						  		$("#savewh").attr('disabled','disabled');
							
								// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
								$("#whAdd").removeAttr("disabled");
								$("#updatewh").removeAttr("disabled");
								$("#deletewh").removeAttr("disabled");
					 		}// end alert_if
					 });// end alert
                 } else {
                	 Swal.fire('창고 수정에 문제가 발생했습니다.', '실패', 'error');
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
    		 // serialize()는 jQuery에서 제공하는 메서드로, HTML 폼(form) 요소 내의 입력 필드들의 값을 쿼리 문자열로 직렬화합니다
    	     //warehouseName=Warehouse+1&location=Location+A&capacity=1000
        	 var formData = $('#warehousList').serialize();
    		 
    		 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
			 if(formTest(formData)){
        	 	// ajax 실행
             	$.ajax({
                 	type: "POST",
                 	url: "${pageContext.request.contextPath}/warehouse_ajax/whInsert",
                 	data: formData,
                 	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
                 	success: function(response) {
                	 	// 공백을 제거한다
                	 	const result = $.trim(response);
                	 
                     	if (result == "true") {
                     		 //.then() 함수를 사용하여 사용자가 알림 창을 확인할 때 실행할 콜백 함수를 정의할 수 있습니다
                    		 Swal.fire('창고 추가가 완료되었습니다.', '성공', 'success').then(result => {
    					 	 	// 사용자가 확인창을 누르면 실행
                    		 	if(result.isConfirmed){
    					 			location.reload(); // 성공 시 새로고침한다
    					 		
    						 		// 저장이 완료되면 취소, 저장 버튼을 비활성화한다
    						  		$("#cancelwh").attr('disabled','disabled');
    						  		$("#savewh").attr('disabled','disabled');
    							
    								// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
    								$("#whAdd").removeAttr("disabled");
    								$("#updatewh").removeAttr("disabled");
    								$("#deletewh").removeAttr("disabled");
    							
    					 		}// end alert_if
    					 	});// end alert
                     	} else {
                    	 	Swal.fire('창고 추가에 문제가 발생했습니다.', '실패', 'error');
                     	}
                 	},
                 	error: function () {
                	 	Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
                 	}
             	});// endAJAX(물품 추가)
    	 	}// end 정규식검사
    	 }// end else_if
});// end function



});//document
</script>
</body>
</html>
