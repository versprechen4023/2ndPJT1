<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<form action="${pageContext.request.contextPath}/factory/updateRequirement?req_code=${requirementDTO.req_code}" id="updateRequirement" method="POST">
<h1>소요량 수정</h1>

<table>
			<tr>
					<th>소요량 코드</th>
					<th>완제품 코드</th>
					<th>원자재 코드</th>
					<th>소요량</th>
<!-- 					<th>등록일</th> -->
<!-- 					<th>수정일</th> -->
					<th>비고</th>
			</tr>

<tr>
<!-- 소요량 코드 -->
<%-- <td>${requirementDTO.req_code } --%>
<td><input type="text" name="req_code" value="${requirementDTO.req_code }" id="req_code" readonly>
</td>
<!-- 완제품 코드 -->
<td><input type="text" name="prod_code" id="prod_code" value="${requirementDTO.prod_code }" ></td>
<!-- 원자재 코드 -->
<td><input type="text" name="raw_code" id="raw_code" value="${requirementDTO.raw_code }" ></td> 
<!-- 소요량 -->
<td><input type="text" name="req_amount" id="req_amount" value="${requirementDTO.req_amount }" > </td>
<!-- 등록일 -->
<%-- <td><input type="hidden" name="req_insertDATE" id="req_insertDATE" value="${requirementDTO.req_insertDATE }"> --%>
<%-- ${fn:substring(requirementDTO.req_insertDATE, 0, 10)}</td> --%>
<!-- 수정일 -->
<%-- <td><input type="date" name="req_upDATEDATE" id="req_upDATEDATE" value="${requirementDTO.req_upDATEDATE }"></td> --%>
<!-- 비고 -->
<td><input type="text" name="req_note" id="req_note" value="${requirementDTO.req_note }" ></td>
</tr>
</table>

		<!-- 등록 버튼 -->
		<div id="bottomContainer">
			<input type="submit" value="수정">
		</div>

</form>
</div>		
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 --> 

<input type="hidden" name="prod_name" id="prod_name" value="">
<input type="hidden" name="prod_taste" id="prod_taste" value="">
<input type="hidden" name="prod_price" id="prod_price" value="">

<input type="hidden" name="raw_name" id="raw_name" value="">
<input type="hidden" name="raw_type" id="raw_type" value="">
<input type="hidden" name="raw_price" id="raw_price" value="">	
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
       	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
   	
   	<script>
   	$(document).ready(function(){
   	 $('#updateRequirement').submit(function(event) {
//    	        event.preventDefault(); // 기본 제출 동작을 막습니다.
   	        // 유효성 검사
   		if($('#prod_code').val()==""){
   			Swal.fire('완제품을 선택해주세요.', '실패', 'error');
   			return false;
   		}
   		if($('#raw_code').val()==""){
   			Swal.fire('원재료를 선택해주세요.', '실패', 'error');
   			return false;
   		}
   		if($('#req_amount').val()==""){
   			Swal.fire('소요량을 입력해주세요.', '실패', 'error');
   			return false;
   		}
//    		if($('#req_insertDATE').val()==""){
//    			Swal.fire('등록일을 선택해주세요.', '실패', 'error');
//    			return false;
//    		}
//    		if($('#req_upDATEDATE').val()==""){
//    			Swal.fire('수정일을 선택해주세요.', '실패', 'error');
//    		}
//    		Swal.fire('등록되었습니다.', '성공', 'success');
//    		this.submit();
   		event.preventDefault();
   		
   	 	var formData = {     
   	 		req_code : $('#req_code').val(),
   	 		prod_code: $('#prod_code').val(),
        	raw_code: $('#raw_code').val(),
        	req_amount: $('#req_amount').val(),
//         	req_insertDATE: $('#req_insertDATE').val(),
//         	req_upDATEDATE: $('#req_upDATEDATE').val(),
        	req_note: $('#req_note').val()
    };
            
       	 $.ajax({
       		    type: "POST",
       		    url: "${pageContext.request.contextPath}/factoryCopy_ajax/updateRequirement",
       		    data: formData,
       		    success: function(response) {
       		    	const result = $.trim(response);
       		    	
       		        if (response === "true") {
       		            Swal.fire('정보 변경이 완료되었습니다.', '성공', 'success').then(result => {
       		                if (result.isConfirmed) {
       		                    window.opener.location.reload();
       		                    window.close();
       		                }
       		            });
       		        } else {
       		            Swal.fire('정보 변경이 실패했습니다.', '실패', 'error');
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

   // 원자재 팝업 리스트 
   $(document).on("click", "input[name='raw_code']", function() {
   	window.open('${pageContext.request.contextPath }/product/rawListPopUp', '_blank', 'width=700px, height=400px, left=600px, top=300px');
   });// end function

   // 완제품 팝업 리스트
   $(document).on("click", "input[name='prod_code']", function() {
   	window.open('${pageContext.request.contextPath }/product/productListPopUp', '_blank', 'width=700px, height=400px, left=600px, top=300px');
   });// end function
   </script>
   	
   	   
    </body>
</html>
