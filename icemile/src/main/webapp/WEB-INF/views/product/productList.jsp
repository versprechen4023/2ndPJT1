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
                        <c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
							<input type="button" value="품목추가" onclick="productAdd()">
							<input type="button" value="취소" id="cancelButton">
							<input type="button" value="수정" id="updateProd">
							<input type="button" value="삭제" id="deleteProd">
							<input type="button" value="저장" id="saveProd">
						</c:if>
                        </div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllProId"></th>
                                            <th>코드</th>
                                            <th>품명</th>
                                            <th>종류</th>
                                            <th>단위</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                            <th>유통기한</th>
                                            <th>매입처코드/지점코드</th>
                                            <th>창고코드</th>
                                            <th>비고</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="productAllDTO" items="${productList}">
                                        <tr>
                                        	<td><input type="checkbox" name="selectedProId" value="${productAllDTO.prod_code}"></td>
                                            <td>${productAllDTO.prod_code}</td>
                                            <td>${productAllDTO.prod_name}</td>
                                            <td>${productAllDTO.prod_type}</td>
                                            <td>${productAllDTO.prod_unit}</td>
                                            <td>${productAllDTO.prod_amount}</td>
                                            <td>${productAllDTO.prod_price}</td>
                                            <td>${productAllDTO.prod_exp}</td>
                                            <td>${productAllDTO.deal_code}</td>
                                            <td>${productAllDTO.wh_code}</td>
                                            <td>${productAllDTO.prod_note}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
</form>
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
	<script src="../resources/js/productList_im.js"></script>
<script>
//수정 버튼 누를 시
$("#updateProd").click(function(){
	
	// 체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='selectedProId']:checked");
	
	// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	if (selectedCheckbox.length === 1) {
		
		// 텍스트태그를 추가할 tr태그를 선택한다
		var row = selectedCheckbox.closest("tr");
		
		// input type의 name 값 지정
		var cellNames = [
			"prod_code", 
			"prod_name", 
			"prod_type", 
			"prod_unit",
			"prod_amount",
			"prod_price",
			"prod_exp",
			"deal_code",
			"wh_code",
			"prod_note"
		];
		
		// input type의 id 값 지정
		var cellIds = [
			"prod_code", 
			"prod_name", 
			"prod_type", 
			"prod_unit",
			"prod_amount",
			"prod_price",
			"prod_exp",
			"deal_code",
			"wh_code",
			"prod_note"
		];
		
		
		// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
		row.find("td:not(:first-child)").each(function(index) {
			
			// 기존 텍스트 값을 변수에 저장한다
			var cellValue = $(this).text();
			// 삼항연산자 0번째 행(코드)와 2번째행(종류)는 리드온리로 변경할 수 없다
			var cellOption = index === 0 || index === 2 ? "readonly" : "";
			// 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
			var cellName = cellNames[index];
			// 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
			var cellId = cellIds[index];
			
			// 반복문에 따라 이너 html 실행 모든 입력칸을 텍스트태그로 바꾼다
			$(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');
		});
		
	}else if (selectedCheckbox.length === 0){
		Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
		
	}else {
		Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');;
	}
});

// 취소 버튼 누를 시 
$("#cancelButton").click(function(){
		
		// 테이블 모든행에 따라 반복작업 실행
		$("#datatablesSimple tr").each(function() {
		// 행 위치를 얻기위한 변수선언
		var row = $(this);
		// 폼태그안의 모든 데이터를 초기값으로 리셋한다
		$("#productList")[0].reset();
		
			// 각 셀의 값을 원래 상태로 되돌린다(마찬가지로 첫번째 셀은 제외한다)
			row.find("td:not(:first-child)").each(function(index) {
				// 텍스트 태그의 값을 찾는다
				var cellValue = $(this).find("input").val();
				// 텍스트 태그를 삭제하고 값만 td태그에 삽입한다
				$(this).html(cellValue);
			});
		
		
		});
	
});

// 저장 버튼 누를시
$("#saveProd").click(function() {
    		
    	 // 폼 데이터 직렬화
    	 var formData = $('#productList').serialize();
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/product_ajax/productUpdate",
             data: formData,
             success: function(response) {
            	 
            	 const result = $.trim(response);
            	 
                 if (result == "true") {
                	 Swal.fire('품목 수정이 완료되었습니다.', '성공', 'success').then(result => {
					 	if(result.isConfirmed)
					 		location.reload(); // 성공 시 새로고침
					 });
                 } else {
                	 Swal.fire('품목 수정에 문제가 발생했습니다.', '실패', 'error');
                 }
             },
             error: function () {
            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             }
         });
    
});

//삭제 버튼 누를시
$("#deleteProd").click(function() {
	
	// 체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='selectedProId']:checked");
	
	if (selectedCheckbox.length === 0){
		Swal.fire('삭제할 행을 선택해 주십시오.', '실패', 'error');
	} else {
    	 // 폼 데이터 직렬화
    	 var formData = $('#productList').serialize();
         
         $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/product_ajax/productDelete",
             data: formData,
             success: function(response) {
            	 
            	 const result = $.trim(response);
            	 
                 if (result == "true") {
                	 Swal.fire('품목 삭제가 완료되었습니다.', '성공', 'success').then(result => {
					 	if(result.isConfirmed)
					 		location.reload(); // 성공 시 새로고침
					 });
                 } else {
                	 Swal.fire('품목 삭제에 문제가 발생했습니다.', '실패', 'error');
                 }
             },
             error: function () {
            	 Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             }
         });
	}
});
function productAdd(){
	window.open('${pageContext.request.contextPath }/product/productAdd', '_blank', 'width=1500px, height=450px, left=200px, top=300px');
} //end function
</script>
    </body>
</html>
