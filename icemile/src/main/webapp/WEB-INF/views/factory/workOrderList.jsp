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
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">작업 지시 관리</h1>
					<ol class="breadcrumb mb-4">
						<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
						<!--                             <li class="breadcrumb-item active">Tables</li> -->
					</ol>
					<div class="bnt">
						<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
						<input type="button" value="작업지시 추가" onclick="workOrderAdd()">
						</c:if>
					</div>
					<div class="card mb-4">
						<!--                             <div class="card-header"> -->
						<!--                                 <i class="fas fa-table me-1"></i> -->
						<!--                                 DataTable Example -->
						<!--                             </div> -->
						
					
					
						<div class="card-body">
						지시/수정날짜
                        <input type="text" name="workOrderBegin" id="workOrderBegin"> ~
                        <input type="text" name="workOrderEnd" id="workOrderEnd" disabled>
                        <br>
                        완료 날짜
                        <input type="text" name="workOrderDoneBegin" id="workOrderDoneBegin" > ~
                        <input type="text" name="workOrderDoneEnd" id="workOrderDoneEnd"  disabled>
                        <br>
						<input type="button" name="allList" value="전체목록" onclick="location.reload();">
							<select id="category">
  								<option value="work_code">지시코드</option>
  								<option value="line_name">라인명</option>
  								<option value="prod_name">제품명</option>
  								<option value="branch_name">지점명</option>
  
							</select>
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="workOrderSearch()">
							<table id="datatablesSimple">
								<thead>
									<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
									<tr>
										<th>지시코드</th>
										<th>작업지시자</th>
										<th>라인코드</th>
										<th>라인명</th>
										<th>수주코드</th>
										<th>제품명</th>
										<th>주문량</th>
										<th>생산공정</th>
										<th>지시/수정날짜</th>
										<th>지점명</th>
										<th>완료날짜</th>
										<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
										<th data-sortable="false">관리</th>
										</c:if>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="workOrderDTO" items="${workOrderList}">
										<tr>
											<td>${workOrderDTO.work_code}</td>
											<td>${workOrderDTO.emp_num}</td>
											<td>${workOrderDTO.line_code}</td>
											<td>${workOrderDTO.line_name}</td>
											<td>${workOrderDTO.order_code}</td>
											<td>${workOrderDTO.prod_name}</td>
											<td>${workOrderDTO.order_amount}</td>
											<td>${workOrderDTO.line_process}</td>
											<td>${workOrderDTO.work_order_date}</td>
											<td>${workOrderDTO.branch_name}</td>
											<td>${workOrderDTO.done_date}</td>
						
								
										
											<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
											<td><input type="button" value="수정"
												onclick="workOrderUpdate('${workOrderDTO.work_code}')" id="updateWorkOrder">
												<input type="button" value="삭제"
												onclick="workOrderDelete('${workOrderDTO.work_code}')" id="deleteWorkOrder">
												<input type="button" value="완료"
												onclick="workOrderDone('${workOrderDTO.work_code}')" id="doneWorkOrder">
											</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
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
	
<script>
// 멤버 검색관련 함수
function workOrderSearch() {
		
		// 원래 매개변수로 전달할려했으나 처음에 언디파인드가 뜨는 문제가 있음 따라서 변수선언
 		var role = '${sessionScope.emp_role}';
 		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
		   		workOrderBegin: $('#workOrderBegin').val(),
		   		workOrderEnd: $('#workOrderEnd').val(),
		   		workOrderDoneBegin: $('#workOrderDoneBegin').val(),
		   		workOrderDoneEnd: $('#workOrderDoneEnd').val(),
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/factory_ajax/workOrderSearch',
 			  data: JSON.stringify(json),
 	          contentType: 'application/json',
 			  type : 'POST',
 			  dataType: 'json',
			  
 			  success:function(json){
 				  
 				    // tbody 내용을 초기화
 				    $('tbody').empty();
					
 				    // 배열 크기만큼 반복
 				    json.forEach(function (data) {
 				    	// tr 태그 생성
 				        var $tr = $('<tr>');
 				    	//tr 에 내용추가
 				    	
 				    	// 권한이있으면 수정 삭제 버튼도 같이 출력
 				    	if(role.charAt(0) === '1'){
 				        	$tr.append(
 				            "<td>"+data.work_code+"</td>",
 				           	"<td>"+data.emp_num+"</td>",
 				         	"<td>"+data.line_code+"</td>",
 				         	"<td>"+data.line_name+"</td>",
 				         	"<td>"+data.order_code+"</td>",
 				         	"<td>"+data.prod_name+"</td>",
 				         	"<td>"+data.order_amount+"</td>",
 				         	"<td>"+data.line_process+"</td>",
 				         	"<td>"+data.work_order_date+"</td>",
 				         	"<td>"+data.branch_name+"</td>",
 				         	"<td>"+data.done_date+"</td>",
 				            "<td>" +
 				          	"<input type='button' value='수정' onclick='workOrderUpdate(\"" + data.workOrder_code + "\")' id='updateworkOrder'>" +
 				            "<input type='button' value='삭제' onclick='workOrderDelete(\"" + data.workOrder_code + "\")' id='deleteworkOrder'>" +
 				            "<input type='button' value='완료' onclick='workOrderDone(\"" + data.workOrder_code + "\")' id='doneWorkOrder'>" +
 				            "</td>"
 				        	);
 				    	} else {
 				    		 $tr.append(
 				    	            "<td>"+data.work_code+"</td>",
 		 				           	"<td>"+data.emp_num+"</td>",
 		 				         	"<td>"+data.line_code+"</td>",
 		 				         	"<td>"+data.line_name+"</td>",
 		 				         	"<td>"+data.order_code+"</td>",
 		 				         	"<td>"+data.prod_name+"</td>",
 		 				         	"<td>"+data.order_amount+"</td>",
 		 				         	"<td>"+data.line_process+"</td>",
 		 				         	"<td>"+data.work_order_date+"</td>",
 		 				         	"<td>"+data.branch_name+"</td>",
 		 				         	"<td>"+data.done_date+"</td>"
 		 				     );
 				    	}
 				        // 생성한 <tr> 요소를 tbody에 추가
 				        $('tbody').append($tr);
 				    });
 		      }// 콜백함수 종료지점
      });// end_of_ajax
}// end function

