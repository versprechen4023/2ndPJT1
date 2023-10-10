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
			<form id="outMaterialList">
				<main>
					<!-- 내용들어가는곳 -->
					<div class="container-fluid px-4">
						<h1 class="mt-4">출고</h1>
						<ol class="breadcrumb mb-4">
						</ol>
						<div class="bnt">

							<c:if
								test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
								<input type="button" value="추가" id="mtAdd">
								<span>&nbsp;</span>
								<input type="button" value="수정" id="updateMt">
								<span>&nbsp;</span>
								<input type="button" value="삭제" id="deleteMt">
								<span>&nbsp;</span>
								<input type="button" value="취소" id="cancelMt" disabled>
								<span>&nbsp;</span>
								<input type="button" value="저장" id="saveMt" disabled>
							</c:if>

						</div>

						<div class="card mb-4">
							<div class="card-body">

								<input type="button" name="allList" value="전체목록"
									onclick="location.reload();"> <select id="category">
									<option value="out_code">출고 지점</option>
									<option value="out_wh_code">창고코드</option>
									<option value="order_code">수주코드</option>
									<option value="out_status">담당자</option>
								</select> <input type="text" name="content" size=60
									placeholder="검색어를 입력하세요" id="content"> <input
									type="button" name="search" id="inputmtSearch" value="조회">

								<table id="datatablesSimple">
									<thead>
										<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
										<tr>
											<th data-sortable="false"><input type="checkbox"
												name="selectedAllProId"></th>
											<th>출고 지점</th>
											<th>창고 코드</th>
											<th>수주 코드</th>
											<th>담당자</th>
											<th>출고현황</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="outMaterialDTO" items="${outMaterialList}">
											<tr>
												<td><input type="checkbox" name="selectedProId"
													value="${outMaterialDTO.out_code}" class="eachCheckbox"></td>
												<td>${outMaterialDTO.out_code}</td>
												<td>${outMaterialDTO.out_wh_code}</td>
												<td>${outMaterialDTO.order_code}</td>
												<td>${outMaterialDTO.emp_num}</td>
												<td><c:choose>
														<c:when test="${outMaterialDTO.out_status eq 1}">출고 전</c:when>
														<c:when test="${outMaterialDTO.out_status eq 2}">출고 중</c:when>
														<c:when test="${outMaterialDTO.out_status eq 3}">출고 확정</c:when>
														<c:otherwise>알 수 없음</c:otherwise>
													</c:choose></td>
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
	<script src="../resources/js/outMaterial_im.js"></script>
	<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

	<script>	
