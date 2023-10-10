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
//조회를 눌렀을때 실행되는 원자재 검색관련 함수
function productSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/product_ajax/productSearch',
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
					
 				    // 배열 크기만큼 반복
 				    json.forEach(function (data) {
 				    	// tr 태그 생성
 				        var $tr = $('<tr>');
 				    		//tr 에 내용추가
 				        	$tr.append(
 				        	"<td>"+data.product_code+"</td>",
 				            "<td>"+data.product_name+"</td>",
 				           	"<td>"+data.product_taste+"</td>"
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
 				  	
 				  	// 중복을 삭제한다
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
                        <h1 class="mt-4">품목관리</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        </div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
							<select id="category">
  								<option value="prod_code">코드</option>
  								<option value="prod_name">품명</option>
  								<option value="prod_taste">종류</option>
							</select>
							<input type="text" name="content" size=20 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="productSearch()">
</form>
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                           <th>코드</th>
                                            <th>품명</th>
                                            <th>종류</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="productDTO" items="${productListPopUp}">
                                        <tr>
                                            <td>${productDTO.prod_code}</td>
                                            <td>${productDTO.prod_name}</td>
                                            <td>${productDTO.prod_taste}</td>                                       
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
	<script src="../resources/js/productList_im.js"></script>
	
<script>
// 함수 시작지점
$(document).ready(function() {
	
	// 테이블 클릭 관련 이벤트 함수
	$(document).on("click", "tbody tr", function() {
		
		  // 값을 전달하기 위한 변수선언
		  // 이벤트가 발생되는 테이블의 첫번째(0)부터 4번째 까지 텍스트를 변수에 저장한다
	      var prod_code = $(this).find("td:eq(0)").text();
	      var prod_name = $(this).find("td:eq(1)").text();
	      var prod_taste = $(this).find("td:eq(2)").text();
		  

	      // 부모창으로 값을 전달한다
	      opener.document.getElementById("prod_code").value = prod_code;
	      opener.document.getElementById("prod_name").value = prod_name;
	      opener.document.getElementById("prod_taste").value = prod_taste;
	      
	      // 부모창에서 가격값을 갱신하기위해 함수를 호출한다
	      opener.openUpdate();
	      
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
	 		productSearch();
			// 검색입력창을 초기화한다
	 		$('#content').val("");
		}// end if
	});// end function
	
// 기능 함수 종료

});// end 함수

</script>
    </body>
</html>
