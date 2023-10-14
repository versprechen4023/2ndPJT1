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
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
            <form id="resultList">
            
                <main>
                <!-- 내용 들어가는 곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">생산 실적</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
							<input type="button" value="추가" id="rsAdd">
							<input type="button" value="수정" id="rsupdate">
							<input type="button" value="삭제" id="rsdelete">
							<input type="button" value="취소" id="rscancel" disabled>
							<input type="button" value="저장" id="rssave" disabled>
						</c:if>
						</div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
                           
                            
                            완료일자
                            <input type="text" name="done_dateBegin" id="done_dateBegin"> ~
                            <input type="text" name="done_dateEnd" id="done_dateEnd" disabled>
                            <br>
                            
                            
							<input type="text" name="content" size=60 placeholder="실적코드를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="resultSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	                                        	
                                        	<th data-sortable="false"><input type="checkbox" id="selectedAllRSId" name="selectedAllRSId"></th>
                                            <th>실적 코드</th>
                                            <th>작업 지시 코드</th>
                                            <th>작업 지시 완료 날짜</th>
                                            <th>라인 코드</th>
                                            <th>완제품 코드</th>
                                            <th>지시 수량 (EA)</th>
                                            <th>양품 (EA)</th>
                                            <th>불량 (EA)</th>
                                            <th>불량 사유</th>
                                            <th>비고</th>

                                        </tr>
                                    </thead>
                                
                                    <tbody>
                                   	<c:forEach var="ResultDTO" items="${resultList}">
                                        <tr>
                                        	<td><input type="checkbox" name="selectedRSList" value="${ResultDTO.result_code}"></td>
                                            <td>${ResultDTO.result_code}</td> 
                                            <td>${ResultDTO.work_code}</td>
                                          	<c:choose>
   												<c:when test="${empty ResultDTO.done_date}">
        											<td>-</td>
    											</c:when>
    											<c:otherwise>
        											<td>${ResultDTO.done_date}</td>
    											</c:otherwise>
											</c:choose>
                                            <td>${ResultDTO.line_code}</td>
                                            <td>${ResultDTO.prod_code}</td>
                                            <td>${ResultDTO.order_amount}</td>
                                            <td>${ResultDTO.good_prod}</td>
                                            <td>${ResultDTO.faulty_prod}</td>
                                            <td>${ResultDTO.faulty_reason}</td>
                                            <td>${ResultDTO.remark}</td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
</form>
                            </div>
                        </div>
                      </div>
                      <input type="button" value="엑셀파일다운" id="excelRS">
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