// 작업 지시 추가관련 함수
function workOrderAdd(){
	window.open('${pageContext.request.contextPath }/factory/workOrderAdd', '_blank', 'width=1745px, height=315px, left=600px, top=300px');
} //end function

// 작업 지시 수정관련 함수
function workOrderUpdate(work_code){
	window.open('${pageContext.request.contextPath }/factory/workOrderUpdate?work_code='+work_code, '_blank', 'width=1745px, height=315px, left=600px, top=300px');
}
// 작업 지시 삭제관련 함수
function workOrderDelete(work_code) {
	
	// sweetalert2 호출
	Swal.fire({
		   title: '작업 지시 삭제',
		   text: '정말로 등록된 작업 지시를 삭제 하시겠습니까?',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		
		// 람다식 alert 창이 닫히면 호출
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   
			   // 멤버 삭제하는 ajax 호출
			   $.ajax({
					  url : '${pageContext.request.contextPath}/factory_ajax/workOrderDelete',
					  data: {"work_code": work_code},
					  type : 'POST',
					  success:function(data){
							const result = $.trim(data);
							
							if(result == "true"){
							Swal.fire('삭제가 완료되었습니다.', '성공', 'success').then(result => {
								if(result.isConfirmed){
									// 완료 창을 닫으면 새로고침
									location.reload();
									}
							});
							} else {
							Swal.fire('삭제에 실패헀습니다.', '실패', 'error');
							}
				      }// 콜백함수 종료지점
		       });// end_of_ajax
		  }// end_of_if(컨펌확인)
	  });// end_of_function(alert 콜백함수 종료지점)

	
}// end_of_function

// 작업 지시 완료 버튼관련 함수
function workOrderDone(work_code) {
    // 서버로 완료 요청 보내기
    $.ajax({
        url: '${pageContext.request.contextPath}/factory_ajax/workOrderDone',
        data: { "work_code": work_code },
        type: 'POST',
        success: function (data) {
            if (data === "true") {
                
            	// 현재 날짜 얻기
                var currentTime = new Date();
                // 날짜를 원하는 포맷으로 변경
            	var formattedDate = currentTime.toLocaleDateString(); // 년월일 형식 (예: "10/11/2023")
                
                // 완료 날짜 표시
                $("#doneWorkOrder_" + work_code).text(formattedDate);

                // 성공 메시지 표시
                Swal.fire('작업이 성공적으로 완료되었습니다.', '성공', 'success').then(function() {
                    // 페이지 새로고침
                    location.reload();
                });

                // 버튼 비활성화
                $("#doneWorkOrder_" + work_code).prop("disabled", true);
            } else {
                // DB 업데이트 실패 시
                Swal.fire('DB 업데이트에 실패했습니다.', '실패', 'error');
            }
        }
    });
}



//지시/수정날짜 시작점
$("#workOrderBegin").datepicker({
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
	
	// 지시/수정날짜 끝점(데이트피커)을 초기화하고 동적변경을 위해 데이트피커의 초기값을 변수에 담는다
	var mySecondDatePicker = $("#workOrderEnd").datepicker({
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
	
	// 입고예정일 끝점을 선택할 수 있게한다
	$("#workOrderEnd").removeAttr("disabled");
	// 입고예정일 끝점을 초기화한다
	$("#workOrderEnd").val("");
	// 동적으로 minDate 를 업데이트한다
	mySecondDatePicker.datepicker("option", "minDate", selectedDate);
	
}// end OnSelect
}); // end 데이트피커

//완료날짜 시작점
$("#workOrderDoneBegin").datepicker({
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
        // 지시/수정날짜 끝점(데이트피커)을 초기화하고 동적변경을 위해 데이트피커의 초기값을 변수에 담는다
        var mySecondDatePicker = $("#workOrderDoneEnd").datepicker({
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
        });

        // 입고예정일 끝점을 선택할 수 있게한다
        $("#workOrderDoneEnd").removeAttr("disabled");
        // 입고예정일 끝점을 초기화한다
        $("#workOrderDoneEnd").val("");
        // 동적으로 minDate 를 업데이트한다
        mySecondDatePicker.datepicker("option", "minDate", selectedDate);
    }
});



//엔터키 입력시 검색되게 이벤트 리스너 활성화
document.addEventListener("keyup", function(event) {
    if (event.key === 'Enter') {
    	workOrderSearch();
    }// end if
});// end function
</script>
</body>
</html>