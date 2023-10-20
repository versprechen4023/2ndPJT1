<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
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
						<c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
						<input type="button" value="거래처 등록" onclick="buyInsert()">
						</c:if>
					</div>
					
					<div class="card mb-4">
					
						  <div class="card-header">
                    
                             <div class="cardHeaderFirstLine">
                            		
								<select id="category">
  									<option value="buy_code">코드</option>
  									<option value="buy_name">상호명</option>
  									<option value="buy_type">업종유형</option>
  									<option value="buy_phone">연락처</option>
  									<option value="buy_email">이메일</option>
								</select>&nbsp;
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content">&nbsp;
							<input type="button" name="search" value="조회" onclick="buySearch()">&nbsp;
							<input type="button" name="allList" value="전체목록" onclick="location.reload();">
                             </div>						  

						      </div>

						<div class="card-body">

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
										<th>우편번호</th>
										<th>주소</th>
										<th>email</th>
										<c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
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
                                            <td><a href="#" class="emp-num-link" data-emp-num="${buyDTO.emp_num}">${buyDTO.emp_num}</a></td>
											<td>${buyDTO.buy_type}</td>
											<td>${buyDTO.buy_phone}</td>
											<td>${buyDTO.buy_post}</td>
											<td>${buyDTO.buy_add}</td>
											<td>${buyDTO.buy_email}</td>
								
										
											<c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
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
	
<script type="text/javascript">

//Table 초기화를 위한 전역변수 선언
var simpleDataTableInstance;

//buy_phone 형식을 변경하는 함수
function formatBuyPhone() {
    var buyPhones = document.querySelectorAll("#datatablesSimple td:nth-child(5)");
    buyPhones.forEach(function (branchPhoneCell) {
        var buyPhone = buyPhoneCell.textContent.trim();
        var formattedPhone = buyPhone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        buyPhoneCell.textContent = formattedPhone;
    });
}
//buy_reg 형식을 변경하는 함수
function formatBuyReg() {
    var buyRegs = document.querySelectorAll("#datatablesSimple td:nth-child(3)");
    buyRegs.forEach(function (buyRegCell) {
        var buyReg = buyRegCell.textContent.trim();
        var formattedBuyReg = buyReg.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
        buyRegCell.textContent = formattedBuyReg;
    });
}

// 테이블 내용 형식화 함수
function formatTableContent() {
    formatBuyPhone();
    formatBuyReg();
}
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
      
     	 // 페이지 변경 이벤트를 수신하기 위한 리스너 추가
        simpleDataTableInstance.on('datatable.page', function () {
            formatTableContent(); // 페이지를 변경할 때 형식을 다시 적용합니다
        });
    
}//end function

// 돔이 로드될떄 테이블 초기화
window.addEventListener('DOMContentLoaded', event => {
	simpleDataTable();
});

// 멤버리스트 팝업 관련 함수
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


$(document).ready(function() {
    $("#emp_num").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        // var emp_num = $("input[name='emp_num']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#emp_num").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/member/memberList'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

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
 				    	if(role.charAt(1) === '1'){
 				        	$tr.append(
 				            "<td>"+data.buy_code+"</td>",
 				           	"<td>"+data.buy_name+"</td>",
 				         	"<td>"+data.buy_reg+"</td>",
 				         	"<td>"+data.buy_ceo+"</td>",
 				         	"<td>"+data.buy_emp+"</td>",
				         	'<td><a href="#" class="emp-num-link" data-emp-num="' + data.emp_num + '">' + data.emp_num + '</a></td>',    				            
 				         	"<td>"+data.buy_type+"</td>",
 				         	"<td>"+data.buy_phone+"</td>",
 				         	"<td>"+data.buy_post+"</td>",
 				         	"<td>"+data.buy_add+"</td>",
 				         	"<td>"+data.buy_email+"</td>",
 				            "<td>" +
 				          	"<input type='button' value='수정' onclick='buyUpdate(\"" + data.buy_code + "\")' id='updateBuy'>" +
 				          	"&nbsp;"+
 				            "<input type='button' value='삭제' onclick='buyDelete(\"" + data.buy_code + "\")' id='deleteBuy'>" +
 				            "</td>"
 				        	);
 				    	} else {
 				    		 $tr.append(
 						            "<td>"+data.buy_code+"</td>",
 		 				           	"<td>"+data.buy_name+"</td>",
 		 				         	"<td>"+data.buy_reg+"</td>",
 		 				         	"<td>"+data.buy_ceo+"</td>",
 		 				         	"<td>"+data.buy_emp+"</td>",
 	    				         	'<td><a href="#" class="emp-num-link" data-emp-num="' + data.emp_num + '">' + data.emp_num + '</a></td>',    				            
 		 				         	"<td>"+data.buy_type+"</td>",
 		 				         	"<td>"+data.buy_phone+"</td>",
 		 				         	"<td>"+data.buy_post+"</td>",
 		 				         	"<td>"+data.buy_add+"</td>",
 		 				         	"<td>"+data.buy_email+"</td>"
 		 				     );
 				    	}
 				        // 생성한 <tr> 요소를 tbody에 추가
 				        $('tbody').append($tr);
 				    });
 				    
 				   // 테이블 재생성 마찬가지로 데이터가있는 경우에만 객체 재생성
  				   if(json.length !== 0){
  					   formatBuyPhone();
  	                   formatBuyReg();
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
function buyInsert(){
	window.open('${pageContext.request.contextPath }/buy/buyInsert', '_blank', 'width=620px, height=598px, left=600px, top=300px');
} //end function

function buyUpdate(buy_code){
	window.open('${pageContext.request.contextPath }/buy/buyUpdate?buy_code='+buy_code, '_blank', 'width=570px, height=641px, left=600px, top=300px');
}
// 멤버 삭제관련 함수
function buyDelete(buy_code) {
	
	// sweetalert2 호출
	Swal.fire({
		   title: '구매처 삭제',
		   text: '정말로 등록된 구매처를 삭제 하시겠습니까?',
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
					  data: {"buy_code": buy_code},
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


// buy_phone 형식을 000-0000-0000으로 변경하는 함수
function formatBuyPhone() {
    var buyPhones = document.querySelectorAll("#datatablesSimple td:nth-child(8)");
    buyPhones.forEach(function (buyPhoneCell) {
        var buyPhone = buyPhoneCell.textContent.trim();
        var formattedPhone = buyPhone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        buyPhoneCell.textContent = formattedPhone;
    });
}


// 페이지 로드 시 호출하여 전체 테이블의 buy_phone 형식 변경
window.addEventListener("load", function () {
    formatBuyPhone();
});

//branch_reg 형식을 XXX-XX-XXXXX로 변경하는 함수
function formatBranchReg() {
    var branchRegs = document.querySelectorAll("#datatablesSimple td:nth-child(3)");
    branchRegs.forEach(function (branchRegCell) {
        var branchReg = branchRegCell.textContent.trim();
        var formattedBranchReg = branchReg.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
        branchRegCell.textContent = formattedBranchReg;
    });
}

// 페이지 로드 시 호출하여 전체 테이블의 branch_reg 형식 변경
window.addEventListener("load", function () {
    formatBranchReg();
});


//엔터키 입력시 검색되게 이벤트 리스너 활성화
document.addEventListener("keyup", function(event) {
    if (event.key === 'Enter') {
    	buySearch();
    }// end if
});// end function
</script>
</body>
</html>