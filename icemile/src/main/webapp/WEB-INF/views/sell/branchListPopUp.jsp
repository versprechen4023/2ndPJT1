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
function branchSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/sell_ajax/search',
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
 				        	"<td>"+data.branch_code+"</td>",
 				            "<td>"+data.branch_name+"</td>",
 				           	"<td>"+data.branch_ceo+"</td>",
 				            "<td>"+data.branch_phone+"</td>",
 				            "<td>"+data.branch_email+"</td>"
 	
 				        	);
 				        // 생성한 <tr> 요소를 tbody에 추가
 				        $('tbody').append($tr);
 				    });
 				    
 					// 페이징 동적 처리
 				    // 태그 개수 구하기
 				    var trCount = $('tbody tr').length;
 				    // 페이징 처리를 위한 변수선언(태그 개수 계산)
 				    // 페이지 수가 소수점 이하는 반올림 되어 계산이 된다. 예를 들어,25개의 데이터가 있으면 3페이지가 된다.
 				    var pageCount = trCount / 10 + (trCount % 10 == 0 ? 0 : 1);
 				    // 페이징 계산을 위한 삭제값을 담을 배열 변수선언
 				    
 				    // 빈 배열을 생성하여 페이징 버튼의 데이터 값을 저장할 배열을 초기화합니다.
 				   	var dataPageValues = [];
 				    	// 페이징 버튼의 밸류값을 추출 한다
 				  		$('.datatable-pagination-list-item a').each(function() {
 				  			// 각 링크 요소에 대해 함수를 실행한다. 여기서 'this'는 현재 순회 중인 'a'태그를 가리킨다.
 				  			
 				  			// $(this).data('page')는 현재 'a' 태그의 'data-page' 속성 값을 가져옵니다.
 				  			
 				  			// 'data-page' 속성에는 각 페이지 버튼의 페이지 번호가 저장되어 있습니다.
 				      		var dataPageValue = $(this).data('page');
 				  			
 				      	    // dataPageValue를 dataPageValues 배열에 추가합니다.
 				      		dataPageValues.push(dataPageValue);
 				  		});
 				    	
 				  	// 삭제할 버튼값을 추출한다(페이징 카운트를 기준으로 한다)
 				  	dataPageValues = dataPageValues.filter(function(value) {
 				  		// 조건: value가 pageCount보다 큰 경우에만 해당 값을 남깁니다.
 				  		// 이 때, value는 페이징 버튼의 페이지 번호를 나타내며, pageCount는 표시할 페이지 수를 나타냅니다.
    					return value > parseInt(pageCount);
					});
 				  	
 				  	// 중복을 삭제한다
 				  	// 설명
 				  	// dataPageValues 배열은 이전 단계에서 얻은 페이지 버튼의 값들을 저장한 배열입니다.

                    // filter 함수를 사용하여 배열을 순회하면서 중복된 값을 필터링하려고 합니다.
                    // filter 함수는 주어진 조건에 맞는 항목만을 남기는 데 사용됩니다.

                    // filter 함수 내부의 콜백 함수는 세 가지 인자를 받습니다:

                    // value: 배열의 현재 요소 값
                    // index: 배열에서 현재 요소의 인덱스
                    // self: 배열 자체
                    // 중복된 값을 확인하기 위해 self.indexOf(value)를 사용합니다.
                    // 이 메서드는 배열 self에서 value를 검색하고, 첫 번째로 발견된 인덱스를 반환합니다.

                    // 중복되지 않는 값을 가진 항목은 self.indexOf(value)와 index가 동일하게 됩니다.
                    // 그래서 이러한 조건을 만족하는 항목만 필터링됩니다.

                    // 결과적으로, myArray 배열에는 중복을 제거한 dataPageValues 배열의 유일한 값들만이 저장됩니다.
                    // 이 배열은 중복된 페이지 버튼 값이 없는 상태를 나타냅니다.

                    // 이 코드를 사용하면 중복된 값을 가진 배열을 정리하고 유일한 값만을 가지는 배열을 얻을 수 있습니다.
                    // 이후에 이러한 배열을 사용하여 페이지 버튼을 관리하거나 삭제하는 데 사용할 수 있습니다.

 				  	var myArray = dataPageValues.filter(function(value, index, self) {
    					return self.indexOf(value) === index;
					});
 				  	
 				  	// 삭제할 for문의 시작점이될 최소값과 최대값 구하기
 				  	// 설명
 				    // myArray 배열은 이전 단계에서 중복을 제거한 페이지 버튼 값들을 저장한 배열입니다.

                    // Math.min() 함수는 주어진 배열(또는 인수 목록)에서 가장 작은 값을 찾아냅니다.
                    // 여기서는 myArray 배열 내에서 가장 작은 값을 찾아서 minValue 변수에 할당합니다.

                    // Math.max() 함수는 주어진 배열(또는 인수 목록)에서 가장 큰 값을 찾아냅니다.
                    // 여기서는 myArray 배열 내에서 가장 큰 값을 찾아서 maxValue 변수에 할당합니다.

                    // 결과적으로, minValue 변수에는 myArray 배열에서 가장 작은 값이 저장되고, maxValue 변수에는 가장 큰 값이 저장됩니다.
                    // 이 코드를 사용하면 특정 범위 내의 값 중에서 최소값과 최대값을 쉽게 찾을 수 있습니다.
                    // 이러한 최소값과 최대값은 페이징 버튼의 범위를 결정하는 데 사용될 수 있습니다.
                    
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
<form id="branchList">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">지점 관리</h1>
                        <ol class="breadcrumb mb-4">
                        </ol>
                        <div class="bnt">
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
							<select id="category">
  								<option value="branch_code">지점코드</option>
  								<option value="branch_name">지점명</option>
  								<option value="branch_ceo">대표자</option>
  								<option value="emp_num">담당자</option>
							</select>
							<input type="text" name="content" size=20 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="branchSearch()">
