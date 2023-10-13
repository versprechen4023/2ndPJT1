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
	  	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 		<link href="../resources/css/addTableHorizontal.css" rel="stylesheet" />
</head>	


<body>
	<div id ="container">		
	<form action="${pageContext.request.contextPath}/shipping/inMaterialInsert" id="inMaterialInsert" method="POST">
		<h1>입고 추가</h1>

		<table border="1">
		<tr>
				<!-- <th>입고코드</th> -->
				<th>창고코드</th>
				<th>발주코드</th>
				<th>담당자</th>
				<th>거래처코드</th>
				<th>입고현황</th>
		</tr>
		<tr>
				<!-- 입고 코드 -->
				<!-- <td><input type="text" name="in_code" id="in_code" size="12"></td> -->
				<td><input type="text" name="in_wh_code" id="in_wh_code" ></td>  <!-- 입고 창고 코드 -->
				<td><input type="text" name="raw_order_code" id="raw_order_code"  ></td>  <!-- 발주 코드 -->
				<td><input type="text" name="emp_num" id="emp_num" ></td>  <!-- 입고 담당자 -->
				<td><input type="text" name="buy_code" id="buy_code"></td>
				<td><input type="text" value="입고전" readonly></td>
		</tr>
		</table>

			<!-- 등록 버튼 -->
			<div id="bottomContainer">
				<input type="submit" id="btn" value="추가">
			</div>

		</form>                
    	</div>
            
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  

<input type="hidden" name="buy_name" id="buy_name">

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
	 $('#inMaterialInsert').submit(function(event) {
// 	        event.preventDefault(); // 기본 제출 동작을 막습니다.
// 		alert("실행됨");
	        // 유효성 검사
// 		if($('#in_code').val()==""){
// 			Swal.fire('입고 코드를 입력해주세요.', '실패', 'error');
// 			return false;
// 		}
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
// 		Swal.fire('등록되었습니다.', '성공', 'success');
// 		this.submit();
		event.preventDefault();
		
	 	var formData = new FormData(this);
         
    	 $.ajax({
    		    type: "POST",
    		    url: "${pageContext.request.contextPath}/Shipping_ajax/inMaterialInsert",
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

//매입처 팝업 리스트
$(document).on("click", "input[name='buy_code']", function() {
	window.open('${pageContext.request.contextPath }/buy/buyListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
})

</script>
</body>
</html>