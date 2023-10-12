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
        <title>Tables - SB Admin</title>
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
                            
                            
                            진행상태
							<select id="rs_process">
  								<option value="">전체</option>
  								<option value="1">진행중</option>
  								<option value="2">마감</option>
							</select>
							<input type="text" name="content" size=60 placeholder="실적코드를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="resultSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	                                        	
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllRSList"></th>
                                            <th>실적 코드</th>
                                            <th>작업 지시 코드</th>
                                            <th>작업 지시 완료 날짜</th>
                                            <th>라인 코드</th>
                                            <th>완제품 코드</th>
                                            <th>지시 수량</th>
                                            <th>양품</th>
                                            <th>불량</th>
                                            <th>불량 사유</th>
                                            <th>진행 현황</th>                                            
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
                                            <c:if test="${ResultDTO.rs_process eq 0}">
                                            	<td>진행중</td>
                                            </c:if>
                                            <c:if test="${ResultDTO.rs_process eq 1}">
                                            	<td>마감</td>
                                            </c:if>
                                            <td>${ResultDTO.remark}</td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
</form>
                            </div>
                        </div>
                        <input type="button" value="엑셀파일다운" id="excelRS">
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
				url : '${pageContext.request.contextPath}/head_Ajax/resultSearch',
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
				    	
				    	// 상태표현을 위한변수 선언
				    	var status = "";
				    	if(data.rs_process == 0){
				    		status = "진행중";
				    	} else {
				    		status = "마감";
				    	}
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
			        	"<td>"+data.rs_process+"</td>",
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

	//부모창에서 전달받을때 수량 업데이트
	function openUpdate() {
		// 수주량을 가져온다
		var orderAmount = parseInt($("#order_amount").val());
		// 불량갯수를 가져온다
		var faultyProd = parseInt($("#faulty_prod").val());
		// 양품갯수 계산한다
		var good_prod = order_amount - faulty_prod;
	
		// 밸류값을 최종양품 갯수로 변경한다
		$("#good_prod").val(goodProd);
	} // end function


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
	    '<td><input type="text" id="work_code" name="work_code" readonly></td>',
	    '<td><input type="text" id="done_date" name="done_date" readonly></td>',
	    '<td><input type="text" id="line_code" name="line_code" readonly></td>',
	    '<td><input type="text" id="prod_code" name="prod_code" readonly></td>',
	    '<td><input type="text" id="order_amount" name="order_amount" readonly></td>',
	    '<td><input type="text" id="goodProd" name="goodProd" placeholder="(자동으로 계산됨)" readonly></td>',
	    '<td><input type="text" id="faulty_prod" name="faulty_prod" ></td>',
	    '<td><input type="text" id="in_plan_date" name="in_plan_date" readonly></td>',
	    '<td><input type="text" id="faulty_reason" name="faulty_reason" ></td>',
	    '<td><select  id="rs_process" name="rs_process" required>' +
	    ' <option value="0"> 진행중</option>' +
	    ' <option value="1"> 마감</option>' +
	    ' </select>' +
	    '</td>'
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


	// 원자재 코드를 선택하면 새창을 여는 이벤트 리스너
	$(document).on("click", "input[name='work_code']", function() {
		window.open('${pageContext.request.contextPath }/factory/workOrderListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
	});// end function



</script>

</body>
</html>
