<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
  <link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
</head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">사원 정보 조회</h1>
					<ol class="breadcrumb mb-4">
						<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
						<!--                             <li class="breadcrumb-item active">Tables</li> -->
					</ol>
					<div class="bnt">
						<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
						<input type="button" value="사원등록" onclick="memberInsert()">
						</c:if>
					</div>
					
					<div class="card mb-4">
					
						<div class="card-header">

                             <div class="cardHeaderFirstLine">
							<input type="button" name="allList" value="전체목록" onclick="location.reload();">&nbsp;
							<select id="category">
  								<option value="emp_name">이름</option>
  								<option value="position">직급</option>
  								<option value="hotline">내선번호</option>
  								<option value="dept_name">부서</option>
  								<option value="email">이메일</option>
							</select>&nbsp;
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content">&nbsp;
							<input type="button" name="search" value="조회" onclick="memberSearch()">
						</div>

						</div>
						
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
									<tr>
										<th>이름</th>
										<th>직급</th>
										<th>내선번호</th>
										<th>부서</th>
										<th>이메일</th>
										<th>생일</th>
										<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
										<th data-sortable="false">관리</th>
										</c:if>
									</tr>
								</thead>
								
								<tbody id="tbody">
									<c:forEach var="memberDTO" items="${memberList}">
										<tr>
											<td>${memberDTO.emp_name}</td>
											<td>${memberDTO.position}</td>
											<td>${memberDTO.hotline}</td>
											<td>${memberDTO.dept_name}</td>
											<td>${memberDTO.email}</td>
											<td>${memberDTO.birthdate }</td>
											<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
											<td><input type="button" value="수정"
												onclick="memberUpdate('${memberDTO.emp_num}')" id="updateEmp">
												<input type="button" value="삭제"
												onclick="memberDelete('${memberDTO.emp_num}')" id="deleteEmp">
												<input type="button" value="비밀번호 초기화"
												onclick="memberReset('${memberDTO.emp_num}')" id="resetEmp">
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
<!-- 	<script src="../resources/js/memberList_im.js"></script> -->
	
<script>
// Table 초기화를 위한 전역변수 선언
var simpleDataTableInstance;

// 테이블 초기화 함수
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

// 멤버 검색관련 함수
function memberSearch() {
		
		// 원래 매개변수로 전달할려했으나 처음에 언디파인드가 뜨는 문제가 있음 따라서 변수선언
 		var role = '${sessionScope.emp_role}';
 		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/member_ajax/search',
 			  data: JSON.stringify(json),
 	          contentType: 'application/json',
 			  type : 'POST',
 			  dataType: 'json',
			  
 			  success:function(json){
 				  	
 				   	// 아무것도 출력할게 없을때 선택자가 삭제되어 테이블을 더이상 초기화하지 못하는 문제가 있음
 				   	// 따라서 조건문으로 0개가 아닐때만 테이블을 삭제함
 				 	if(json.length !== 0){
				    	simpleDataTableInstance.destroy();
 				 	}
				    
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
 				            "<td>"+data.emp_name+"</td>",
 				           	"<td>"+data.position+"</td>",
 				         	"<td>"+data.hotline+"</td>",
 				         	"<td>"+data.dept_name+"</td>",
 				         	"<td>"+data.email+"</td>",
 				         	"<td>"+data.birthdate+"</td>",
 				            "<td>" +
 				          	"<input type='button' value='수정' onclick='memberUpdate(\"" + data.emp_num + "\")' id='updateEmp'>" +
 				            "<input type='button' value='삭제' onclick='memberDelete(\"" + data.emp_num + "\")' id='deleteEmp'>" +
 				            "<input type='button' value='비밀번호 초기화' onclick='memberReset(\"" + data.emp_num + "\")' id='resetEmp'>" +
 				            "</td>"
 				        	);
 				    	} else {
 				    		 $tr.append(
 		 				     "<td>"+data.emp_name+"</td>",
 		 				     "<td>"+data.position+"</td>",
 		 				     "<td>"+data.hotline+"</td>",
 		 				     "<td>"+data.dept_name+"</td>",
 		 				     "<td>"+data.email+"</td>",
 		 				     "<td>"+data.birthdate+"</td>",
 		 				     );
 				    	}
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

// 멤버 추가관련 함수
function memberInsert(){
	window.open('${pageContext.request.contextPath }/member/memberInsert', '_blank', 'width=590px, height=672px, left=600px, top=300px');
} //end function

function memberUpdate(emp_num){
	window.open('${pageContext.request.contextPath }/member/memberUpdate?emp_num='+emp_num, '_blank', 'width=600px, height=672px, left=600px, top=300px');
}
// 멤버 삭제관련 함수
function memberDelete(emp_num) {
	
	// sweetalert2 호출
	Swal.fire({
		   title: '사원 삭제',
		   text: '정말로 사원을 삭제 하시겠습니까?',
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
					  url : '${pageContext.request.contextPath}/member_ajax/delete',
					  data: {"emp_num": emp_num},
					  type : 'POST',
					  success:function(data){
							const result = $.trim(data);
							
							if(result == "true"){
							Swal.fire('삭제가 완료되었습니다.', '성공', 'success').then(result => {
								if(result.isConfirmed)
									// 완료 창을 닫으면 새로고침
									location.reload();
							});
							} else {
							Swal.fire('삭제에 실패헀습니다.', '실패', 'error');
							}
				      }// 콜백함수 종료지점
		       });// end_of_ajax
		  }// end_of_if(컨펌확인)
	  });// end_of_function(alert 콜백함수 종료지점)
}// end_of_function

//멤버 비밀번호 초기화 관련 함수
function memberReset(emp_num) {
	
	// sweetalert2 호출
	Swal.fire({
		   title: '비밀번호 초기화',
		   text: '정말로 사원의 비밀번호를 초기화 하시겠습니까?',
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
					  url : '${pageContext.request.contextPath}/member_ajax/reset',
					  data: {"emp_num": emp_num},
					  type : 'POST',
					  success:function(data){
							const result = $.trim(data);
							
							if(result == "true"){
							Swal.fire('사원의 비밀번호가 생일로 초기화 되었습니다.', '성공', 'success');
							} else {
							Swal.fire('초기화 과정에서 문제가 발생했습니다.', '실패', 'error');
							}
				      }// 콜백함수 종료지점
		       });// end_of_ajax
		  }// end_of_if(컨펌확인)
	  });// end_of_function(alert 콜백함수 종료지점)
}// end_of_function

//폼제출을 막고 엔터키로 조회가 가능하게 하는 함수
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
</script>
</body>
</html>
