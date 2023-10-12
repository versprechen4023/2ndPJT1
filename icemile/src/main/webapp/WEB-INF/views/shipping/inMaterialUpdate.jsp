<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	
	<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 높이 100%로 설정하여 수직 중앙 정렬 */
	margin: 0; /* 페이지 바깥 여백 제거 */
}
#btn {
	text-align: center; /* 가로 중앙 정렬 */
	margin: 20px; /* 버튼 간격 설정 */
	font-size: 16px; /* 버튼 텍스트 크기 설정 */
	padding: 5px 20px; /* 버튼 안 여백 설정 */
}
</style>
</head>

<body class="sb-nav-fixed">
	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 헤더 -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
<main>
<h1>입고 수정</h1>

<form action="${pageContext.request.contextPath}/shipping/updateInMaterial?in_code=${inMaterialDTO.in_code}" id="updateInMaterial" method="POST">

<table border="1">
<tr>
<th>입고코드</th>
<th>창고코드</th>
<th>발주코드</th>
<th>담당자</th>
<th>입고현황</th>
<!-- <th>수정일</th> -->
<!-- <th>비고</th> -->
</tr>


<tr>
<!-- 입고 코드 -->
<td>${inMaterialDTO.in_code }
<input type="hidden" name="in_code" value="${inMaterialDTO.in_code }" id="in_code"></td>
<!-- 창고 코드 -->
<td><input type="text" name="in_wh_code" value="${inMaterialDTO.in_wh_code }" id="in_wh_code" size="11"></td>
<!-- 발주 코드 -->
<td><input type="text" name="raw_order_code" value="${inMaterialDTO.raw_order_code }" id="raw_order_code" size="11"></td> 
<!-- 입고 담당자 -->
<td><input type="text" name="emp_num" value="${inMaterialDTO.emp_num }" id="emp_num" size="7"></td>
<!-- 입고 현황 -->
<td><select name="in_status" id="in_status">
	<option >현황 선택</option>
   	<option value="1">입고전</option>
    <option value="2">입고중</option>
    <option value="3">입고확정</option>
		</select> 
</td>
</tr>

</table>
		<div id="btn">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</div>
</form>
	
	</main>
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
       	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
        
        <script>
        
      //정규식 제어함수
$(document).ready(function(){
        	 $('#updateInMaterial').submit(function(event) {
//         	        event.preventDefault(); // 기본 제출 동작을 막습니다.
//         		alert("실행됨");
        	        // 유효성 검사
//         		if($('#in_code').val()==""){
//         			Swal.fire('입고 코드를 입력해주세요.', '실패', 'error');
//         			return false;
//         		}
        		if($('#in_wh_code').val()==""){
        			Swal.fire('창고 코드를 선택해주세요.', '실패', 'error');
        			return false;
        		}
        		if($('#raw_order_code').val()==""){
        			Swal.fire('발주 코드를 선택해주세요.', '실패', 'error');
        			return false;
        		}
        		if($('#emp_num').val()==""){
        			Swal.fire('담당자를 선택해주세요.', '실패', 'error');
        			return false;
        		} 
        		if($('#buy_code').val()==""){
        			Swal.fire('거래처를 선택해주세요.', '실패', 'error');
        			return false;
        		} 
//         		Swal.fire('등록되었습니다.', '성공', 'success');
//         		this.submit();
        		event.preventDefault();
        		
        	 	var formData = new FormData(this);
                 
            	 $.ajax({
            		    type: "POST",
            		    url: "${pageContext.request.contextPath}/Shipping_ajax/updateInMaterial",
            		    data: formData,
            		    contentType: false,
            		    processData: false,
            		    success: function(response) {
            		        if (response === "true") {
            		            Swal.fire('정보 입력이 완료되었습니다.', '성공', 'success').then(result => {
            		                if (result.isConfirmed) {
            		                    window.opener.location.reload();
            		                    window.close();
            		                }
            		            });
            		        } else {
            		            Swal.fire('정보 입력에 실패했습니다.', '실패', 'error');
            		        }
            		    },
            		    error: function() {
            		        Swal.fire('서버 통신에 문제가 발생했습니다.', '실패', 'error');
            		    }
            		});
            	
            });
        });//submit기능 제어 끝

        function openUpdate() {
        }

        // 창고 팝업 리스트
        $(document).on("click", "input[name='in_wh_code']", function() {
        	window.open('${pageContext.request.contextPath }/warehouse/inWhListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
        });

        // 발주 코드 팝업 리스트
        $(document).on("click", "input[name='raw_order_code']", function() {
        	window.open('${pageContext.request.contextPath }/buyOrder/rawOrderListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
        });

        //담당자 팝업 리스트
        $(document).on("click", "input[name='emp_num']", function() {
        	window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
        });
        
        
        
        
        </script>
        
      
    </body>
</html>
