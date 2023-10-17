<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
  <link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
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
		<h1 class="mt-4">소요량 관리</h1>        
		                
<ol class="breadcrumb mb-4">
<!-- <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--<li class="breadcrumb-item active">Tables</li> --> 
</ol>
<div class="bnt">
<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
<input type="button" value="추가" onclick="requirementAdd()">
</c:if>
</div>
<div class="card mb-4">
<div class="card-header">
<div class="cardHeaderFirstLine">
<select id="category" name="category">
	<option value="req_code">소요량 코드</option>
  	<option value="prod_code">제품 코드</option>
</select>&nbsp;
<input type="text" name="content" size="60" placeholder="검색어를 입력하세요" id="content">&nbsp;
<input type="button" name="requirementSearch" value="검색" onclick="requirementSearch()">
</div>
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
				<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
				<th>관리</th>
				</c:if>
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
				<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
				<td>
				
				<input type="button" value="수정" onclick="requirementUpdate('${requirementDTO.req_code}')">
				<input type="button" value="삭제" onclick="confirmDelete('${pageContext.request.contextPath}/factory/deleteRequirement?req_code=${requirementDTO.req_code}')">
				
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        
     	
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

// 돔이 로드될떄 테이블 초기화
window.addEventListener('DOMContentLoaded', event => {
	simpleDataTable();
});

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

					// 아무것도 출력할게 없을때 선택자가 삭제되어 테이블을 더이상 초기화하지 못하는 문제가 있음
				   	// 따라서 조건문으로 0개가 아닐때만 테이블을 삭제함
				 	if(json.length !== 0){
				    	simpleDataTableInstance.destroy();
				 	}
 				  
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
 				         	"<td>"+data.req_amount+"</td>",
 				         	"<td>"+data.req_note+"</td>",
 				         	 '<td>' +
 				            '<input type="button" value="수정" onclick="requirementUpdate(\'' + data.req_code + '\')">' +
 				            "&nbsp;"+
 				            '<input type="button" value="삭제" onclick="confirmDelete(\'' + '${pageContext.request.contextPath}/factory/deleteRequirement?req_code=' + data.req_code + '\')">' +
 				            '</td>' 
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
	window.open('${pageContext.request.contextPath }/factory/requirementAdd', '_blank', 'width=968px, height=323px, left=400px, top=300px');
} //end function

// 수정 페이지 팝업
 function requirementUpdate(req_code){      
// 	alert(req_code);
	window.open('${pageContext.request.contextPath }/factory/requirementUpdate?req_code='+req_code+'', '_blank', 'width=1049px, height=316px, left=400px, top=300px');
} 
	
</script>

    </body>
</html>
