<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
</head>
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
  								<option value="email">이메일</option>
							</select>
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="memberSearch('${sessionScope.emp_role}')">
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
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/memberList_im.js"></script>
	
<script>
// 멤버 검색관련 함수
function memberSearch(role) {
	   alert(role);
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
 		      }// 콜백함수 종료지점
      });// end_of_ajax
}// end function

// 멤버 추가관련 함수
function memberInsert(){
	window.open('${pageContext.request.contextPath }/member/memberInsert', '_blank', 'width=600px, height=1000px, left=600px, top=300px');
} //end function

function memberUpdate(emp_num){
	window.open('${pageContext.request.contextPath }/member/memberUpdate?emp_num='+emp_num, '_blank', 'width=600px, height=1000px, left=600px, top=300px');
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

//엔터키 입력시 검색되게 이벤트 리스너 활성화
document.addEventListener("keyup", function(event) {
    if (event.key === 'Enter') {
    	memberSearch();
    }// end if
});// end function
</script>
</body>
</html>