//실적 검색 관련 함수
function resultSearch(){
	// 값을 전달 하기위한 JSON 타입 변수선언
	   var json = {
			   		done_dateBegin: $('#done_dateBegin').val(),
			   		done_dateEnd: $('#done_dateEnd').val(),
			   		status: $('#status').val(),
    				content: $('#content').val()	
					}; //JSON
					
		// 검색 결과값을 받아오기 위한 ajax 호출
		$.ajax({
				url : '${pageContext.request.contextPath}/head_ajax/resultSearch',
				// JSON타입의 변수를 스트링으로 변환한다
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
					
				    // json 배열에 값이 없는 경우 추가가 안되는걸 방지하기위한 tr태그 생성
				    if(json.length === 0){
				    	// tr 태그 생성
				        var $tr = $('<tr>');
				        $('tbody').append($tr);
				    }
				    // 배열 크기만큼 반복
				    json.forEach(function (data) {
				    	
// 				    	// 상태표현을 위한변수 선언
// 				    	var status = "";
// 				    	if(data.rs_process == 0){
// 				    		status = "진행중";
// 				    	} else {
// 				    		status = "마감";
// 				    	}
				    	// tr 태그 생성
				        var $tr = $('<tr>');
				    	//tr 에 내용추가
				    	$tr.append(
					    '<td><input type="checkbox" name="selectedRSList" value="' + data.result_code + '"></td>',
			        	"<td>"+data.result_code+"</td>",
			        	"<td>"+data.work_code+"</td>",
			        	"<td>"+data.done_date+"</td>",
			        	"<td>"+data.line_code+"</td>",
			        	"<td>"+data.prod_code+"</td>",
			        	"<td>"+data.order_amount+"</td>",
			        	"<td>"+data.good_prod+"</td>",
			        	"<td>"+data.faulty_prod+"</td>",
			        	"<td>"+data.faulty_reason+"</td>",
			        	"<td>"+data.remark+"</td>"
						);
				    	// 생성한 <tr> 요소를 tbody에 추가
				        $('tbody').append($tr);
			  		});
				 // 페이징 동적 처리
				    // 태그 개수 구하기
				    var trCount = $('tbody tr').length;
				    // 페이징 처리를 위한 변수선언(태그 개수 계산)
				    var pageCount = trCount / 10 + (trCount % 10 == 0 ? 0 : 1);
				    // 페이징 계산을 위한 삭제값을 담을 배열 변수선언
				   	var dataPageValues = [];
				    	// 페이징 버튼의 밸류값을 추출 한다
				  		$('.datatable-pagination-list-item a').each(function() {
				      		var dataPageValue = $(this).data('page');
				      		dataPageValues.push(dataPageValue);
				  		});
				    	
				  	// 삭제할 버튼값을 추출한다(페이징 카운트를 기준으로 한다)
				  	dataPageValues = dataPageValues.filter(function(value) {
					return value > parseInt(pageCount);
					});
				  	
				  	// 중복을 삭제한다 indexOf로 첫번째 위치만을 출력한다 중복된다면 첫번째위치가 아닌 다른위치에 있을 것이므로
				  	// 모두 false 처리하여 삭제한다
				  	var myArray = dataPageValues.filter(function(value, index, self) {
					return self.indexOf(value) === index;
					});
				  	
				  	// 삭제할 for문의 시작점이될 최소값과 최대값 구하기
				  	var minValue = Math.min(myArray);
				  	var maxValue = Math.max(myArray);
				  	
				  	// 글이 11개 이하라면(즉 페이징이 필요없는경우)
				    if(trCount < 11){
				    	// 페이징을 삭제
				   	    $('.datatable-pagination-list').remove();
				    } else {
				    	// 그렇지 않은경우 글개수를 넘은 페이징버튼을 모두 삭제한다 
				    	for(var i = minValue; i<=maxValue; i++){
				    		$('.datatable-pagination-list-item a[data-page="'+i+'"]').remove();
				    	}
				    }
				  	
		      }// 콜백함수 종료지점
		}); // end_of_ajax
		
}// end function()

	/* //부모창에서 전달받을때 수량 업데이트
	function openUpdate() {
		// 수주량을 가져온다
		var orderAmount = parseInt($("#order_amount").val());
		// 불량갯수를 가져온다
		var faultyProd = parseInt($("#faulty_prod").val());
		// 양품갯수 계산한다
		var goodProd = orderAmount - faultyProd;
	
		// 밸류값을 최종양품 갯수로 변경한다
		$("#good_prod").val(goodProd);
	} // end function
 */
	// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
	$('input[name="selectedRSList"]').click(function() {
	    // 모든 selectedProId 체크박스의 상태를 selectedAllRawOrderId와 동일하게 설정한다
	    // $this로 AllProId의 상태를 가져온다
	    $('input[name="selectedRSList"]').prop('checked', $(this).prop('checked'));
	});// end function
	
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



	// 추가 버튼 누를 시 실행되는 함수
	$("#rsAdd").click(function () {
	  // 상태를 저장으로 변경
	  status = "save";

	  // tr에 값을 삽입하기위한 변수선언
	  var $tr = $("<tr>");

	  // tr에 내용 추가
	  $tr.append(
	    '<td><input type="checkbox" name="selectedRSList" disabled></td>',
	    '<td><input type="text" id="result_code" name="result_code" placeholder="(자동으로 부여)" readonly></td>',
	    '<td><input type="text" id="work_code" name="work_code" placeholder="작업 지시 코드 선택" readonly></td>',
	    '<td><input type="text" id="done_date" name="done_date" readonly></td>',
	    '<td><input type="text" id="line_code" name="line_code" readonly></td>',
	    '<td><input type="text" id="prod_code" name="prod_code" placeholder="완제품 코드 선택" readonly></td>',
	    '<td><input type="text" id="order_amount" name="order_amount" ></td>',
	    '<td><input type="text" id="good_prod" name="good_prod" placeholder="(자동으로 계산됨)" readonly></td>',
	    '<td><input type="text" id="faulty_prod" name="faulty_prod" placeholder="불량품 개수 입력"></td>',
	    '<td><input type="text" id="faulty_reason" name="faulty_reason" placeholder="불량 사유 입력" ></td>',
	    '<td><input type="text" id="remark" name="remark" placeholder="입력해 주세요"></td>'
	  );

	  // 생성한 <tr> 요소를 tbody에 추가
	  $('tbody tr:nth-child(1)').before($tr);

	  // 발주 추가 중에 발주 추가, 수정, 삭제 버튼을 비활성화한다
	  $("#rsAdd").attr('disabled', 'disabled');
	  $("#rsupdate").attr('disabled', 'disabled');
	  $("#rsdelete").attr('disabled', 'disabled');

	  // 발주 추가 중에 취소, 저장 버튼 입력이 가능하다
	  $("#rscancel").removeAttr("disabled");
	  $("#rssave").removeAttr("disabled");
	});

	// 수정 버튼 누를 시 실행되는 함수
	$("#rsupdate").click(function () {

	    // 상태를 업데이트로 변경한다
	    status = "update";

	    // 체크박스가 체크된 여부를 확인하기 위한 변수 선언
	    var selectedCheckbox = $("input[name='selectedRSList']:checked");

	    // 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	    if (selectedCheckbox.length === 1) {

	        // 텍스트태그를 추가할 tr태그를 선택한다
	        var row = selectedCheckbox.closest("tr");

	        // input type의 name 값 지정
	        var cellNames = [
	            "result_code",
	            "work_code",
	            "done_date",
	            "line_code",
	            "prod_code",
	            "order_amount",
	            "good_prod",
	            "faulty_prod",
	            "faulty_reason",
	            "remark"
	        ];

	        // input type의 id 값 지정
	        var cellIds = [
	            "result_code",
	            "work_code",
	            "done_date",
	            "line_code",
	            "prod_code",
	            "order_amount",
	            "good_prod",
	            "faulty_prod",
	            "faulty_reason",
	            "remark"
	        ];

	        // 셀렉트 태그를 위한 변수 선언
	        var select = "";

	        // 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
	        row.find("td:not(:first-child)").each(function (index) {

	            // 기존 텍스트 값을 변수에 저장한다
	            var cellValue = $(this).text();
	            // 셀에 옵션을 주기 위해 변수를 선언한다
	            var cellOption = ""
	            // 삼항연산자 6번째 행(발주량)및 10번째 행(입고예정일)을 제외하고는 비활성화로 변경할 수 없다
	            // 단 셀렉트태그는 직접 부여되므로 마찬가지로 수정 할 수 있다
	            if (index === 6 || index === 10) {
	                cellOption = "";
	            } else {
	                cellOption = "abled";
	            }

	            // 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
	            var cellName = cellNames[index];
	            // 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
	            var cellId = cellIds[index];

	            // 반복문에 따라 이너 html 실행 모든 입력칸을 텍스트태그로 바꾼다 단 11행은 셀렉트태그
	            
	                $(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');
	            
	        }); // end_find(행 검색 반복문 종료지점)

	        // 발주수정중에 발주추가, 수정, 삭제 버튼을 비활성화한다
	        $("#rsAdd").attr('disabled', 'disabled');
	        $("#rsupdate").attr('disabled', 'disabled');
	        $("#rsdelete").attr('disabled', 'disabled');

	        // 발주수정중에 취소, 저장 버튼 입력이 가능하다
	        $("#rscancel").removeAttr("disabled");
	        $("#rssave").removeAttr("disabled");

	        
	        
	    } // end if

	    // 체크박스가 선택되어있지 않으면 에러가 발생한다
	    else if (selectedCheckbox.length === 0) {
	        Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
	    }
	    // 여러개가 체크되어있으면 에러가 발생한다
	    else {
	        Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');
	    } // end else
	}); // end function

	// 취소 버튼 누를 시 실행되는 함수
	$("#rscancel").click(function () {

	    // 상태가 수정인 경우 초기화 작업 실행
	    if (status === "update") {

	        // 테이블 모든 행에 대해 반복 작업 실행
	        $("#datatablesSimple tr").each(function () {

	            // 행 위치를 얻기 위한 변수 선언
	            var row = $(this);

	            // 폼 태그 안의 모든 데이터를 초기값으로 리셋한다
	            $("#resultList")[0].reset();

	            // 각 셀의 값을 원래 상태로 되돌린다 (마찬가지로 첫 번째 셀은 제외한다)
	            row.find("td:not(:first-child)").each(function (index) {

	                // 텍스트 태그의 값을 찾는다
	                var cellValue = $(this).find("input").val();

	                if ($(this).find("select").length) {
	                    // 셀렉트 텍스트 값(발주중)을 변수에 삽입한다
	                    var selected = $(this).find("select option:selected").text();
	                    // 셀렉트가 있는 경우 셀렉트가 선택된 옵션의 텍스트로 변경한다 (어차피 발주확정 상태에서는 수정할 수 없으므로 항시 발주중이 된다)
	                    // 만약 발주확정 상태에서도 수정하게 하려면 삼항연산자로 추가 수정등에 selected 옵션을 부여해야 한다
	                    $(this).html(selected);
	                } else {
	                    // 텍스트 태그를 삭제하고 값만 td 태그에 삽입한다
	                    $(this).html(cellValue);
	                }

	            }); // end_find(행 검색 반복문 종료지점)
	        }); // end_each(행 반복문 종료지점)

	    }
	    // 상태가 저장인 경우 삭제 작업 실행
	    else if (status === "save") {
	        // 추가한 행을 삭제한다
	        $("tbody tr:nth-child(1)").remove();
	    }

	    // 취소가 완료되면 취소, 저장 버튼을 비활성화한다
	    $("#rscancel").attr('disabled', 'disabled');
	    $("#rssave").attr('disabled', 'disabled');

	    // 다시 발주등록, 수정, 삭제를 할 수 있게 활성화한다
	    $("#rsAdd").removeAttr("disabled");
	    $("#rsupdate").removeAttr("disabled");
	    $("#rsdelete").removeAttr("disabled");
	}); // end function


	// 저장 버튼 누를 시 실행되는 함수
	$("#rssave").click(function () {
	    // 상태가 수정인 경우 수정 작업 실행
	    if (status === "update") {

	        // 동적으로 생성된 셀렉트 태그는 인식되지 않으므로 셀렉트 태그의 값은 직접 가져온다
	       
	        // 데이터를 전송하기 위한 폼 데이터 직렬화 및 셀렉트 태그 값을 직접 추가한다
	        var formData = $('#resultList').serialize();
	        console.log(formData);

	        // AJAX 제출 전에 값이 입력되어 있는지 정규식 검사를 수행한다
// 	        if (formTest(formData)) {
	            // AJAX 실행
	            $.ajax({
	                type: "POST",
	                url: "${pageContext.request.contextPath}/head_ajax/resultUpdate",
	                data: formData,
	                // 통신 성공시 콜백 함수 response 매개변수에 "true" 또는 "false" 결과값이 입력된다
	                success: function (response) {
	                    // 공백을 제거한다
	                    const result = $.trim(response);

	                    if (result == "true") {
	                        Swal.fire('실적 수정이 완료되었습니다.', '성공', 'success').then(result => {
	                            // 사용자가 확인창을 누르면 실행
	                            if (result.isConfirmed) {
	                                location.reload(); // 성공 시 새로고침한다
	                            }
	                        });
	                    } else {
	                        Swal.fire('실적 수정에 문제가 발생했습니다.', '실패', 'error');
	                    }
	                },
	                error: function () {
	                    Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
	                }
	            });
// 	        } // end 정규식 검사

	    }
	    // 상태가 추가인 경우 추가 작업 실행
	    else if (status === "save") {
	        // 데이터를 전송하기 위한 폼 데이터 직렬화
	        var formData = $('#resultList').serialize();

	        // AJAX 제출 전에 값이 입력되어 있는지 정규식 검사를 수행한다
// 	       if (formTest(formData)) {
	            // AJAX 실행
	            $.ajax({
	                type: "POST",
	                url: "${pageContext.request.contextPath}/head_ajax/resultInsert",
	                data: formData,
	                // 통신 성공시 콜백 함수 response 매개변수에 "true" 또는 "false" 결과값이 입력된다
	                success: function (response) {
	                    // 공백을 제거한다
	                    const result = $.trim(response);

	                    if (result == "true") {
	                        Swal.fire('실적 추가가 완료되었습니다.', '성공', 'success').then(result => {
	                            // 사용자가 확인창을 누르면 실행
	                            if (result.isConfirmed) {
	                                location.reload(); // 성공 시 새로고침한다
	                            }
	                        });
	                    } else {
	                        Swal.fire('실적 추가에 문제가 발생했습니다.', '실패', 'error');
	                    }
	                },
	                error: function () {
	                    Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
	                }
	            });
// 	       } // end 정규식 검사
	    }
	}); // end function


	// 삭제 버튼 누를 시 실행되는 함수
	$("#rsdelete").click(function () {
	    // 체크박스가 체크된 여부를 확인하기 위한 변수 선언
	    var selectedCheckbox = $("input[name='selectedRSList']:checked");

	    // 체크박스가 선택되어 있지 않다면 에러가 발생한다
	    if (selectedCheckbox.length === 0) {
	        Swal.fire('삭제할 행을 선택해 주십시오.', '실패', 'error');
	        return false;
	    }

	    // 체크박스가 선택되어 있다면 함수 실행

	    // 데이터를 전송하기 위한 폼 데이터 직렬화
	    var formData = $('#resultList').serialize();

	    // AJAX 제출 전에 값이 입력되어 있는지 정규식 검사를 수행한다
// 	    if (formTest(formData)) {
	        // 문제가 없다면 AJAX 실행
	        $.ajax({
	            type: "POST",
	            url: "/home/head_ajax/resultDelete",
	            data: formData,
	            // 통신 성공시 콜백 함수 response 매개변수에 "true" 또는 "false" 결과값이 입력된다
	            success: function (response) {
	                // 공백을 제거한다
	                const result = $.trim(response);

	                if (result == "true") {
	                    Swal.fire('실적 삭제가 완료되었습니다.', '성공', 'success').then(result => {
	                        // 사용자가 확인창을 누르면 실행
	                        if (result.isConfirmed) {
	                            location.reload(); // 성공 시 새로고침한다
	                        }
	                    });
	                } else {
	                    Swal.fire('실적 삭제에 문제가 발생했습니다.', '실패', 'error');
	                }
	            },
	            error: function () {
	                Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
	            }
	        });
// 	    } // end 정규식 검사
	}); // end function

	
	// 기능 함수 종료


