<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<main>
	<!-- 내용 들어가는 곳 -->
		<div class="container-fluid px-4">                       
		<h1 class="mt-4">소요량</h1>        
		                
<ol class="breadcrumb mb-4">
<!-- <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--<li class="breadcrumb-item active">Tables</li> --> 
</ol>
<div class="bnt">
<input type="button" value="추가" onclick="requirementAdd()">
</div>
<div class="card mb-4">
<div class="card-header">
<select id="category" name="category">
	<option value="req_code">소요량 코드</option>
  	<option value="prod_code">제품 코드</option>
</select>
<input type="text" name="content" size="60" placeholder="검색어를 입력하세요" id="content">
<input type="button" name="requirementSearch" value="검색" onclick="requirementSearch()">
</div>
<div class="card-body">

<!-- <input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content"> -->
<!-- <input type="button" name="search" value="조회" onclick="productSearch()"> -->

<table id="datatablesSimple">   
	<thead>
	<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
		
		<tr>
				<th>순서</th>
				<th>코드</th>
				<th>완제품 코드</th>
				<th>원자재 코드</th>
<!-- 				<th>소요량등록일</th> -->
				<th>소요량</th>
<!-- 				<th>소요량수정일</th> -->
				<th>비고</th>
				<th>관리</th>
		</tr>
	</thead>
                                
	<tbody>
	<!--순서값 1씩 증가 시키기 위한 rowNum -->
	<c:set var="rowNum" value="0" />
		<c:forEach var="requirementDTO" items="${requirementList}">
	<c:set var="rowNum" value="${rowNum + 1}" />
		<tr>
				<!--<th class="eachCheck"> -->
				<!--<input type="checkbox" name="cbox" class="eachCheckbox"></th> -->
				<td>${rowNum}</td> <!-- 순서 -->
				<td>${requirementDTO.req_code}</td> <!--소요량 코드 -->
				<td>${requirementDTO.prod_code}</td> <!-- 완제품 코드 -->
				<td>${requirementDTO.raw_code }</td> <!-- 원자재 코드 -->
<%-- 				<td>${fn:substring(requirementDTO.req_insertDATE, 0, 10)}</td><!--  소요량 등록일--> --%>
				<td>${requirementDTO.req_amount }</td><!-- 소요량 -->
<%-- 				<td>${fn:substring(requirementDTO.req_upDATEDATE, 0, 10)}</td><!-- 수정일 --> --%>
				<td>${requirementDTO.req_note }</td><!-- 비고 -->
				<td><input type="button" value="수정" onclick="requirementUpdate('${requirementDTO.req_code}')">
				<input type="button" value="삭제" onclick="confirmDelete('${pageContext.request.contextPath}/factory/deleteRequirement?req_code=${requirementDTO.req_code}')">
				</td>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/requirement_im.js"></script>
        
     	
<script type="text/javascript">

//조회를 눌렀을때 실행되는 물품 검색관련 함수
function requirementSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/factory_ajax/requirementSearch',
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
 				    var num = 0;
 				    json.forEach(function (data) {
 				    	// tr 태그 생성
 				        var $tr = $('<tr>');
 				    		num+=1;
 				    		//tr 에 내용추가
 				        	$tr.append(			
 				        	"<td>"+num+"</td>",
 				        	"<td>"+data.req_code+"</td>",
 				            "<td>"+data.prod_code+"</td>",
 				           	"<td>"+data.raw_code+"</td>",
 				            "<td>"+data.req_insertDATE+"</td>",
 				         	"<td>"+data.req_amount+"</td>",
//  				         	"<td>"+data.req_upDATEDATE+"</td>",
 				         	"<td>"+data.req_note+"</td>",
 				         	 '<td>' +
 				            '<input type="button" value="수정" onclick="requirementUpdate(\'' + data.req_code + '\')">' +
 				            '<input type="button" value="삭제" onclick="confirmDelete(\'' + '${pageContext.request.contextPath}/factory/deleteRequirement?req_code=' + data.req_code + '\')">' +
 				            '</td>' 
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
      });// end_of_ajax
}// end function

// 기능 함수 종료
//         삭제시 확인,취소 버튼 띄운 후
function confirmDelete(deleteUrl) {
    if (confirm("삭제하시겠습니까?")) {
        // 확인 버튼을 눌렀을 때만 삭제 요청을 보냄
        window.location.href = deleteUrl;
    } else {
        // 취소 버튼을 눌렀을 때의 처리 (생략 가능)
    }
}
// 등록 페이지 팝업
 function requirementAdd(){        
	window.open('${pageContext.request.contextPath }/factory/requirementAdd', '_blank', 'width=968px, height=292px, left=400px, top=300px');
} //end function

// 수정 페이지 팝업
 function requirementUpdate(req_code){      
// 	alert(req_code);
	window.open('${pageContext.request.contextPath }/factory/requirementUpdate?req_code='+req_code+'', '_blank', 'width=1049px, height=286px, left=400px, top=300px');
} 
	
</script>

    </body>
</html>