//////////////////////////////////////////////추가, 수정 을 구분하기위한 전역변수선언/////////////////////////////////////////
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
	"out_code": "출고코드",
	"out_wh_code": "출고 창고 코드",
	"order_code": "수주 코드",
	"emp_num": "출고 담당자",
	"out_status": "출고 현황",
	"branch":"출고 지점"
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
	  
	  // 검색칸은 비어있어도 상관없음
	  // 검사에서 제외사항
	  if ((key === "content") && value === ""){
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
	  if (key === "out_code" && value !== "") {
		  // ajax 호출
		  $.ajax({
			  	type: "GET",
		        url: "${pageContext.request.contextPath}/Shipping_ajax/searchOutCode",
		        //data 매개변수에 wh_code필드의 값을 전달한다.
		        data: {"out_code": value},
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////추가///////////////////////////////////////////////////////////////
	$("#mtAdd").click(function(){

	// tr에 값을 삽입하기위한 변수선언
	var row = "<tr>";

	//상태를 저장으로 변경
	status = "save";

	//체크박스
	row += "<td>";
	row += '<input type="checkbox" name="selectedLineCo" disabled>';
	row += "</td>";

	//출고 코드 	
	row += "<td>";
	row += "<input type='text' name='branch' id='branch' size='7' required class='#datatablesSimple tr' placeholder='지점 검색' style='text-align: center; text-align-last: center;'>";	
	row += "</td>";

	//창고 코드 
	row += "<td>";
	row += "<input type='text' name='out_wh_code' id='out_wh_code' size='10' required class='#datatablesSimple tr' placeholder='창고 검색' style='text-align: center;'>";
	row += "</td>";

	//수주 코드 
	row += "<td>";
	row += "<input type='text' name='order_code' id='order_code' size='10' required class='#datatablesSimple tr' placeholder='수주 코드 검색' style='text-align: center;'>";
	row += "</td>";

	//담당자 
	row += "<td>";
	row += "<input type='text' name='emp_num' id='emp_num' size='9' required class='#datatablesSimple tr' placeholder='담당자 검색' style='text-align: center;'>";
	row += "</td>";

	//출고현황 	
	row += "<td>";
	row += "<select name='out_status' id='out_status' required class='#datatablesSimple tr'>";
	row += "<option value='' > 출고 현황을 선택하십시오</option>";
	row += "<option value='1'>출고전</option>";
	row += "<option value='2'>출고중</option>";
	row += "<option value='3'>출고확정</option>";
	row += "</select>";
	row += "</td>";

	//상단에 할당한 <tr>태그 닫아 주기
	row += "</tr>";

	// 생성한 <tr> 요소를 tbody에 추가
	//:nth-child(1) 선택자는 <tbody> 내의 첫 번째 자식 요소를 선택하는데 사용됩니다.
	// before($tr) 함수를 호출하여 $tr 요소를 선택한 첫 번째 자식 요소 앞에 추가합니다.
	$('tbody tr:nth-child(1)').before(row);

	// 품목추가중에 품목추가,수정,삭제 버튼을 비활성화한다
	$("#mtAdd").attr('disabled','disabled');
	$("#updateMt").attr('disabled','disabled');
	$("#deleteMt").attr('disabled','disabled');

	// 품목추가중에 취소, 저장 버튼입력이 가능하다
	// disabled(비활성화) 속성 제거(removeAttr)
	$("#cancelMt").removeAttr("disabled");
	$("#saveMt").removeAttr("disabled");
	});// end function

///////////////////////////////////////////////////////////저장//////////////////////////////////////////////////// 
	$("#saveMt").click(function() {
		
			// 상태가 수정인경우 수정 작업 실행
	    	if(status === "update"){
	    		
	    	// 데이터를 전송하기위한 폼 데이터 직렬화
	    	// serialize()는 jQuery에서 제공하는 메서드로, HTML 폼(form) 요소 내의 입력 필드들의 값을 쿼리 문자열로 직렬화합니다
	    	//warehouseName=Warehouse+1&location=Location+A&capacity=1000
	    	var formData = $('#outMaterialList').serialize();
	    	
	    	// AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
			if(formTest(formData)){
	    		// ajax 실행
	        	$.ajax({
	            	type: "POST",
	            	url: "${pageContext.request.contextPath}/Shipping_ajax/mtUpdate",
	            	data: formData,
	            	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
	            	success: function(response) {
	            		// 공백을 제거한다
	            		//const를 사용하여 선언된 변수는 상수로 취급되며, 한 번 할당된 값을 변경할 수 없습니다. 
	            		const result = $.trim(response);
	            	 
	                 	if (result == "true") {
	                 		//.then() 함수를 사용하여 사용자가 알림 창을 확인할 때 실행할 콜백 함수를 정의할 수 있습니다
	                	 	Swal.fire('출고 창고 수정이 완료되었습니다.', '성공', 'success').then(result => {
						 	 	// 사용자가 확인창을 누르면 실행
	                		 	if(result.isConfirmed){
						 			location.reload(); // 성공 시 새로고침한다
						 		
							 		// 저장이 완료되면 취소, 저장 버튼을 비활성화한다
							  		$("#cancelMt").attr('disabled','disabled');
							  		$("#saveMt").attr('disabled','disabled');
								
									// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
									$("#mtAdd").removeAttr("disabled");
									$("#updateMt").removeAttr("disabled");
									$("#deleteMt").removeAttr("disabled");
						 		}// end alert_if
						 });// end alert
	                 } else {
	                	 Swal.fire('출고 창고 수정에 문제가 발생했습니다.', '실패', 'error');
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
	        	 var formData = $('#outMaterialList').serialize();
	    		 
	    		 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
				 if(formTest(formData)){
	        	 	// ajax 실행
	             	$.ajax({
	                 	type: "POST",
	                 	url: "${pageContext.request.contextPath}/Shipping_ajax/mtInsert",
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
	    						  		$("#cancelMt").attr('disabled','disabled');
	    						  		$("#saveMt").attr('disabled','disabled');
	    							
	    								// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
	    								$("#mtAdd").removeAttr("disabled");
	    								$("#updateMt").removeAttr("disabled");
	    								$("#deleteMt").removeAttr("disabled");
	    							
	    					 		}// end alert_if
	    					 	});// end alert
	                     	} else {
	                    	 	Swal.fire('출고 창고 추가에 문제가 발생했습니다.', '실패', 'error');
	                     	}
	                 	},
	                 	error: function () {
	                	 	Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
	                 	}
	             	});// endAJAX(물품 추가)
	    	 	}// end 정규식검사
	    	 }// end else_if
	});// end function
	
//////////////////////////////////////////////수정/////////////////////////////////////////////////////////////////
	$("#updateMt").click(function(){
		
		// 상태를 업데이트로 변경한다
		status = "update";
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedProId']:checked");
		
		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
			
			// 텍스트태그를 추가할 tr태그를 선택한다
			// JavaScript에서 선택한 체크박스 또는 요소(selectedCheckbox)가 속한 가장 가까운 <tr>(테이블 행) 요소를 찾아 row 변수에 할당하는 코드입니다.

	        // selectedCheckbox: 이 변수는 JavaScript로 선택된 체크박스 또는 요소를 나타냅니다.

	        // .closest("tr"): closest() 메서드는 선택한 요소에서 시작하여 가장 가까운 상위 조상 요소를 찾는 메서드입니다.
	        // 여기서는 "tr"을 인수로 전달하여 가장 가까운 <tr>(테이블 행) 요소를 찾습니다.
	        
			var row = selectedCheckbox.closest("tr");
			
			// input type의 name 값 지정
			var cellNames = [
				"out_code", 
				"out_wh_code", 
				"order_code", 
				"emp_num",
				"out_status",
			];
			
			// input type의 id 값 지정
			var cellIds = [
				"out_code", 
				"out_wh_code", 
				"order_code", 
				"emp_num",
				"out_status",
			];
			
			
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다
			// 설명
			//아래에 있는 JavaScript 코드는 선택된 요소 중에서 부모 요소의 첫 번째 자식이 아닌 `<td>` 요소들을 찾아서 각각에 대해 작업을 수행하는 코드입니다.

	        // row.find("td:not(:first-child)"): 이 부분은 `.find()` 메서드를 사용하여 `row` 요소 내에서 부모 요소의 첫 번째 자식이 아닌 `<td>` 요소들을 선택합니다. `:not(:first-child)` 선택자는 각 부모 요소의 첫 번째 `<td>` 자식을 제외하도록 사용됩니다.

	        // each(function(index) { /* ... */ }): 원하는 `<td>` 요소들을 선택한 후, `.each()` 메서드를 사용하여 각각에 대해 반복 작업을 수행합니다. `function(index) { /* ... */ }`는 각 선택된 `<td>` 요소에 대해 실행되는 콜백 함수입니다. `index` 매개변수는 현재 `<td>` 요소의 선택된 집합 내에서의 인덱스를 나타냅니다.

	        // 콜백 함수 내부에서는 각 선택된 `<td>` 요소에 대해 인덱스나 다른 기준에 따라 특정 작업을 수행할 수 있습니다.
			row.find("td:not(:first-child)").each(function(index) {
				
				// 기존 텍스트 값을 변수에 저장한다
				var cellValue = $(this).text();
				// 삼항연산자 0번째 행(코드)와 2번째행(종류)는 리드온리로 변경할 수 없다
				var cellOption = index === 0 ? "readonly" : "";
				// 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
				var cellName = cellNames[index];
				// 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
				var cellId = cellIds[index];
			            
				
				if (cellName === "out_status") {
				    var cvValue;
				    
				    if (cellValue === "출고전") {
				        cvValue = "1";
				    } else if (cellValue === "출고중") {
				        cvValue = "2";
				    } else if (cellValue === "출고확정") {
				        cvValue = "3";
				    } else {
				        cvValue = cellValue;
				    }

				    var selectHTML = '<select name="' + cellName + '" id="' + cellId + '" ' + cellOption + ' >' +
				                           '<option value="1" ' + (cvValue === "1" ? "selected" : "") + '>출고전</option>' +
				                           '<option value="2" ' + (cvValue === "2" ? "selected" : "") + '>출고중</option>' +
				                           '<option value="3" ' + (cvValue === "3" ? "selected" : "") + '>출고확정</option>' +
				                           '</select>';
				    
				    $(this).html(selectHTML);
				               
	               } else {
	               // 다른 열은 그대로 입력 칸 생성
	               $(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + '  size="5">');
	               }
	            
			});// end_find(행 검색 반복문 종료지점)
		    
			// 품목수정중에 품목추가,수정,삭제 버튼을 비활성화한다
		  	$("#mtAdd").attr('disabled','disabled');
		  	$("#updateMt").attr('disabled','disabled');
			$("#deleteMt").attr('disabled','disabled');
			
			// 품목수정중에 취소, 저장 버튼입력이 가능하다
			$("#cancelMt").removeAttr("disabled");
			$("#saveMt").removeAttr("disabled");
			
		} // end if
		
		// 체크박스가 선택되어있지않으면 에러가 발생한다
		else if (selectedCheckbox.length === 0){
			Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
		// 여러개가 체크되어있으면 에러가 발생한다
		} else {
			Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');
		} // end else
	}); // end function

/////////////////////////////////////////////// 취소 ///////////////////////////////////////////////////////

	$("#cancelMt").click(function(){
		    		
			// 상태가 수정인경우 초기화 작업 실행
		    if(status === "update"){
		    	
			// 테이블 모든행에 따라 반복작업 실행
			$("#datatablesSimple tr").each(function() {
				
			// 행 위치를 얻기위한 변수선언
			var row = $(this);
			
			// 폼태그안의 모든 데이터를 초기값으로 리셋한다
			$("#outMaterialList")[0].reset();
			
				// 각 셀의 값을 원래 상태로 되돌린다(마찬가지로 첫번째 셀은 제외한다)
				row.find("td:not(:first-child)").each(function(index) {
					// 텍스트 태그의 값을 찾는다
					var cellValue = $(this).find("input").val();
					// 텍스트 태그를 삭제하고 값만 td태그에 삽입한다
					$(this).html(cellValue);
				});// end_find(행 검색 반복문 종료지점)
			});// end_each(행 반복문 종료지점)
			
			// 상태가 저장인경우 삭제작업 실행
		    } else if(status === "save"){
		    	// 추가한 행을 삭제한다
		    	// $("tbody tr:nth-child(1)") 선택자는 <tbody> 요소 하위의 첫 번째 <tr> 요소를 선택합니다.
		    	// 여기서 tbody는 테이블의 본문을 나타내며, tr:nth-child(1)은 첫 번째 행을 나타냅니다.
		    	$("tbody tr:nth-child(1)").remove();
		    }// end_if
		    
		 	// 취소가 완료되면 취소, 저장 버튼을 비활성화한다
		  	$("#cancelMt").attr('disabled','disabled');
		  	$("#saveMt").attr('disabled','disabled');
			
			// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
			$("#mtAdd").removeAttr("disabled");
			$("#updateMt").removeAttr("disabled");
			$("#deleteMt").removeAttr("disabled");
			
	});// end function

///////////////////////////////////////////////////////삭제////////////////////////////////////////////////////////////
	// 삭제 버튼 누를 시 실행되는 함수
	$("#deleteMt").click(function() {
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedProId']:checked");
		
		// 체크박스가 선택되어있지않다면 에러가 발생한다
		if (selectedCheckbox.length === 0){
			Swal.fire('삭제할 행을 선택해 주십시오.', '실패', 'error');
		} 
		// 체크박스가 선택되어있다면 함수실행
		else {
			
			 // 데이터를 전송하기위한 폼 데이터 직렬화
			 // serialize()는 jQuery에서 제공하는 메서드로, HTML 폼(form) 요소 내의 입력 필드들의 값을 쿼리 문자열로 직렬화합니다
	    	 var formData = $('#outMaterialList').serialize();
			 
	    	 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
			 if(formTest(formData)){
	    	 	// 문제없다면 ajax 실행
	         	$.ajax({
	             	type: "POST",
	             	url: "${pageContext.request.contextPath}/Shipping_ajax/mtDelete",
	             	data: formData,
	             	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
	             	success: function(response) {
	            	 	// 공백을 제거한다
	            	 	const result = $.trim(response);
	            	 
	                 	if (result == "true") {
	                	 	Swal.fire('출고 삭제가 완료되었습니다.', '성공', 'success').then(result => {
	                			// 사용자가 확인창을 누르면 실행
	                			// isConfirmed:isConfirmed는 SweetAlert 라이브러리와 관련된 이벤트 처리 시 사용되는 변수입니다.
	                			// SweetAlert는 대화형 모달 다이얼로그를 생성하는 JavaScript 라이브러리 중 하나로,
	                			// 사용자와의 상호 작용을 통해 정보를 확인하거나 액션을 수행할 수 있도록 도와줍니다.
	                		 	if(result.isConfirmed){
						 			location.reload(); // 성공 시 새로고침 한다
						 		
						 			// 삭제가 완료되면 취소, 저장 버튼을 비활성화한다
						  			$("#cancelMt").attr('disabled','disabled');
						  			$("#saveMt").attr('disabled','disabled');
							
									// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
									$("#mtAdd").removeAttr("disabled");
									$("#updateMt").removeAttr("disabled");
									$("#deleteMt").removeAttr("disabled");
						 		}
								
						 	});// end alert
	                 	} else {
	                	 	Swal.fire('출고 삭제에 문제가 발생했습니다.', '실패', 'error');
	                 	}
	             	},
	             	error: function () {
	            	 	Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
	             	}
	        	});// endAJAX(물품 삭제)
			 }// end 정규식검사
			}// end else
	});//end function

/////////////////////////////////////////////////////enter조회/////////////////////////////////////////////////
	function entermtSearch() {
		   // 값 전달 하기위한 JSON 타입 변수선언
		   var json = {
	     			category: $('#category').val(),
	     			content: $('#content').val()
	    			  };
		   
		   var statusText = {
	    		    1: "출고 전",
	    		    2: "출고 중",
	    		    3: "출고 확정"
	    		};
		
		   // 검색 결과값을 받아오기 위한 ajax 호출
		   $.ajax({
				  url : '${pageContext.request.contextPath}/Shipping_ajax/search',
				  // JSON타입의 변수를 스트링으로 변환한다
				  // 이 코드는 JavaScript에서 사용되며, 주로 HTTP 요청을 보낼 때 서버로 데이터를 전송하기 위한 작업을 수행합니다.
				  // 여기서 JSON.stringify(json)은 JavaScript 객체(json)를 JSON 문자열로 변환하는 역할을 합니다.
				  data: JSON.stringify(json),
				  
				  // JSON타입의 변수를 전송한다
		          contentType: 'application/json',
		          
				  type : 'POST',
				  
				  // 반환은 JSON 타입
				  dataType: 'json',
				  // 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
				  success:function(json){
					  
					    // tbody 내용을 초기화
					    $('tbody').empty();
						
					    // 배열 크기만큼 반복
					    json.forEach(function (data) {
					    	// tr 태그 생성
					        var $tr = $('<tr>');
					    		//tr 에 내용추가
					        	$tr.append(
					        			'<td><input type="checkbox" name="selectedProId" value="' + data.out_code + '"></td>',
							        	"<td>"+data.out_code+"</td>",
							            "<td>"+data.out_wh_code+"</td>",
							           	"<td>"+data.order_code+"</td>",
							            "<td>"+data.emp_num+"</td>",
							            "<td>" + (statusText[data.out_status] || '알 수 없음') + "</td>"
					        	);
					        // 생성한 <tr> 요소를 tbody에 추가
					        $('tbody').append($tr);
					    });
			      }// 콜백함수 종료지점
	   });// end_of_ajax
	}// end function


	/////////////////////////////////////////////input 조회 //////////////////////////////////////////////
	$("#inputmtSearch").click(function()  {
		   // 값 전달 하기위한 JSON 타입 변수선언
		   var json = {
	     			category: $('#category').val(),
	     			content: $('#content').val()
	    			  };
		   
		   var statusText = {
	    		    1: "출고 전",
	    		    2: "출고 중",
	    		    3: "출고 확정"
	    		};
		   
		   // 검색 결과값을 받아오기 위한 ajax 호출
		   $.ajax({
				  url : '${pageContext.request.contextPath}/Shipping_ajax/search',
				  // JSON타입의 변수를 스트링으로 변환한다
				  // 이 코드는 JavaScript에서 사용되며, 주로 HTTP 요청을 보낼 때 서버로 데이터를 전송하기 위한 작업을 수행합니다.
				  // 여기서 JSON.stringify(json)은 JavaScript 객체(json)를 JSON 문자열로 변환하는 역할을 합니다.
				  data: JSON.stringify(json),
				  
				  // JSON타입의 변수를 전송한다
		          contentType: 'application/json',
		          
				  type : 'POST',
				  
				  // 반환은 JSON 타입
				  dataType: 'json',
				  // 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
				  success:function(json){
					  
					    // tbody 내용을 초기화
					    $('tbody').empty();
						
					    // 배열 크기만큼 반복
					    json.forEach(function (data) {
					    	   	
					    	// tr 태그 생성
					        var $tr = $('<tr>');
					    		//tr 에 내용추가
					        	$tr.append(
					        	'<td><input type="checkbox" name="selectedProId" value="' + data.out_code + '"></td>',
					        	"<td>"+data.out_code+"</td>",
					            "<td>"+data.out_wh_code+"</td>",
					           	"<td>"+data.order_code+"</td>",
					            "<td>"+data.emp_num+"</td>",
					         	"<td>" + (statusText[data.out_status] || '알 수 없음') + "</td>"
					        	);
					        // 생성한 <tr> 요소를 tbody에 추가
					        $('tbody').append($tr);
					    });
			      }// 콜백함수 종료지점
	   });// end_of_ajax
	});// end function
	

///////////////////////////////////////////기능함수 종료////////////////////////////////////////////////
	
///////////////////////////////////////////이벤트 함수/////////////////////////////////////////////////


////////////////////////////조회를 누르지 않고 enter만 쳐도 조회가 자동으로 되는 기능 ///////////////////////////

$('input[type="text"]').keydown(function() {
	// 엔터키 이벤트 발생을 확인한다
	if (event.keyCode === 13) {
		// 폼 태그 제출을 막는다
 		event.preventDefault();
		// 검색 함수를 실행한다
        entermtSearch();
		// 검색입력창을 초기화한다
 		$('#content').val("");
	}// end if
});// end function


//////////////////////////////////// 전체 체크///////////////////////////////////

// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
$('input[name="selectedAllProId"]').click(function() {
    // 모든 selectedProId 체크박스의 상태를 selectedAllProId와 동일하게 설정한다
    // $this로 AllProId의 상태를 가져온다
    $('input[name="selectedProId"]').prop('checked', $(this).prop('checked'));
});// end function

////////////////////////////////////담당자을 클릭하면 새창을 여는 이벤트 리스너 ///////////////////////////////////

$(document).on("click", "input[name='emp_num']", function() {
	window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=800px, height=770px, left=600px, top=300px');
});// end function

////////////////////////////////////출고 지점을 클릭하면 새창을 여는 이벤트 리스너 ///////////////////////////////////

$(document).on("click", "input[name='branch']", function() {
	window.open('${pageContext.request.contextPath }/sell/branchListPopUp', '_blank', 'width=800px, height=770px, left=600px, top=300px');
});// end function

////////////////////////////////////창고 코드을 클릭하면 새창을 여는 이벤트 리스너 ///////////////////////////////////

$(document).on("click", "input[name='out_wh_code']", function() {
	window.open('${pageContext.request.contextPath }/warehouse/warehouseListPopUp', '_blank', 'width=800px, height=770px, left=600px, top=300px');
});// end function

////////////////////////////////////수주 코드을 클릭하면 새창을 여는 이벤트 리스너 ///////////////////////////////////

$(document).on("click", "input[name='order_code']", function() {
	window.open('${pageContext.request.contextPath }/sell/ordersListPopUp', '_blank', 'width=800px, height=770px, left=600px, top=300px');
});// end function


////////////////////////////////////액셀 버튼 구현////////////////////////////////

//엑셀 버튼 누를 시 실행되는 함수
$("#excelProd").click(function(){
	
	// 체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='selectedProId']:checked");
	
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
		XLSX.utils.book_append_sheet(workbook, worksheet, "Sheet1");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"품목 리스트.xlsx"
		);
	
});// end function

/////////////////////////////////////////////이벤트 함수 종료//////////////////////////////////////////

});//document

//////////////////////////////////PopUp창 오류 및 close/////////////////////////////////////////////////////
function openUpdate() {
//내용은 필요 없음	
} 
//////////////////////////////////PopUp창 오류 및 close/////////////////////////////////////////////////////
</script>
</body>
</html>