// 이벤트 관련 함수 시작지점

// 작업지시 코드를 선택하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='work_code']", function() {
		window.open('${pageContext.request.contextPath }/factory/workOrderPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function
	
//	// 라인 코드를 선택하면 새창을 여는 이벤트 리스너
//	$(document).on("click", "input[name='line_code']", function() {
//		window.open('${pageContext.request.contextPath }/factory/facilityPopUp2', '_blank', 'width=590px, height=770px, left=600px, top=300px');
//	});// end function
	
	// 완제품 코드를 선택하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='prod_code']", function() {
		window.open('${pageContext.request.contextPath }/product/productListPopUp2', '_blank', 'width=590px, height=770px, left=600px, top=300px');
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
	
	// 양품 계산
	$(document).on("input", "#faulty_prod", function() {
		// 수주량을 가져온다
		var order_amount = parseInt($("#order_amount").val());
		console.log(order_amount);
		// 단가를 가져온다
		var faulty_prod = parseInt($(this).val());
		console.log(faulty_prod);

		// 수주량과 단가를 계산한다
		var result = order_amount - faulty_prod;
		console.log(result);

		// 밸류값을 최종가격으로 변경한다
		if (isNaN(result) || result == 0) {
		    $("#good_prod").val("");
		} else {
		    $("#good_prod").val(result);
		}

		
	});
	
	$(document).ready(function() {
	// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
	$('#selectedAllRSId').click(function() {
    // 모든 selectedRSList 체크박스의 상태를 selectedAllRSId와 동일하게 설정한다
    $('input[name="selectedRSList"]').prop('checked', $(this).prop('checked'));
	});
	});
	


	//엑셀 버튼 누를 시 실행되는 함수
	$("#excelRS").click(function(){
		
		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedRSList']:checked");
		
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
			    "실적 리스트.xlsx"
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
	 		resultSearch();
			// 검색입력창을 초기화한다
	 		$('#content').val("");
		}// end if
	});// end function
	
	// 이벤트 관련 함수 종료
	
	// 기존 태그 데이트 피커 제어 함수
    // 발주일자 시작점
	$("#done_dateBegin").datepicker({
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
    	
    	// 발주일자 끝점(데이트피커)을 초기화하고 동적변경을 위해 데이트피커의 초기값을 변수에 담는다
    	var mySecondDatePicker = $("#done_dateEnd").datepicker({
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
    	$("#done_dateEnd").removeAttr("disabled");
    	// 발주일자 끝점을 초기화한다
    	$("#done_dateEnd").val("");
    	// 동적으로 minDate 를 업데이트한다
    	mySecondDatePicker.datepicker("option", "minDate", selectedDate);
    	
    }// end OnSelect
	
	}); // end 데이트피커
	
	// 입고예정일 시작점
	$("#done_dateBegin").datepicker({
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
    	
    	// 입고예정일 끝점(데이트피커)을 초기화하고 동적변경을 위해 데이트피커의 초기값을 변수에 담는다
    	var mySecondDatePicker = $("#done_dateEnd").datepicker({
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
    	$("#done_dateEnd").removeAttr("disabled");
    	// 입고예정일 끝점을 초기화한다
    	$("#done_dateEnd").val("");
    	// 동적으로 minDate 를 업데이트한다
    	mySecondDatePicker.datepicker("option", "minDate", selectedDate);
    	
    }// end OnSelect
	
	}); // end 데이트피커
	


	
	

</script>

</body>
</html>
