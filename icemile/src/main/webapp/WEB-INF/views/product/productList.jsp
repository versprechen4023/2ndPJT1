<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
  <link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
<!-- 헤드 -->
</head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
<form id="productList">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">품목관리</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
							<input type="button" class ="tableBtn" value="품목추가" id="productAdd">
							<input type="button" class ="tableBtn" value="수정" id="updateProd">
							<input type="button" class ="tableBtn" value="삭제" id="deleteProd">
							<input type="button" class ="tableBtn" value="취소" id="cancelProd" disabled>
							<input type="button" class ="tableBtn" value="저장" id="saveProd" disabled>
						</c:if>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                             <div class="cardHeaderFirstLine">                            
                           <input type="button" name="allList" value="전체목록" onclick="location.reload();">&nbsp;
							<select id="category">
  								<option value="prod_code">코드</option>
  								<option value="prod_name">품명</option>
  								<option value="prod_type">종류</option>
							</select>&nbsp;
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"	 id="content">&nbsp;
							<input type="button" name="search" value="조회" onclick="productSearch()">
                            </div>
                            </div>
                            <div class="card-body">
 
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllProId"></th>
                                            <th>코드</th>
                                            <th>품명</th>
                                            <th>종류</th>
                                            <th>단가</th>
                                            <th>비고</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="productAllDTO" items="${productList}">
                                        <tr>
                                        	<td><input type="checkbox" name="selectedProId" value="${productAllDTO.prod_code}"></td>
                                            <td>${productAllDTO.prod_code}</td>
                                            <td>${productAllDTO.prod_name}</td>
                                            <td>${productAllDTO.prod_type}</td>
                                            <td>${productAllDTO.prod_price}</td>
                                            <td>${productAllDTO.prod_note}</td>
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
	
<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script>
// 추가, 수정 을 구분하기위한 전역변수선언
var status = "";

//Table 초기화를 위한 전역변수 선언
var simpleDataTableInstance;

// 테이블 초기화 함수
function simpleDataTable() {
	// 테이블의 선택자를 찾는다
	const datatablesSimple = document.getElementById('datatablesSimple');
		
		// 테이블 객체를 생성하고 전역변수에 저장한다
     	simpleDataTableInstance = new simpleDatatables.DataTable(datatablesSimple, {
        
      		// 페이지 표시 버튼 삭제
      		perPageSelect : false,
      		// 검색창 삭제
      		searchable : false,
      		// 페이지당 목록 10개
      		perPage : 10,
      
      		//라벨 수정
      		labels: {
      		placeholder: "검색",
      		noResults : "검색 결과가 없습니다",
      		noRows : "데이터가 없습니다",
      		info : ""
      		}
      }); // end 초기화
    
}//end function

// 돔이 로드될떄 테이블 초기화
window.addEventListener('DOMContentLoaded', event => {
	simpleDataTable();
});

