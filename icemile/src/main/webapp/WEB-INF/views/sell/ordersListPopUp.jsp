<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
<!-- J쿼리 호출 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 	자바스크립트 또 지랄나서 위치바꿈 -->
<script type="text/javascript">
//Table 초기화를 위한 전역변수 선언
var simpleDataTableInstance;

//테이블 초기화 함수
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

//돔이 로드될떄 테이블 초기화
window.addEventListener('DOMContentLoaded', event => {
	simpleDataTable();
});

//조회를 눌렀을때 실행되는 원자재 검색관련 함수
function orderListSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/sell_ajax/orderListSearch',
 			  // JSON타입의 변수를 스트링으로 변환한다
 			  data: JSON.stringify(json),
 			  // JSON타입의 변수를 전송한다
 	          contentType: 'application/json',
 			  type : 'POST',
 			  // 반환은 JSON 타입
 			  dataType: 'json',
 			  // 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
 			 success: function(json) {
 			    // 아무것도 출력할게 없을 때 선택자가 삭제되어 테이블을 더 이상 초기화하지 못하는 문제가 있음
 			    // 따라서 조건문으로 0개가 아닐 때만 테이블을 삭제함
 			    if (json.length !== 0) {
 			        simpleDataTableInstance.destroy();
 			    }

 			    // tbody 내용을 초기화
 			    $('tbody').empty();

 			    // 배열 크기만큼 반복
 			    json.forEach(function(data) {
 			        // order_status가 3인 경우에만 데이터를 테이블에 추가
 			        if (data.order_status === 3) {
 			            // tr 태그 생성
 			            var $tr = $('<tr>');
 			            // tr에 내용 추가
 			            $tr.append(
 			                "<td>"+data.order_code+"</td>",
 			                "<td>"+data.prod_name+"</td>",
 			                "<td>"+data.order_amount+"</td>",
 			                "<td>"+data.branch_code+"</td>"
 			            );
 			            // 생성한 <tr> 요소를 tbody에 추가
 			            $('tbody').append($tr);
 			        }
 			    });

 			    // 테이블 재생성 마찬가지로 데이터가 있는 경우에만 객체 재생성
 			    if (json.some(data => data.order_status === 3)) {
 			        simpleDataTable();
 			    } else {
 			        // 그렇지 않은 경우 기존 객체를 유지하고 페이징만 삭제
 			        $('.datatable-pagination-list').remove();
 			    }
 			}

      });// end_of_ajax
}// end function
</script>
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<div id="layoutSidenav_content">
<form id="productList">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">수주관리</h1>
                        <ol class="breadcrumb mb-4">
                        </ol>
                        <div class="bnt">
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
							<select id="category">
  								<option value="order_code">수주코드</option>
  								<option value="prod_name">제품명</option>
  								<option value="order_amount">주문량</option>
  								<option value="branch_code">지점코드</option>
							</select>
							<input type="text" name="content" size=20 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="orderListSearch()">
</form>
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                            <th>수주코드</th>
                                            <th>제품명</th>
                                            <th>주문량</th>
                                            <th>지점코드</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="proOrderListDTO" items="${ordersList}">
                                        <tr>
                                            <td>${proOrderListDTO.order_code}</td>
                                            <td>${proOrderListDTO.prod_name}</td>
                                            <td>${proOrderListDTO.order_amount}</td>
                                     		<td>${proOrderListDTO.branch_code}</td>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	
<script>
// 함수 시작지점
$(document).ready(function() {
	
	// 테이블 클릭 관련 이벤트 함수
	$(document).on("click", "tbody tr", function() {
		
		  // 값을 전달하기 위한 변수선언
		  // 이벤트가 발생되는 테이블의 첫번째(0)부터 3번째 까지 텍스트를 변수에 저장한다
	      var order_code = $(this).find("td:eq(0)").text();
	      var prod_name = $(this).find("td:eq(1)").text();
	      var order_amount = $(this).find("td:eq(2)").text();
	      var branch_code = $(this).find("td:eq(3)").text();
	      
		  
	      // 부모창으로 값을 전달한다
	      opener.document.getElementById("order_code").value = order_code;
	      opener.document.getElementById("out_amount").value = order_amount;
	     
	      // 창을 종료한다
	      window.close();
	      
	});// end function
	
	// 폼제출을 막고 엔터키로 조회가 가능하게 하는 함수
	// 텍스트타입 제출을 막음
	$('input[type="text"]').keydown(function() {
		// 엔터키 이벤트 발생을 확인한다
		if (event.keyCode === 13) {
			// 폼 태그 제출을 막는다
	 		event.preventDefault();
			// 검색 함수를 실행한다
			// 검색입력창을 초기화한다
	 		$('#content').val("");
		}// end if
	});// end function
	
// 기능 함수 종료

});// end 함수

</script>
    </body>
</html>