</form>
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                           <th>지점 코드</th>
                                            <th>지점명</th>
                                            <th>대표자</th>
                                            <th>연락처</th>
                                            <th>담당자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="sellDTO" items="${branchList}">
                                        <tr>
                                            <td>${sellDTO.branch_code}</td>
                                            <td>${sellDTO.branch_name}</td>
                                            <td>${sellDTO.branch_ceo}</td>                                       
                                            <td>${sellDTO.branch_phone}</td>                                       
                                            <td>${sellDTO.branch_email}</td>                                       
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
// 문서가 준비되면 실행될 javascript 코드를 정의한다.문서를 준비되었을떄 페이지의 모든 요소가 로드되었고 javaScript코드를 실행할수 있는 상태이다.
$(document).ready(function() {
	
	// 테이블 클릭 관련 이벤트 함수
	// 클릭한 행에서 데이터를 가져와서 부모 창의 입려필드에 값을 전달하고,부모 창의 함수를 호출한 뒤 현재창을 닫는 함수 
	$(document).on("click", "tbody tr", function() {
		
		  // 값을 전달하기 위한 변수선언
		  // 이벤트가 발생되는 테이블의 첫번째(0)부터 4번째 까지 텍스트를 변수에 저장한다
	      var branch_code = $(this).find("td:eq(0)").text();
	      var branch_name = $(this).find("td:eq(1)").text();
	      var branch_ceo = $(this).find("td:eq(2)").text();
	      var branch_phone = $(this).find("td:eq(3)").text();
	      var branch_email = $(this).find("td:eq(4)").text();
		  

	      // 부모창으로 값을 전달한다
	      // getElementById부모 창에서 해당 입력 필드를 찾고 값을 설정하기 위해 사용된다.
	      opener.document.getElementById("branch").value = branch_code;
	     
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
	 		branchSearch();
			// 검색입력창을 초기화한다
	 		$('#content').val("");
		}// end if
	});// end function
	
/////////////////////////////////////////기능함수 종료////////////////////////////////////////

});// end 함수

</script>
    </body>
</html>