//조회를 눌렀을때 실행되는 물품 검색관련 함수
function productSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/product_ajax/search',
 			  // JSON타입의 변수를 스트링으로 변환한다
 			  data: JSON.stringify(json),
 			  // JSON타입의 변수를 전송한다
 	          contentType: 'application/json',
 			  type : 'POST',
 			  // 반환은 JSON 타입
 			  dataType: 'json',
 			  // 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
 			  success:function(json){
 				  	
 					// 아무것도 출력할게 없을때 선택자가 삭제되어 테이블을 더이상 초기화하지 못하는 문제가 있음
				   	// 따라서 조건문으로 0개가 아닐때만 테이블을 삭제함
				 	if(json.length !== 0){
				    	simpleDataTableInstance.destroy();
				 	}
 					
 				    // tbody 내용을 초기화
 				    $('tbody').empty();
					
 					// json 배열에 값이 없는 경우 추가가 안되는걸 방지하기위한 tr태그 생성
				    if(json.length === 0){
				    	// tr 태그 생성
				        var $tr = $('<tr>');
				        $('tbody').append($tr);
				    }
 					
 				    // 배열 크기만큼 반복
 				    json.forEach(function (data) {
 				    	// tr 태그 생성
 				        var $tr = $('<tr>');
 				    		//tr 에 내용추가
 				        	$tr.append(
 				        	'<td><input type="checkbox" name="selectedProId" value="' + data.prod_code + '"></td>',
 				        	"<td>"+data.prod_code+"</td>",
 				            "<td>"+data.prod_name+"</td>",
 				           	"<td>"+data.prod_type+"</td>",
 				         	"<td>"+data.prod_price+"</td>",
 				         	"<td>"+data.prod_note+"</td>"
 				        	);
 				        // 생성한 <tr> 요소를 tbody에 추가
 				        $('tbody').append($tr);
 				    });
 				    
 				   // 테이블 재생성 마찬가지로 데이터가있는 경우에만 객체 재생성
  				   if(json.length !== 0){
  				       simpleDataTable();
  				   // 그렇지않은경우 기존 객체를 유지하고 페이징만 삭제
  				   } else if(json.length === 0){
  	 				    // 페이징을 삭제
  	 				   	$('.datatable-pagination-list').remove();
  	 			   }
 				  	
 		      }// 콜백함수 종료지점
      });// end_of_ajax
}// end function

