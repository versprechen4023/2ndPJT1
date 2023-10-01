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
					<h1 class="mt-4">거래처 관리</h1>
					<ol class="breadcrumb mb-4">
						<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
						<!--                             <li class="breadcrumb-item active">Tables</li> -->
					</ol>
					<div class="bnt">
						<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
						<input type="button" value="거래처 등록" onclick="buyInsert()">
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
  								<option value="buy_code">코드</option>
  								<option value="buy_name">상호명</option>
  								<option value="buy_type">업종유형</option>
  								<option value="buy_phone">연락처</option>
  								<option value="buy_email">이메일</option>
							</select>
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="buySearch()">
							<table id="datatablesSimple">
								<thead>
									<!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
									<tr>
										<th>코드</th>
										<th>상호명</th>
										<th>사업자등록번호</th>
										<th>대표자</th>
										<th>담당자</th>
										<th>구매담당자</th>
										<th>업종유형</th>
										<th>연락처</th>
										<th>주소</th>
										<th>email</th>
										<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
										<th data-sortable="false">관리</th>
										</c:if>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="buyDTO" items="${buyList}">
										<tr>
											<td>${buyDTO.buy_code}</td>
											<td>${buyDTO.buy_name}</td>
											<td>${buyDTO.buy_reg}</td>
											<td>${buyDTO.buy_ceo}</td>
											<td>${buyDTO.buy_emp}</td>
											<td>${buyDTO.emp_num}</td>
											<td>${buyDTO.buy_type}</td>
											<td>${buyDTO.buy_phone}</td>
											<td>${buyDTO.buy_add}</td>
											<td>${buyDTO.buy_email}</td>
								
										
											<c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }">
											<td><input type="button" value="수정"
												onclick="buyUpdate('${buyDTO.buy_code}')" id="updateBuy">
												<input type="button" value="삭제"
												onclick="buyDelete('${buyDTO.buy_code}')" id="deleteBuy">
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
	<script src="../resources/js/buyList_im.js"></script>
	
<script>
// 멤버 검색관련 함수
function buySearch() {
		
		// 원래 매개변수로 전달할려했으나 처음에 언디파인드가 뜨는 문제가 있음 따라서 변수선언
 		var role = '${sessionScope.emp_role}';
 		
	   // 값 전달 하기위한 JSON 타입 변수선언
	   var json = {
        			category: $('#category').val(),
        			content: $('#content').val()
       			  };
	
	   // 검색 결과값을 받아오기 위한 ajax 호출
 	   $.ajax({
 			  url : '${pageContext.request.contextPath}/buy_ajax/search',
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
 				          	"<input type='button' value='수정' onclick='buyUpdate(\"" + data.emp_num + "\")' id='updateEmp'>" +
 				            "<input type='button' value='삭제' onclick='buyDelete(\"" + data.emp_num + "\")' id='deleteEmp'>" +
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
function buyInsert(){
	window.open('${pageContext.request.contextPath }/buy/buyInsert', '_blank', 'width=600px, height=1000px, left=600px, top=300px');
} //end function

function buyUpdate(emp_num){
	window.open('${pageContext.request.contextPath }/buy/buyUpdate?emp_num='+emp_num, '_blank', 'width=600px, height=1000px, left=600px, top=300px');
}
// 멤버 삭제관련 함수
function buyDelete(emp_num) {
	
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
					  url : '${pageContext.request.contextPath}/buy_ajax/delete',
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
    	buySearch();
    }// end if
});// end function
</script>
</body>
</html>