<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아이스마일</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
</style>
</head>

<body class="sb-nav-fixed">
	<form
		action="${pageContext.request.contextPath }/warehouse/warehouseAdd"
		id="warehouseAdd" name="warehouseAdd" method="post">
		<h1>창고 추가</h1>
		<table border="1" id="whTable">
			<tr>
				<th>창고 코드</th>
				<th>창고 이름</th>
				<th>창고 종류</th>
				<th>창고 위치</th>
				<th>창고 전화번호</th>
				<th>완제품 코드</th>
				<th>원자재 코드</th>
				<th>창고 담당자</th>
				<th>비고</th>
			</tr>

			<tr>
				<!-- 코드 -->
				<td><input type="text" name="wh_code" size="11"></td>
				<!-- 이름 -->
				<td><input type="text" name="wh_name" size="7"></td>
				<!-- 종류 -->
				<td><select class="wh_type" name="wh_type">
						<option value="1">--선택--</option>
						<option value="2">R:원자재</option>
						<option value="3">R:완재품</option>			
				</select></td>
				<!-- 위치 -->
				<td><input type="text" name="wh_location" size="7"></td>
				<!-- 전화번호 -->
				<td><input type="text" name="wh_phone" size="11"></td>
				<!-- 완제품 코드 -->
				<td><input type="text" name="prod_code"></td>
				<!-- 원자재 코드 -->
				<td><input type="text" name="raw_code" size="11"></td>
				<!-- 담당자 -->
				<td><input type="text" name="emp_num" size="5"></td>
				<!-- 비고 -->
				<td><input type="text" name="wh_note" size="6"></td>
				
				
				<div>
				<button id="add" >추가</button>
				<button type="reset" id="cancle" >취소</button>
				<button type="submit" id="save" >저장</button>
				</div>
				
			</tr>

		</table>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/datatables-simple-demo.js"></script>
	
	
	<script type="text/javascript">   
	//============================ 버튼 구현 ====================================//	
	//추가//////////////////////////////////////////////////
	
	// 추가 시 필요한 변수들
    var counter = 0;
    var codeNum = 0;
   	var whCode = 0;
		
   	    //id="add"를 클릭시
       	$('#add').click(function () {
			
       		//수정버튼과 삭제버튼을 비활성화 상태로 만드는것
        	event.preventDefault();
        	$('#modify').attr("disabled", true);
			$('#delete').attr("disabled", true);       		
       		
			//
			$.ajax({
				//요청할 url을 입력 
				url: "/warehouse/whCode",
				//http 메서드를 get으로 하겠다
				method: "GET",
				//응답 데이터의 예상 데이터 유형을 지정
	 			dataType: "text",
	 			//요청이 성공했을 때 실행할 함수를 정의합니다.서버로부터 응답 데이터는 'data'메개변수로 전달된다.
	 			success: function (data) {
	 				 // Ajax 요청 안에서 데이터를 받아와서 변수에 할당 및 후속 작업 수행	 				
	 				codeNum = data;
	 				 //디버깅 목적으로 사용 값을 받아오는지 확인하기 위해서
	 				 console.log("Ajax 내부에서의 codeNum:", codeNum); // Ajax 내부에서의 codeNum: [받아온 데이터]
			
					// 변수에 할당된 데이터를 기반으로 추가 작업 수행
 				    someFunction(codeNum);
	 			
	 			}//success
			
			})//ajax
			
			
			
			//위에서 someFunction의 추가 작업을 위한 함수
			function someFunction(data) {
				 codeNum = data; // 외부에서의 codeNum: [받아온 데이터]
				 
				 //여기서 우리는 마지막에 완제품인지 아니면 원자제인지를 구분하기 위한 마지막 철자가 들어가므로 가져올 구역을 지정해준다.
				 var num = parseInt(codeNum.substring(2,6)) + counter+1; // 문자열을 숫자로 변환하여 1 증가
				 
				 // number: 패딩할 숫자입니다. 이 경우 num 변수의 값을 사용합니다.
                 // length: 패딩된 숫자의 길이를 나타내는 값으로, codeNum.length - 2 값이 사용됩니다.
                 // 이는 패딩된 숫자가 얼마나 길어질지를 결정하는데 사용됩니다.
				 var paddedNum = padNumber(num, codeNum.length - 2); // 숫자를 패딩하여 길이 유지
				 
				 //codeNum의 문자를 합쳐주는것 
	             whCode = codeNum.charAt(0)+ codeNum.charAt(1) + paddedNum.toString()+codeNum.charAt(6); // 패딩된 숫자를 다시 문자열로 변환
	             
	             
	             if ($('#add').hasClass('true')) {
	             //행을 추가해주는 함수
	             addRow();
	          	$('#add').removeClass('true');
	             }
	             
	             //카운터 변수에 1을 더해서 추가된 행의 수를 추적하는 변수 다음 행의 번호 또는 관련 전보를 관리하는 데 사용되어진다.
	             counter++;
			} // someFunction(data)
			
			
			 
			//0을 추가하는 함수
			//number는 패딩할 숫자
			//length 패딩된 결과로 얻고자 하는 숫자의 길이
			function padNumber(number, length) {
				//number 매개변수를 문자열로 변환하여 paddedNumber에 저장하는 것
                var paddedNumber = number.toString();
				//0을 추가 해주는 역활
                while (paddedNumber.length < length) {
                    paddedNumber = "0" + paddedNumber;
                }
                return paddedNumber;
        } // padNumber(number, length)
        
        
        
        	// 저장 -> 저장
			$('#save').click(function () {
				
				var wh_code = $('#wh_code').val();
				var wh_name = $('#wh_name').val();
				var wh_type = $('#wh_type').val();
				var wh_location = $('#wh_location').val();
				var wh_phone = $('#wh_phone').val();
				var prod_code = $('#prod_code').val();
				var raw_code = $('#raw_code').val();
				var emp_num = $('#emp_num').val();
				var wh_note = $('#wh_note').val();
				
				if(wh_code == "" || wh_name == "" || wh_type == "" ||
				   wh_location == "" || wh_phone == "" || prod_code == "" || raw_code == ""|| 
				   raw_code == "" || emp_num == "" ){
					
					Swal.fire({
						title: "<div style='color:#495057;font-size:20px;font-weight:lighter'>" + "항목을 모두 입력하세요"+ "</div>",
						icon: 'info',
						width: '300px',
					})
					
					
				}else{
					$('#warehouseAdd').attr("action", "/warehouse/warehouseAdd");
					$('#warehouseAdd').attr("method", "POST");
					$('#warehouseAdd').submit();
				}
				
			}); // save
        
	});//add.click
		
	
	
        // 추가 버튼 클릭 시 row 생성
        function addRow() {
        	
			var row = "<tr>";
			
			// 창고코드
			row += "<td>";
			row += "<input type='text' name='wh_code' id='wh_code' required value='"+whCode+"' size="11" class='input-fieldb'>";
			row += "</td>";
			
			// 창고이름
			row += "<td>";
			row += "<input type='text' name='wh_name' id='wh_name' size="7" required class='input-fieldb'>";
			row += "</td>";
			
			// 창고종류
			row += "<td>";
			row += "<select name='wh_type' id='wh_type'";
			row += "<option value="선택">--선택--</option>";
			row += "<option value="원자재">R:원자재</option>";
			row += "<option value="완재품">R:완재품</option>";
			row += "</select>";
			row += "</td>";
			
			// 위치 
			row += "<td>";
			row += "<input type='text' name="wh_location" size="7" id='wh_location' required class='input-fieldb'>";
			row += "</td>";
			
			// 전화번호
			row += "<td>";
			row += "<input type='text' name="wh_phone" size="11" id='wh_phone' required class='input-fieldb'>";
			row += "</td>";
			
			// 완제품 코드
			row += "<td>";
			row += "<input type="text" name="prod_code">"
			row += "</td>";
			
			// 원자재 코드
			row += "<td>";
			row += "<input type="text" name="raw_code" size="11">"
			row += "</td>";
			
			// 담당자
			row += "<td>";
			row += "<input type="text" name="emp_num" size="5">"
			row += "</td>";
			
			// 비고
			row += "<td>";
			row += "<input type="text" name="wh_note" size="6">"
			row += "</tr>";
			
            $('#whTable').append(row);		
		} // addRow()
            
	
			// 취소버튼(=리셋)
			$('#cancle').click(function () {
				$('#fr').each(function () {
					this.reset();
				});
			}); // cancle click	
	</script>
</body>
</html>
