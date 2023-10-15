<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">사원 정보 조회</h1>
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
  								<option value="emp_name">이름</option>
  								<option value="position">직급</option>
  								<option value="hotline">내선번호</option>
  								<option value="dept_name">부서</option>
							</select>
							<input type="text" name="content" size=20 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="memberSearch()">
							<table id="datatablesSimple">
								<thead>
									<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
									<tr>
										<th>사번</th>
										<th>이름</th>
										<th>직급</th>
										<th>부서</th>
										<th>내선번호</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="memberDTO" items="${memberList}">
										<tr>
											<td>${memberDTO.emp_num}</td>
											<td>${memberDTO.emp_name}</td>
											<td>${memberDTO.position}</td>
											<td>${memberDTO.dept_name}</td>
											<td>${memberDTO.hotline}</td>
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
	
<script>
//Table 초기화를 위한 전역변수 선언
var simpleDataTableInstance;

// 테이블 초기화 함수
function simpleDataTable() {
	const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
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
      info : ""
      }
        
      });
    }
}

//돔이 로드될떄 테이블 초기화
window.addEventListener('DOMContentLoaded', event => {
	simpleDataTable();
});


//조회를 눌렀을때 실행되는 원자재 검색관련 함수
function memberSearch() {
		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/member_ajax/search',
 			  // JSON타입의 변수를 스트링으로 변환한다
 			  data: JSON.stringify(json),
 			  // JSON타입의 변수를 전송한다
 	          contentType: 'application/json',
 			  type : 'POST',
 			  // 반환은 JSON 타입
 			  dataType: 'json',
 			  // 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
 			  success:function(json){
 					// 테이블을 초기화한다
				 	simpleDataTableInstance.destroy();
 					
 				    // tbody 내용을 초기화
 				    $('tbody').empty();
					
 				    // 배열 크기만큼 반복
 				    json.forEach(function (data) {
 				    	// tr 태그 생성
 				        var $tr = $('<tr>');
 				    		//tr 에 내용추가
 				        	$tr.append(
 				        	"<td>"+data.emp_num+"</td>",
 				            "<td>"+data.emp_name+"</td>",
 				           	"<td>"+data.position+"</td>",
 				            "<td>"+data.dept_name+"</td>",
 				            "<td>"+data.hotline+"</td>"
 				        	);
 				        // 생성한 <tr> 요소를 tbody에 추가
 				        $('tbody').append($tr);
 				    });
 				    
 				   // 테이블 재생성
  				   simpleDataTable();
 					
 		      }// 콜백함수 종료지점
      });// end_of_ajax
}// end function

//함수 시작지점
$(document).ready(function() {
	
	// 테이블 클릭 관련 이벤트 함수
	$(document).on("click", "tbody tr", function() {
		
	    // 클릭된 행에 대한 정보를 가져옵니다.
	    var emp_num = $(this).find("td:eq(0)").text();
	    
	    // 부모창으로 값을 전달합니다.
	    opener.document.getElementById("emp_num").value = emp_num;

	    // 창을 종료합니다.
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
 		memberSearch();
		// 검색입력창을 초기화한다
 		$('#content').val("");
	}// end if
});// end function

//기능 함수 종료

});// end 함수
</script>
</body>
</html>