// 함수 시작지점
$(document).ready(function() {

// 정규식 제어함수
function formTest(formData) {
	
	// 결과값 반환을 위한 변수선언
	var result = true;
	
	// 반복문 제어를 위한 변수선언
	var continueFor = true;
	
	// &을 기준으로 끊고 배열 변수를 선언한다 이후 배열에 따라 반복문을 시행한다
	// 기준 데이터는 아래와같다 "content=&type=&prod_name="...
	var formArray = formData.split("&");

    // 사용자에게 알려주기위해 영문 키값을 한글로 매핑한다
    // 매핑을 위한 JSON 변수선언
    var koreanNames = {
  		"type": "품목종류(코드)",
  		"prod_name": "품목이름",
  		"prod_type": "원자재/완제품 종류",
  		"prod_price": "단가"
	};
	// 반복문을 사용하여 각 항목을 검사한다
	for (var i = 0; i < formArray.length; i++) {
	  
	  // 키값의 기준점은 = 이된다
	  var keyValue = formArray[i].split("=");
	  // 키변수에 키값을 담는다
	  var key = decodeURIComponent(keyValue[0]);
	  // 밸류 변수에 키의 리터럴 값을 담는다
	  var value = decodeURIComponent(keyValue[1]);
	  
	  // 비고와 검색칸은 비어있어도 상관없음
	  if ((key === "prod_note" || key === "content") && value === ""){
		  continue;
	  }
	  
	  if (value === "") {
	    // 값이 비어 있는 경우 결과값은 false가 된다
	    Swal.fire(koreanNames[key]+' 값을 입력해주십시오.', '', 'info');
	    result = false;
	    break; // 비어있는 필드를 발견하면 반복문을 종료하고 false를 반환한다
	  }
	  
	  // 중복값 검사수행
	  if (key === "prod_name" && value !== "" && status !== "update") {
		  // ajax 호출
		  $.ajax({
			  	type: "GET",
		        url: "${pageContext.request.contextPath}/product_ajax/searchProName",
		        data: {"prod_name": value},
		     	// 조건문 발동을 위해 비동기로 처리
		        async: false,
		        success: function(response) {
		        	// 공백을 제거한다
            		const resultAjax = $.trim(response);
            		
		        	if(resultAjax == "false"){
		        		result = false;
		        		continueFor = false;
		        		Swal.fire('이미 존재하는 품명입니다 다른 이름을 입력하십시오', '', 'info');
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

// 추가, 삭제, 수정등 기능 구현 함수 시작지점

// 추가 버튼 누를 시 실행되는 함수
$("#productAdd").click(function(){
	 
	 // 상태를 저장으로 변경
	 status = "save";
	 
	 // tr에 값을 삽입하기위한 변수선언
	 var $tr = $('<tr>');
	 
	 //tr 에 내용추가
  	 $tr.append(
  		'<td><input type="checkbox" name="selectedProId" disabled></td>',
  		'<td><select name="type" id="type">'+
			'<option value="">품목종류를 선택하십시오</option>'+
			'<option value="R">원자재</option>'+
			'<option value="P">완제품</option>'+
			'</select>'+
		'</td>',
		'<td><input type="text" name="prod_name" placeholder="품목이름을 명시하십시오"></td>',
  		'<td><select name="prod_type" id="prod_type">'+
  			'<option value="">품목종류를 먼저 선택하십시오</option>'+
			'</select>'+
  		'</td>',
  		'<td><input type="text" name="prod_price" value = "0" size="5"></td>',
  		'<td><input type="text" name="prod_note" size="6"></td>',
  		);
  	// 생성한 <tr> 요소를 tbody에 추가
  	$('tbody tr:nth-child(1)').before($tr);
  	
  	// 품목추가중에 품목추가,수정,삭제 버튼을 비활성화한다
  	$("#productAdd").attr('disabled','disabled');
  	$("#updateProd").attr('disabled','disabled');
	$("#deleteProd").attr('disabled','disabled');
	
	// 품목추가중에 취소, 저장 버튼입력이 가능하다
	$("#cancelProd").removeAttr("disabled");
	$("#saveProd").removeAttr("disabled");
	
});// end function

// 수정 버튼 누를 시 실행되는 함수
$("#updateProd").click(function(){
	
	// 상태를 업데이트로 변경한다
	status = "update";
	
	// 체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='selectedProId']:checked");
	
	// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	if (selectedCheckbox.length === 1) {
		
		// 텍스트태그를 추가할 tr태그를 선택한다
		var row = selectedCheckbox.closest("tr");
		
		// input type의 name 값 지정
		var cellNames = [
			"prod_code", 
			"prod_name", 
			"prod_type", 
			"prod_price",
			"prod_note"
		];
		
		// input type의 id 값 지정
		var cellIds = [
			"prod_code", 
			"prod_name", 
			"prod_type", 
			"prod_price",
			"prod_note"
		];
		
		
		// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
		row.find("td:not(:first-child)").each(function(index) {
			
			// 기존 텍스트 값을 변수에 저장한다
			var cellValue = $(this).text();
			// 삼항연산자 0번째 행(코드)와 2번째행(종류)는 리드온리로 변경할 수 없다
			var cellOption = index === 0 || index === 1 || index === 2 ? "readonly" : "";
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

// 취소 버튼 누를 시 실행되는 함수
$("#cancelProd").click(function(){
		
		// 상태가 수정인경우 초기화 작업 실행
	    if(status === "update"){
	    	
		// 테이블 모든행에 따라 반복작업 실행
		$("#datatablesSimple tr").each(function() {
			
		// 행 위치를 얻기위한 변수선언
		var row = $(this);
		
		// 폼태그안의 모든 데이터를 초기값으로 리셋한다
		$("#productList")[0].reset();
		
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
	    	$("tbody tr:nth-child(1)").remove();
	    }// end_if
	    
	 	// 취소가 완료되면 취소, 저장 버튼을 비활성화한다
	  	$("#cancelProd").attr('disabled','disabled');
	  	$("#saveProd").attr('disabled','disabled');
		
		// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
		$("#productAdd").removeAttr("disabled");
		$("#updateProd").removeAttr("disabled");
		$("#deleteProd").removeAttr("disabled");
		
});// end function

// 저장 버튼 누를 시 실행되는 함수
$("#saveProd").click(function() {
	
		// 상태가 수정인경우 수정 작업 실행
    	if(status === "update"){
    		
    	// 데이터를 전송하기위한 폼 데이터 직렬화
    	var formData = $('#productList').serialize();
    	
    	// AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
		if(formTest(formData)){
    		// ajax 실행
        	$.ajax({
            	type: "POST",
            	url: "${pageContext.request.contextPath}/product_ajax/productUpdate",
            	data: formData,
            	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
            	success: function(response) {
            		// 공백을 제거한다
            		const result = $.trim(response);
            	 
                 	if (result == "true") {
                	 	Swal.fire('품목 수정이 완료되었습니다.', '성공', 'success').then(result => {
					 	 	// 사용자가 확인창을 누르면 실행
                		 	if(result.isConfirmed){
					 			location.reload(); // 성공 시 새로고침한다
					 		
						 		// 저장이 완료되면 취소, 저장 버튼을 비활성화한다
						  		$("#cancelProd").attr('disabled','disabled');
						  		$("#saveProd").attr('disabled','disabled');
							
								// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
								$("#productAdd").removeAttr("disabled");
								$("#updateProd").removeAttr("disabled");
								$("#deleteProd").removeAttr("disabled");
					 		}// end alert_if
					 });// end alert
                 } else {
                	 Swal.fire('품목 수정에 문제가 발생했습니다.', '실패', 'error');
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
        	 var formData = $('#productList').serialize();
    		 
    		 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
			 if(formTest(formData)){
        	 	// ajax 실행
             	$.ajax({
                 	type: "POST",
                 	url: "${pageContext.request.contextPath}/product_ajax/productInsert",
                 	data: formData,
                 	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
                 	success: function(response) {
                	 	// 공백을 제거한다
                	 	const result = $.trim(response);
                	 
                     	if (result == "true") {
                    		 Swal.fire('품목 추가가 완료되었습니다.', '성공', 'success').then(result => {
    					 	 	// 사용자가 확인창을 누르면 실행
                    		 	if(result.isConfirmed){
    					 			location.reload(); // 성공 시 새로고침한다
    					 		
    						 		// 저장이 완료되면 취소, 저장 버튼을 비활성화한다
    						  		$("#cancelProd").attr('disabled','disabled');
    						  		$("#saveProd").attr('disabled','disabled');
    							
    								// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
    								$("#productAdd").removeAttr("disabled");
    								$("#updateProd").removeAttr("disabled");
    								$("#deleteProd").removeAttr("disabled");
    							
    					 		}// end alert_if
    					 	});// end alert
                     	} else {
                    	 	Swal.fire('품목 추가에 문제가 발생했습니다.', '실패', 'error');
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
$("#deleteProd").click(function() {
	
	// 체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='selectedProId']:checked");
	
	// 체크박스가 선택되어있지않다면 에러가 발생한다
	if (selectedCheckbox.length === 0){
		Swal.fire('삭제할 행을 선택해 주십시오.', '실패', 'error');
	} 
	// 체크박스가 선택되어있다면 함수실행
	else {
		
		 // 데이터를 전송하기위한 폼 데이터 직렬화
    	 var formData = $('#productList').serialize();
		 
    	 // AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
		 if(formTest(formData)){
    	 	// 문제없다면 ajax 실행
         	$.ajax({
             	type: "POST",
             	url: "${pageContext.request.contextPath}/product_ajax/productDelete",
             	data: formData,
             	// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
             	success: function(response) {
            	 	// 공백을 제거한다
            	 	const result = $.trim(response);
            	 
                 	if (result == "true") {
                	 	Swal.fire('품목 삭제가 완료되었습니다.', '성공', 'success').then(result => {
                			// 사용자가 확인창을 누르면 실행
                		 	if(result.isConfirmed){
					 			location.reload(); // 성공 시 새로고침 한다
					 		
					 			// 삭제가 완료되면 취소, 저장 버튼을 비활성화한다
					  			$("#cancelProd").attr('disabled','disabled');
					  			$("#saveProd").attr('disabled','disabled');
						
								// 다시 물품등록, 수정, 삭제를 할 수 있게 활성화한다
								$("#productAdd").removeAttr("disabled");
								$("#updateProd").removeAttr("disabled");
								$("#deleteProd").removeAttr("disabled");
					 		}
							
					 	});// end alert
                 	} else {
                	 	Swal.fire('품목 삭제에 문제가 발생했습니다.', '실패', 'error');
                 	}
             	},
             	error: function () {
            	 	Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             	}
        	});// endAJAX(물품 삭제)
		 }// end 정규식검사
		}// end else
});//end function

// 기능 함수 종료

// 이벤트 관련 함수 시작지점

//첫 번째 셀렉트 태그의 변경 이벤트 리스너를 추가
$('tbody').on('change', 'select[name="type"]', function() {
  
  // 이벤트 발생중인 type(원자재 or 완제품)의 값을 변수에 저장한다
  var selectedType = $(this).val();

  	// 두 번째 셀렉트 태그(prod_type)에 새 옵션을 추가 한다
    var $prod_type = $('#prod_type'); // 두 번째 셀렉트 태그를 선택 한다
    // 두번째 셀렉트 태그를 초기화한다
    $prod_type.empty();
    
    // if 분기점
    // 원자재 일경우
    if(selectedType === "R"){
    	
    	// 셀렉트 값에 담을 배열 변수 선언
   		var options = [
   			{ value: "", text: "원자재를 선택해주십시오" },
      		{ value: "1", text: "우유" },
      		{ value: "2", text: "크림" },
      		{ value: "3", text: "파우더" },
      		{ value: "4", text: "조미료" },
      		{ value: "5", text: "포장" }
    	];
    
    	// 옵션을 배열에서 반복하여 추가
    	for (var i = 0; i < options.length; i++) {
    		
    		// 타입은 옵션 밸류값과 텍스트값은 배열에서 가져온다
      		var $option = $('<option>', {
        		value: options[i].value,
        		text: options[i].text
      			});
    			
    			// 최종값을 셀렉트 태그에 추가한다
      			$prod_type.append($option);
    	}// end for
    	
    // 완제품일경우
    } else if(selectedType === "P"){
    		
    		// 셀렉트 값에 담을 배열 변수 선언
       		var options = [
       			{ value: "", text: "완제품을 선택해주십시오" },
          		{ value: "1", text: "바나나아이스크림" },
          		{ value: "2", text: "딸기아이스크림" },
          		{ value: "3", text: "포도아이스크림" },
          		{ value: "4", text: "사과아이스크림" },
          		
        	];
        
        	// 옵션을 배열에서 반복하여 추가
			for (var i = 0; i < options.length; i++) {
        		
        		// 타입은 옵션 밸류값과 텍스트값은 배열에서 가져온다
          		var $option = $('<option>', {
            		value: options[i].value,
            		text: options[i].text
          			});//end var
        			
        			// 최종값을 셀렉트 태그에 추가한다
          			$prod_type.append($option);
			}// end for
	}// end else
	
	// 사용자가 딴짓거리하면 초기화..
    else if(selectedType === ""){
		
    		// 타입은 옵션 밸류값과 텍스트값은 배열에서 가져온다
      		var $option = $('<option>', {
        		value: "",
        		text: "품목종류를 먼저 선택하십시오"
      			});//end var
    			
    			// 최종값을 셀렉트 태그에 추가한다
      			$prod_type.append($option);

	}// end else
		
});// end function

// 숫자만 입력되야하는 텍스트필드의 이벤트 리스너
// 인풋 이벤트 대상이 되는 선택자 리스너 변수선언
var inputSelector = 'input[name="prod_price"]';

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
	
// 폼제출을 막고 엔터키로 조회가 가능하게 하는 함수
// 텍스트타입 제출을 막음
$('input[type="text"]').keydown(function() {
	// 엔터키 이벤트 발생을 확인한다
	if (event.keyCode === 13) {
		// 폼 태그 제출을 막는다
 		event.preventDefault();
		// 검색 함수를 실행한다
 		productSearch();
		// 검색입력창을 초기화한다
 		$('#content').val("");
	}// end if
});// end function

// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
$('input[name="selectedAllProId"]').click(function() {
    // 모든 selectedProId 체크박스의 상태를 selectedAllProId와 동일하게 설정한다
    // $this로 AllProId의 상태를 가져온다
    $('input[name="selectedProId"]').prop('checked', $(this).prop('checked'));
});// end function

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
// 이벤트 관련 함수 종료

});// end 함수

</script>
    </body>
</html>
