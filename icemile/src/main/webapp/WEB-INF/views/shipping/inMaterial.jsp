<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<!-- 내용들어가는곳 -->
<div class="container-fluid px-4">
<h1 class="mt-4">입고</h1>
<ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
</ol>
<div class="bnt">
<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
<input type="button" value="추가" onclick="in_material_add()">
</c:if>
</div>
<div class="card mb-4">
<div class="card-header">
<div class="cardHeaderFirstLine">
<select id="category" name="category">
	<option value="in_code">입고 코드</option>
  	<option value="in_wh_code">창고 코드</option>
  	<option value="raw_order_code">발주 코드</option>
</select>&nbsp;
<input type="text" name="content" size="60" placeholder="검색어를 입력하세요" id="content">&nbsp;
<input type="button" name="inMateSearch" value="검색" onclick="inMateSearch()">
</div>
</div>

<div class="card-body">

<table id="datatablesSimple">
                                
<thead>
<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
<tr>
<th>순서</th>
<th>입고코드</th> <!-- IN+년월일+거래처코드+1 IN230924_1 -->
<th>창고코드</th> <!-- 창고 팝업으로 리스트 불러오기 -->
<th>발주코드</th> <!-- 발주코드 팝업 리스트/코드,주문량,입고예정일,진행상황,담당자 -->
<th>원자재명</th> 
<th>발주량</th>
<th>입고량</th>
<th>거래처</th>
<th>담당자</th>   <!-- 입고담당자 팝업 리스트 불러오기 -->
<th>입고현황</th>	<!-- 1(입고전),2(입고중),3(입고확정) -->
<!-- <th>수정일</th> -->
<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
<th>관리</th>
</c:if>
</tr>
</thead>

<tbody>
<!--순서값 1씩 증가 시키기 위한 rowNum -->
<c:set var="rowNum" value="0" />
<c:forEach var="inMaterialDTO" items="${inMaterialList }">
<c:set var="rowNum" value="${rowNum + 1}" />
<tr>
<!-- <th class="eachCheck"> -->
<!-- <input type="checkbox" name="cbox" class="eachCheckbox"></th> -->
<td>${rowNum}</td> <!-- 순서 -->
<td>${inMaterialDTO.in_code }</td> <!-- 입고코드 -->
<td>${inMaterialDTO.in_wh_code }</td> <!-- 창고코드 -->
<td>${inMaterialDTO.raw_order_code }</td> <!-- 발주코드 -->
<td>${inMaterialDTO.raw_name }</td> <!-- 원자재명 -->
<td>${inMaterialDTO.raw_order_amount }</td> <!-- 발주량 -->
<td>${inMaterialDTO.in_amount }</td> <!-- 입고량 -->
<td>${inMaterialDTO.buy_name }</td><!-- 거래처 -->
<td><a href="#" class="emp-num-link" data-emp-num="${inMaterialDTO.emp_num}">${inMaterialDTO.emp_num}</a></td>
<%-- <td>${inMaterialDTO.emp_num }</td>	<!-- 담당자 --> --%>
<td>
  <c:choose>
    <c:when test="${inMaterialDTO.in_status == 1}">입고전</c:when>
    <c:when test="${inMaterialDTO.in_status == 2}">입고중</c:when>
    <c:when test="${inMaterialDTO.in_status == 3}">입고확정</c:when>
    <c:otherwise>알 수 없음</c:otherwise>
  </c:choose>
</td>
<%-- <td>${inMaterialDTO.in_status}</td> <!-- 입고현황 --> --%>
<%-- <td>${inMaterialDTO.updatedate }</td> --%>
<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
<td>
<input type="button" value="수정" ${inMaterialDTO.in_status == 3 ? 'disabled' : ''} onclick="inMaterialUpdate('${inMaterialDTO.in_code}')">
<%-- <input type="button" value="삭제" onclick="confirmDelete('${pageContext.request.contextPath}/shipping/deleteInMaterial?in_code=${inMaterialDTO.in_code }')"> --%>
<input type="button" value="삭제" ${inMaterialDTO.in_status == 3 ? 'disabled' : ''} onclick="confirmDelete('${pageContext.request.contextPath}/shipping/deleteInMaterial?in_code=${inMaterialDTO.in_code }')">
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

//조회를 눌렀을때 실행되는 물품 검색관련 함수
function inMateSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/Shipping_ajax/inMateSearch',
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
 				        	"<td>"+data.in_code+"</td>",
 				            "<td>"+data.in_wh_code+"</td>",
 				           	"<td>"+data.raw_order_code+"</td>",
 				           "<td>"+data.raw_name+"</td>",
 				          "<td>"+data.raw_order_amount+"</td>",
 				         "<td>"+data.in_amount+"</td>",
 				            "<td>"+data.buy_name+"</td>",
 				            "<td>"+data.emp_num+"</td>",
 				         	"<td>"+data.in_status+"</td>",
 				         	 '<td>' +
 				            '<input type="button" value="수정" onclick="inMaterialUpdate(\'' + data.in_code + '\')">' +
 				            '&nbsp;'+
 				            '<input type="button" value="삭제" onclick="confirmDelete(\'' + '${pageContext.request.contextPath}/shipping/deleteRequirement?req_code=' + data.req_code + '\')">' +
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
 function in_material_add(){        
	window.open('${pageContext.request.contextPath }/shipping/in_material_add', '_blank', 'width=1166px, height=327px, left=600px, top=300px');
} //end function

//수정 페이지 팝업
function inMaterialUpdate(in_code){      
//	alert(in_code);
	window.open('${pageContext.request.contextPath }/shipping/inMaterialUpdate?in_code='+in_code+'', '_blank', 'width=780px, height=319px, left=600px, top=300px');
} //end function

// 담당자 클릭 시 정보 확인
$(document).ready(function() {
	
	$(document).on("click", ".emp-num-link", function(event) {
        event.preventDefault();
        var empNum = $(this).data("emp-num"); // 클릭한 링크의 emp_num 값을 가져옵니다.

        // 팝업 창 크기 및 위치 설정
        var width = 590;
        var height = 705;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        // 팝업 창 열기
        var url = '${pageContext.request.contextPath}/member/managerInfo?emp_num=' + empNum; // 팝업에 필요한 데이터를 URL에 포함
        var popupWindow = window.open(url, '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

        // 팝업 창 포커스
        popupWindow.focus();
    });
});

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


</script>
    </body>
</html>
